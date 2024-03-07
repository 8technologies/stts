<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FormStockExaminationRequest;
use Illuminate\Http\Request;
use App\Models\ImportExportPermit;
use App\Models\SubGrower;
use App\Models\FormSr10;
use App\Models\ImportExportPermitsHasCrops;
use App\Models\CropVariety;
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
                    'is_import' => 1,
                    'status' => 5
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
         $form = FormStockExaminationRequest::find($id);
         $form->update($data);

         // Return the updated main form instance
         return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instances with related data
        $forms = FormStockExaminationRequest::where('administrator_id', $id)->get();
    
        $details = [];
    
        foreach ($forms as $form) {
            $SubGrowers = null;
            $verified_qds_growers = null;
            $all_import_permits = null;
    
            if ($form->planting_return_id != null) {
                $SubGrowers = SubGrower::find($form->planting_return_id);
            }
    
            if ($form->form_qds_id != null) {
                $verified_qds_growers = FormSr10::find($form->form_qds_id);
            }
    
            if ($form->import_export_permit_id != null) {
                $all_import_permits = ImportExportPermit::find($form->import_export_permit_id);
            }
    
            $details[] = [
                'form' => $form,
                'SubGrowers' => $SubGrowers,
                'verified_qds_growers' => $verified_qds_growers,
                'import_permits' => $all_import_permits
            ];
        }
    
        // Return the JSON response
        return response()->json($details);
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
        
           
                        $details = [];
    
                        foreach ($forms as $form) {
                            $SubGrowers = null;
                            $verified_qds_growers = null;
                            $all_import_permits = null;
                    
                            if ($form->planting_return_id != null) {
                                $SubGrowers = SubGrower::find($form->planting_return_id);
                            }
                    
                            if ($form->form_qds_id != null) {
                                $verified_qds_growers = FormSr10::find($form->form_qds_id);
                            }
                    
                            if ($form->import_export_permit_id != null) {
                                $all_import_permits = ImportExportPermit::find($form->import_export_permit_id);
                            }
                    
                            $details[] = [
                                'form' => $form,
                                'SubGrowers' => $SubGrowers,
                                'verified_qds_growers' => $verified_qds_growers,
                                'import_permits' => $all_import_permits
                            ];
                        }
                    
                        // Return the JSON response
                        return response()->json($details);
    }

    //get accepted import permits
    public function getAcceptedImportPermits($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = ImportExportPermit::where('administrator_id', $id)
                                    ->where('is_import', 1)
                                    ->where('status', 5)
                                    ->get();
        
        // Return the JSON response
        return response()->json($forms);
    }
    

    //get accepted planting returns
    public function getAcceptedPlantingReturns($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = SubGrower::where('administrator_id', $id)
                          ->where('status', 5)
                          ->get();
    
        // Return the JSON response
        return response()->json($forms);
    }
    
    //get accepted qds declarations
    public function getAcceptedQdsDeclarations($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = FormSr10::where('administrator_id', $id)
                         ->where('status', 5)
                         ->where('is_final', 1)
                         ->whereNotNull('qds_declaration_id')
                         ->get();
    
        // Return the JSON response
        return response()->json($forms);
    }
    
    //get crop varieties for a selected import permit
    public function getCropVarieties($permitId)
    {
        // Retrieve the crop varieties based on the selected import permit
        
        $has_crops = ImportExportPermitsHasCrops::where('import_export_permit_id', $permitId)->get();
        $crop_varieties = [];
        
        foreach ($has_crops as $crop) {
            $crop_varieties[] = ['id' => $crop->crop_variety_id, 'text' => CropVariety::where('id', $crop->crop_variety_id)->first()->name];
        }
        
        return response()->json($crop_varieties);
    }
    


}