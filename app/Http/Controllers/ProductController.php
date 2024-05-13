<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\User;

class ProductController extends Controller
{
    public function index()
    {
        // Retrieve all Product instances
        $forms = Product::all()->load('crop_variety:id,name');
    
        $details = [];
    
        // Iterate over each form to get the seller name
        foreach ($forms as $form) {
            // Retrieve the seller name using the administrator ID
            $seller = User::find($form->administrator_id);
    
            // Check if the seller exists
            if (!$seller) {
                return response()->json(['error' => 'Seller not found'], 404);
            }
    
            // Assemble the details for this form
            $details[] = [
                'form' => $form,
                'seller' => $seller->name,
            ];
        }
    
        // Return the JSON response with all form details
        return response()->json($details);
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
            ->first();
    
        // Check if the form exists
        if (!$form) {
            return response()->json(['error' => 'Form not found'], 404);
        }
    
        // Retrieve the name of the seller using the administrator ID
        $seller = User::find($id);
    
        // Check if the seller exists
        if (!$seller) {
            return response()->json(['error' => 'Seller not found'], 404);
        }
    
        // Assemble the details array
        $details = [
            'form' => $form,
            'seller' => $seller->name,
        ];
    
        // Return the JSON response
        return response()->json($details);
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
