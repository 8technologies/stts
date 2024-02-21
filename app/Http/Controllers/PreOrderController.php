<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\PreOrder;
use Illuminate\Http\Request;
use Carbon\Carbon;

class PreOrderController extends Controller
{
    
    public function index()
    {
        // Retrieve all PreOrder instances
        $forms = PreOrder::all()->load('crop_variety:id,name');
        
        // Return a collection of PreOrder resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();
       if ($request->collection_date <= Carbon::now()) 
       {
       
           return  response()->json(['message' => 'Collection date cannot be in the past'], 404);
       }

        // Create the main form instance
        $form = PreOrder::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $PreOrder= PreOrder::find($id);
        if ($request->collection_date  <= Carbon::now()) 
        {
            return  response()->json(['message' => 'Collection date cannot be in the past'], 404);
        }
        // Update the main form instance
        $PreOrder->update($data);
     
         // Return the created main form instance
         return response()->json($PreOrder);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = PreOrder::where('administrator', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }


    public function destroy($id)
    {
        // Find the form instance to delete
        $form = PreOrder::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = PreOrder::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}

