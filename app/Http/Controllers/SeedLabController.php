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
        
        $user = auth('api')->user();
        dd( $user);


        // if(auth()->user()->role == 'inspector')
        // {
                
        //     if ((($request->packaging * $request->number_of_units) > ($request->quantity)) || ($request->sample_weight > $request->quantity)) 
        //     {
        //         return admin_error("Alert", "You're attempting to test a sample that is more than what the applicant has in stock.
        //         <br>Please reduce your sample size and the packaging size as well.");
        //     }

        //     //get the available stock of the crop variety
        //     $stock_records = StockRecord::where([
        //         'administrator_id' => $form->administrator_id,
        //         'lot_number' => $form->lot_number,
        //     ])->get();
        
        //     $total_quantity = 0; 
        //     //get the total stock of that particular crop variety
        //     foreach ($stock_records as $key => $value) 
        //     {
        //         $total_quantity += ((int)($value->quantity));
        //     }
            
        //     $quantity = $request->quantity;
        //     //check if the quantity entered is more than the available stock
        //     if ($quantity > $total_quantity) 
        //     {
            
        //     return response()->json(['message' => 'You are attempting to test a sample that is more than what the applicant has in stock.']);
            
        //     }

        //     //check that the mother lot entered is valid and save its id as the parent id
        //     $mother = SeedLab::where('lot_number', $request->mother_lot)->first();
        

        //     if ($mother != null) 
        //     {
        //         if ($mother->crop_variety_id != $request->crop_variety_id) 
        //         {
        //             return response()->json(['message' => 'Crop variety of Mother lot number doesn\'t match with current crop variety.']);
        //         }

        //         $data['parent_id'] = $mother->id;
        //         $data['title'] = $request->lot_number;
        //         $data['order'] = $form->id;
        //         $data['temp_parent'] = 0;
        //     }
        //     if($form->status == '4'){
        //         $data['report_recommendation'] = 4;
        //     }
        //     $data['inspector_is_done'] = 0;
        // }

        // if(auth()->user()->role == 'lab_reception')
        // {
        //     $data['lab_technician_id'] = auth()->user()->id;
        //     $data['inspector_is_done'] = 1;
        //     $data['receptionist_is_done'] = 1;
    
        // }

        // if(auth()->user()->role == 'lab_technician')
        // {
            

        //     $purity = (int)($request->purity);
        //     $germination_capacity = (int)($request->germination_capacity);
        //     $p_x_g = (($purity * $germination_capacity) / 100);
            
        //     $data['p_x_g'] = $p_x_g;
        //     $data['status'] = 5;

        //     if($data['report_recommendation'] == '11')
        //     {

        //         //saving to the stock records
        //         $StockRecord = new StockRecord();
        //         $StockRecord->administrator_id = $form->administrator_id;
        //         $StockRecord->crop_variety_id = $form->crop_variety_id;
        //         $StockRecord->seed_lab_id = $form->id;
        //         $StockRecord->is_deposit = 0;
        //         $StockRecord->lot_number = $form->lot_number;
        //         $StockRecord->seed_class = $form->seed_class;
        //         $StockRecord->source = $form->source;
        //         $StockRecord->is_transfer = 0;
        //         $StockRecord->seed_class = null;
        //         $StockRecord->source = null;
        //         $StockRecord->quantity = $form->quantity;

        //         if ($StockRecord->quantity > 0)
        //         {
        //             $StockRecord->quantity = ((-1) * $StockRecord->quantity);
        //         }

        //         $StockRecord->detail = "To seed lab. ID " . $form->id;
        //         $StockRecord->save();


        //         //saving to the marketable seed
        //         $stock_out = new MarketableSeed();
        //         $stock_out->administrator_id = $StockRecord->administrator_id;
        //         $stock_out->crop_variety_id = $form->crop_variety_id;
        //         $stock_out->seed_lab_id = $form->id;
        //         $stock_out->seed_label_id = $form->seed_label_id;
        //         $stock_out->lot_number = $form->lot_number;
        //         $stock_out->quantity = $form->quantity;
        //         $stock_out->seed_class = $form->seed_class;
        //         $stock_out->source = $form->source;
        //         $stock_out->detail = $form->detail;
        //         $stock_out->is_deposit = 1;
        //         $stock_out->seed_label_package_id = $form->seed_label_package_id;
        //         $stock_out->lab_test_number = $form->lab_test_number;
        //         $stock_out->save();
            
        //     }
            
        

        // }

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
}
