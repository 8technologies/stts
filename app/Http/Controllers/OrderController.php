<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    
    public function index()
    {
        // Retrieve all Order instances
        $forms = Order::all()->load('crop_variety:id,name');
        
        // Return a collection of Order resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();

        // Create the main form instance
        $form = Order::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
    
        // Update the main form instance
         $form = Order::find($id)->update($data);
     
         // Return the created main form instance
         return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = Order::where('order_by', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }

    public function showOrdersToMe($id)
    {
        // Retrieve the form instance with related data
        $form = Order::where('order_by', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }


    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = Order::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = Order::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}
