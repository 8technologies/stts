<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\StockRecord;
use Illuminate\Http\Request;

class StockController extends Controller
{
    
    public function index()
    {
        // Retrieve all StockRecord instances
        $forms = StockRecord::all()->load('crop_varieties:id,name');
        
        // Return a collection of StockRecord resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();

        // Create the main form instance
        $form = StockRecord::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
    
        // Update the main form instance
         $form = StockRecord::find($id)->update($data);
     
         // Return the created main form instance
         return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = StockRecord::where('administrator_id', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }
    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = StockRecord::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = StockRecord::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}
