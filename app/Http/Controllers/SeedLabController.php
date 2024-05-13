<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\SeedLab;
use Illuminate\Http\Request;
use App\Models\FormStockExaminationRequest;
use App\Models\Utils;
use App\Models\StockRecord;
use App\Models\MarketableSeed;

class SeedLabController extends Controller
{
   
    public function index()
    {
              // Retrieve all SeedLab instances
              $forms = SeedLab::all();
              // Return a collection of SeedLab resources
              return response()->json($forms);
    }

   
    public function store(Request $request)
    {
  
           // Validate incoming request
           $data = $request->all();
        
           $stock_examination = FormStockExaminationRequest::find($request->form_stock_examination_request_id);
           if (!$stock_examination) {

               
               return response()->json(['message' => 'You don\'t have any valid stock examination request. First apply for Stock Examination, wait till your application is accepted, and then return here.']);
           }
           else{
                $data['lot_number'] = $stock_examination->lot_number;
                
           }

            // Store the uploaded photo
            if ($request->has('payment_receipt')) {
            $photoPath = Utils::storeUploadedPhoto($request->input('payment_receipt')); 
            $data['payment_receipt'] = $photoPath;
            }

            $form = SeedLab::create($data);

            // Return a single SeedLab resource
            return response()->json($form);
    }

   
    public function show($id)
    {
        
         $form = SeedLab::where('administrator_id', $id)->get();
       
         return response()->json($form);
    }

    
    public function update(Request $request, $id)
    {
         
         $data = $request->all();
        
        // Find the SeedLab instance
        $form = SeedLab::find($id);

        if ($request->has('payment_receipt')) {
            $photoPath = Utils::storeUploadedPhoto($request->input('payment_receipt')); 
            $data['payment_receipt'] = $photoPath;
        }


        // Update the SeedLab instance
        $form->update($data);

        // Return a single SeedLab resource
        return response()->json($form);
    }

   
    public function destroy($id)
    {

        $form =  SeedLab::find($id);
        $form->delete();

    
        return response()->json(['message' => 'Form deleted successfully']);
    }

        //get the inspections assigned to an inspector
        public function getAssignedForms($id)
        {
            $forms = SeedLab::where('inspector_id', $id)->get();

            return response()->json($forms);
        }

        //get the inspections that have been sent to the lab
        public function getFormsSentToLab()
        {
            $forms = SeedLab::where('status', 10)->get();

            return response()->json($forms);
        }

        //function to update the lab results
        public function updateLabResults(Request $request, $id)
        {
            try {
                // Validate incoming request data
                $validatedData = $request->validate([
                    'purity' => 'required',
                    'germination_capacity' => 'required',
                    'report_recommendation' => 'required',

                ]);
            
                // Find the SeedLab instance by ID
                $form = SeedLab::findOrFail($id);

                // Extract necessary data from the request
                $data = $request->all();
                $purity = (int) $data['purity'];
                $germination_capacity = (int) $data['germination_capacity'];
                $p_x_g = (($purity * $germination_capacity) / 100);

                // Update data array with calculated values and status
                $data['p_x_g'] = $p_x_g;
                $data['status'] = 5;

                if($data['report_recommendation'] == '11')
                {

                        //saving to the stock records
                        $StockRecord = new StockRecord();
                        $StockRecord->administrator_id = $form->administrator_id;
                        $StockRecord->crop_variety_id = $form->crop_variety_id;
                        $StockRecord->seed_lab_id = $form->id;
                        $StockRecord->is_deposit = 0;
                        $StockRecord->lot_number = $form->lot_number;
                        $StockRecord->seed_class = $form->seed_class;
                        $StockRecord->source = $form->source;
                        $StockRecord->is_transfer = 0;
                        $StockRecord->seed_class = null;
                        $StockRecord->source = null;
                        $StockRecord->quantity = $form->quantity;
                        $StockRecord->detail = "To seed lab. ID " . $form->id;
                        $StockRecord->save();


                        //saving to the marketable seed
                        $stock_out = new MarketableSeed();
                        $stock_out->administrator_id = $StockRecord->administrator_id;
                        $stock_out->crop_variety_id = $form->crop_variety_id;
                        $stock_out->seed_lab_id = $form->id;
                        $stock_out->seed_label_id = $form->seed_label_id;
                        $stock_out->lot_number = $form->lot_number;
                        $stock_out->quantity = $form->quantity;
                        $stock_out->seed_class = $form->seed_class;
                        $stock_out->source = $form->source;
                        $stock_out->detail = $form->detail;
                        $stock_out->is_deposit = 1;
                        $stock_out->seed_label_package_id = $form->seed_label_package_id;
                        $stock_out->lab_test_number = $form->lab_test_number;
                        $stock_out->save();
            
                }
               
               // Update the SeedLab instance
               $form->update($data);

               // Return updated SeedLab instance as JSON response
               return response()->json(['message' => 'Lab results updated successfully', 'data' => $form], 200);

           } catch (\Exception $e) {
               // Handle any exceptions and return error response
               return response()->json(['error' => $e->getMessage()], 500);
           }
       }
}
