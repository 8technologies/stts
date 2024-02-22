<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FormSr10;

class QDSPlantInspectionController extends Controller
{
    
    public function index()
    {
        // Retrieve allFormSr10 instances
        $forms =FormSr10::where('qds_declaration_id'!= null)->load('crop_variety:id,name');
        
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
        $form =FormSr10::where('administrator', $id)
        ->where('qds_declaration_id'!= null)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
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
        $forms =FormSr10::where('inspector', $id)
                       ->where('qds_declaration_id'!= null)
                        ->get();
        
        return response()->json($forms);
    }

}
