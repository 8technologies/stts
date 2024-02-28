<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FormStockExaminationRequest;
use Illuminate\Http\Request;
use App\Models\ImportExportPermit;
use App\Models\SubGrower;
use App\Models\FormSr10;
use App\Models\Utils;

class StockExaminationController extends Controller
{
    
    public function index()
    {
        // Retrieve all FormStockExaminationRequest instances
        $forms = FormStockExaminationRequest::all();
        
        // Return a collection of FormStockExaminationRequest resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();

       if($request->import_export_permit_id != null)
       {
            $all_import_permits =  ImportExportPermit::where([
                'administrator_id' => $request->administrator_id,
                'is_import' => 1
            ])->get();
            
            if($all_import_permits->isEmpty())
            {
                    return response()->json('You cannot create a new Stock examination request if don\'t have a valid Import permit', 409);
            }
       }

       if($request->planting_return_id != null)
       {
            $SubGrowers =  SubGrower::where([
                        'administrator_id' => $request->administrator_id,
                        'status' => 5
                    ])->get();
                

            if($SubGrowers->isEmpty())
            {
                return response()->json('You cannot create a new Stock examination request if don\'t have an approved SR10', 409);

                
            }
       }

        if($request->form_qds_id != null)
        {
            $verified_qds_growers = FormSr10::where('administrator_id', $request->administrator_id)
            ->where('status', '=', 5)
            ->where('is_final', '=', 1)
            ->where('qds_declaration_id', '!=', null)
            ->get();
            if($verified_qds_growers->isEmpty())
            {
                return response()->json('You cannot create a new Stock examination request if don\'t have a valid QDS inspection', 409);
            }
        }

        // Create the main form instance
        $form = FormStockExaminationRequest::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        
        if($request->import_export_permit_id != null)
        {
                $all_import_permits =  ImportExportPermit::where([
                    'administrator_id' => $request->administrator_id,
                    'is_import' => 1
                ])->get();
                
                if($all_import_permits->isEmpty())
                {
                        return response()->json('You cannot create a new Stock examination request if don\'t have a valid Import permit', 409);
                }
        }

        if($request->planting_return_id != null)
        {
                $SubGrowers =  SubGrower::where([
                            'administrator_id' => $request->administrator_id,
                            'status' => 5
                        ])->get();
                    

                if($SubGrowers->isEmpty())
                {
                    return response()->json('<div class="alert alert-danger">You cannot create a new Stock examination request if don\'t have an approved SR10 </div>');

                    
                }
        }

        if($request->form_qds_id != null)
        {
            $verified_qds_growers = FormSr10::where('administrator_id', $request->administrator_id)
            ->where('status', '=', 5)
            ->where('is_final', '=', 1)
            ->where('qds_declaration_id', '!=', null)
            ->get();
            if($verified_qds_growers->isEmpty())
            {
                return response()->json('You cannot create a new Stock examination request if don\'t have a valid QDS inspection', 409);
            }
        }

         // Create the main form instance
         $form = FormStockExaminationRequest::find($id)->update($data);
     
         // Return the created main form instance
         return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = FormStockExaminationRequest::where('administrator_id', $id)->get();
        // Return the JSON response
        return response()->json($form);
    }
    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = FormStockExaminationRequest::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = FormStockExaminationRequest::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}