<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FormQds;
use App\Models\Utils;


class QdsController extends Controller
{
     public function index()
    {
        // Retrieve all FormQds instances
        $forms = FormQds::all()->load('qds_has_crops.crops:id,name');

        // Iterate over each form and transform the crop data
        $forms->transform(function ($form) {
            $form->form_sr6_has_crops->transform(function ($crop) {
                $crop->name = $crop->crops->name;
                unset($crop->crops);
                return $crop;
            });
            return $form;
        });
        
        // Return a collection of FormQds resources
        return response()->json($forms);
    }

    
     
    public function store(Request $request)
    {
        // Validate incoming request for main form data
        $validatedData = $request->validate([
            'administrator_id' => 'required',
            'name_of_applicant' => 'required',
            'address' => 'required',
            'phone_number' => 'required',
            'farm_location' => 'required',
            'premises_location' => 'required',
            'years_of_experience' => 'required',
            'have_been_qds' => 'required',
            'have_adequate_storage_facility' => 'required',
            'cropping_history' => 'required',
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required',      
        ]);
        
        // Check if the user has already submitted this form
        if (FormQds::where('administrator_id', $request->administrator_id)->where('status', 5)->exists()) {
            return $this->errorResponse('You have already submitted this form', 409);
        }

        // Store the uploaded photos
        $photoFields = ['signature_of_applicant', 'recommendation', 'certification'];
        foreach ($photoFields as $field) {
            if ($request->has($field)) {
                $photoPath = Utils::storeUploadedPhoto($request->input($field)); 
                $validatedData[$field] = $photoPath;
            }
        }
        
        // Create the main form instance
        $form = FormQds::create($validatedData);

        // Handle the crops data
        if ($request->has('qds_has_crops')) {
            $cropsData = $request->input('qds_has_crops');
            $form->qds_has_crops()->createMany($cropsData);
        }

        // Return the created main form instance
        return response()->json($form);
    }


         
    public function update(Request $request, $id)
    {
        // Find the form instance to update
        $form = FormQds::findOrFail($id);
    
        // Validate incoming request for main form data
         // Validate incoming request for main form data
         $validatedData = $request->validate([
            'administrator_id' => 'required',
            'name_of_applicant' => 'required',
            'address' => 'required',
            'phone_number' => 'required',
            'farm_location' => 'required',
            'premises_location' => 'required',
            'years_of_experience' => 'required',
            'qds_has_crops' => 'required',
            'have_been_qds' => 'required',
            'have_adequate_storage_facility' => 'required',
            'cropping_history' => 'required',
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required',
            'signature_of_applicant' => 'required',
            'recommendation' => 'required',
            'certification' => 'required',
          
        ]);
    
        // Update the form instance
        $form->update($validatedData);
    
        // Handle the crops data (if provided)
        if ($request->has('qds_has_crops')) {
            $cropsData = $request->input('qds_has_crops');
    
            // Delete existing crops associated with the form
            $form->qds_has_crops()->delete();
    
            // Create new crops associated with the form
            foreach ($cropsData as $cropData) {
                $form->qds_has_crops()->create(['form_qds_id' => $form->id, 'crop_id' => $cropData['crop_id']]);
            }
        }
    
        // Return the updated form instance
        return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = FormQds::where('administrator_id', $id)
            ->with('qds_has_crops.crops:id,name') 
            ->firstOrFail();
      
        // Transform the crop data to include the name instead of ID
        $form->qds_has_crops->transform(function ($crop) {
            $crop->name = $crop->crops->name;
            unset($crop->crops);
            return $crop;
        });
    
        // Return the JSON response
        return response()->json($form);
    }
    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = FormQds::where('administrator_id', $id)->firstOrFail();
    
        // Delete related crop records
        $form->qds_has_crops()->delete();
    
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = FormQds::where('inspector_id', $id)
                        ->with('qds_has_crops.crops:id,name')
                        ->get();
        
        // Iterate over each form and transform the crop data
        $forms->transform(function ($form) {
            $form->qds_has_crops->transform(function ($crop) {
                $crop->name = $crop->crops->name;
                unset($crop->crops);
                return $crop;
            });
            return $form;
        });
    
        return response()->json($forms);
    }
}
