<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    
    public function index()
    {
        // Retrieve all Product instances
        $forms = Product::all()->load('crop_variety:id,name');
        
        // Return a collection of Product resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();

        // Create the main form instance
        $form = Product::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
    
        // Update the main form instance
         $form = Product::find($id)->update($data);
     
         // Return the created main form instance
         return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = Product::where('administrator_id', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }
    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = Product::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = Product::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}
