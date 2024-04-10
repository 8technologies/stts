<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CropInspectionType;
use App\Models\FormCropDeclaration;
use Illuminate\Http\Request;
use App\Models\FormSr10;
use App\Models\User;

class QDSPlantInspectionController extends Controller
{
    
    public function index()
    {
        // Retrieve allFormSr10 instances
        $forms = FormSr10::whereNotNull('qds_declaration_id')->with('crop_variety:id,name')->get();

        // Return a collection ofFormSr10 resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();
    
        // Create the main form instance
        $form =FormSr10::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $sr10=FormSr10::find($id);
       
        // Update the main form instance
        $sr10->update($data);
     
         // Return the created main form instance
         return response()->json($sr10);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $forms = FormSr10::where('administrator_id', $id)
                         ->whereNotNull('qds_declaration_id')
                         ->with('crop_variety:id,name')
                         ->get();
    
        // Return the JSON response
        return response()->json($forms);
    }
    


    public function destroy($id)
    {
        // Find the form instance to delete
        $form =FormSr10::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
   {
       // Retrieve the forms assigned to the inspector with related data
       $forms = FormSr10::where('inspector', $id)
                        ->whereNotNull('qds_declaration_id')
                        ->with('crop_variety:id,name')
                        ->get();
                if ($forms->isEmpty()) // Check if the collection is empty
                {
                    return response()->json(['error' => 'Forms not found'], 404);
                }
                
                $details = [];
                
                foreach ($forms as $form) {
                    $subgrower = FormCropDeclaration::find($form->qds_declaration_id);
                    
                    $inspection_type = CropInspectionType::find($form->stage);
        
                    if($inspection_type){
                        $inspection_type = $inspection_type->inspection_stage;
                    }
                    
                    $user = User::find($form->administrator_id)->name;
                    
                    $details[] = [
                        'form' => $form,
                        'QDSDeclaration' => $subgrower,
                        'inspection_type' => $inspection_type,
                        'user' => $user
                    ];
                }
        
                // Return the JSON response
                return response()->json($details);
        
            }
}



