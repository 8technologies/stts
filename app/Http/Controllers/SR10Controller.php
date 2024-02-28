<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FormSr10;
use Illuminate\Http\Request;
use App\Models\PlantingReturn;
use App\Models\SubGrower;

class SR10Controller extends Controller
{
    
    public function index()
    {
        // Retrieve allFormSr10 instances
        $forms =FormSr10::where('planting_return_id'!= null)->load('crop_variety:id,name');
        
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
        $form = FormSr10::where('administrator_id', $id)
            ->whereNotNull('planting_return_id')
            ->with('crop_variety:id,name')
            ->first();
    
        if (!$form) 
        {
            return response()->json(['error' => 'Form not found'], 404);
        }
    
        $subgrower = Subgrower::find($form->planting_return_id);
    
        $details = [
            'form' => $form,
            'planting_return' => $subgrower
        ];
    
        // Return the JSON response
        return response()->json($details);
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
                       ->where('planting_return_id'!= null)
                        ->get();

                        
        if (!$forms) {
            return response()->json(['error' => 'Form not found'], 404);
        }

        $subgrower = Subgrower::find($forms->planting_return_id);

        $details = [
            'form' => $forms,
            'planting_return' => $subgrower
        ];
        return response()->json($details);
    }

}
