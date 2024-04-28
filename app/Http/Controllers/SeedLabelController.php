<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SeedLabel;
use App\Models\Utils;
use App\Models\SeedLab;
use App\Models\SeedLabelPackage;

class SeedLabelController extends Controller
{
    
    public function index()
    {
        // Retrieve all SeedLabel instances
        $forms = SeedLabel::all();
        
        // Return a collection of SeedLabel resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();

       //check if the user a validated seed lab test
        $validatedSeedLab = SeedLab::where('id', $request->seed_lab_id)->where('status', 5)->exists();
        if (!$validatedSeedLab) {
            return response()->json('Seed lab test not validated', 409);
        }
        else{
            //check if the quantity provided is more than the seed lab quantity
            if($request->quantity > $validatedSeedLab->quantity){
                return response()->json('You have a less amount of this variety compared to ' . $validatedSeedLab->quantity . ' Kgs that you have in stock', 409);
            }
        }

       $photoFields = ['receipt', 'image'];
       foreach ($photoFields as $field) {
           if ($request->has($field)) {
               $photoPath = Utils::storeUploadedPhoto($request->input($field)); 
               $data[$field] = $photoPath;
               $data['crop_variety_id'] = $validatedSeedLab->crop_variety_id;
           }
       }
       
        // Create the main form instance
        $form = SeedLabel::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
 
        //check if the user a validated seed lab test
         $validatedSeedLab = SeedLab::where('id', $request->seed_lab_id)->where('status', 5)->exists();
         if (!$validatedSeedLab) {
             return response()->json('Seed lab test not validated', 409);
         }
         else{
             //check if the quantity provided is more than the seed lab quantity
             if($request->quantity > $validatedSeedLab->quantity){
                 return response()->json('You have a less amount of this variety compared to ' . $validatedSeedLab->quantity . ' Kgs that you have in stock', 409);
             }
         }
 
        $photoFields = ['receipt', 'image'];
        foreach ($photoFields as $field) {
            if ($request->has($field)) {
                $photoPath = Utils::storeUploadedPhoto($request->input($field)); 
                $data[$field] = $photoPath;
                $data['crop_variety_id'] = $validatedSeedLab->crop_variety_id;
            }
        }
        
         // Create the main form instance
         $form = SeedLabel::find($id)->update($data);
     
         // Return the created main form instance
         return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = SeedLabel::where('administrator_id', $id)->get();
        // Return the JSON response
        return response()->json($form);
    }
    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = SeedLabel::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = SeedLabel::where('status', 5)
                        ->get();
        
        return response()->json($forms);
    }

    //get the labtest number for marketable seed for a user
    public function getLabTestNumber($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = SeedLab::where('administrator_id', $id)
                ->where('repot_recommendation', 11)
                ->pluck('lab_test_number', 'id');

        return response()->json($forms);
    }

    //get the seed label packages 

    public function getSeedLabelPackages()
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = SeedLabelPackage::all();

        return response()->json($forms);
    }

}
