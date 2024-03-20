<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CropVariety;
use App\Models\StockRecord;
use Illuminate\Http\Request;
use App\Models\User;

class StockController extends Controller
{
    
    public function index()
    {
        // Retrieve all StockRecord instances
        $forms = StockRecord::all();
        
        $stock = [];
        foreach ($forms as $key => $value) {
            $crop_variety = CropVariety::find($value->crop_variety_id)->name;
            $user = User::find($value->administrator_id)->name;
            $stock[] = [
                'id' => $value,
                'crop_variety' => $crop_variety,
                'user' => $user,
              
            ];
        }
        // Return a collection of StockRecord resources
        return response()->json($stock);
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
        $form = StockRecord::where('administrator_id', $id)->get();

        $stock = [];
        foreach ($form as $key => $value) {
            $crop_variety = CropVariety::find($value->crop_variety_id)->name;
            $user = User::find($value->administrator_id)->name;
            $stock[] = [
                'id' => $value,
                'crop_variety' => $crop_variety,
                'user' => $user,
              
            ];
        }

        return response()->json($stock);
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
