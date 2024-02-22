<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FormSr6;
use App\Models\Utils;
use App\Models\Attachment;

class FormSr6Controller extends Controller
{
    
    public function index()
    {
        // Retrieve all FormSr6 instances
        $forms = FormSr6::all()->load(['form_sr6_has_crops.crops:id,name', 'attachments']);

        // Iterate over each form and transform the crop data
        $forms->transform(function ($form) {
            $form->form_sr6_has_crops->transform(function ($crop) {
                $crop->name = $crop->crops->name;
                unset($crop->crops);
                return $crop;
            });
            return $form;
        });
        
        // Return a collection of FormSr6 resources
        return response()->json($forms);
    }

    
     
    public function store(Request $request)
    {
        // Validate incoming request for main form data
        $validatedData = $request->validate([
            'administrator_id' => 'required',
            'type' => 'required',
            'name_of_applicant' => 'required',
            'company_initials' => 'required',
            'phone_number' => 'required',
            'address' => 'required',
            'premises_location' => 'required',
            'years_of_expirience' => 'required', 
            'seed_grower_in_past' => 'required',
            'cropping_histroy' => 'required', 
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required',
            'signature_of_applicant' => 'required'
        ]);
    
        // Check if the user has already submitted this form
        $existingForm = FormSr6::where('administrator_id', $request->administrator_id)
            ->where('status', 5) 
            ->where('type', $request->type)
            ->exists();
    
        if ($existingForm) {
            return $this->errorResponse('You have already submitted this form', 409);
        }
    
      
        // Create the main form instance
        $form = FormSr6::create($validatedData);
    
        // Handle the crops data
        if ($request->has('form_sr6_has_crops')) {
            $cropsData = $request->input('form_sr6_has_crops');
    
            foreach ($cropsData as $cropData) {
                // Create each crop record and associate it with the main form
                $form->form_sr6_has_crops()->create(['form_sr6_id' => $form->id,'crop_id' => $cropData['crop_id']]);
            }
        }

          // Store the uploaded photo (if exists)
          if ($request->has('attachments')) {
            $attachments = $request->input('attachments');
            foreach ($attachments as $attachment) {
                $photoPath = Utils::storeUploadedPhoto($attachment['file_path']);
                Attachment::create(['form_sr6_id' => $form->id, 'file_path' => $photoPath]);
            }
        }
    
    
        // Return the created main form instance
        return response()->json($form);
    }
    

         
    public function update(Request $request, $id)
    {
        // Find the form instance to update
        $form = FormSr6::findOrFail($id);
    
        // Validate incoming request for main form data
        $validatedData = $request->validate([
            'administrator_id' => 'required',
            'type' => 'required',
            'name_of_applicant' => 'required',
            'company_initials' => 'required',
            'phone_number' => 'required',
            'address' => 'required',
            'premises_location' => 'required',
            'years_of_expirience' => 'required', 
            'seed_grower_in_past' => 'required',
            'cropping_histroy' => 'required', 
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required',
            'signature_of_applicant' => 'required'
        ]);
    
        // Update the form instance
        $form->update($validatedData);
    
        // Handle the crops data (if provided)
        if ($request->has('form_sr6_has_crops')) {
            $cropsData = $request->input('form_sr6_has_crops');
    
            // Delete existing crops associated with the form
            $form->form_sr6_has_crops()->delete();
    
            // Create new crops associated with the form
            foreach ($cropsData as $cropData) {
                $form->form_sr6_has_crops()->create(['form_sr6_id' => $form->id, 'crop_id' => $cropData['crop_id']]);
            }
        }
    
        // Handle attachments (if provided)
        if ($request->has('attachments')) {
            $attachments = $request->input('attachments');
    
            // Delete existing attachments associated with the form
            $form->attachments()->delete();
    
            // Create new attachments associated with the form
            foreach ($attachments as $attachment) {
                $photoPath = Utils::storeUploadedPhoto($attachment['file_path']);
                Attachment::create(['form_sr6_id' => $form->id, 'file_path' => $photoPath]);
            }
        }
    
        // Return the updated form instance
        return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = FormSr6::where('administrator_id', $id)
            ->with(['form_sr6_has_crops.crops:id,name', 'attachments']) 
            ->get();
      
        // Transform the crop data to include the name instead of ID
        $form->form_sr6_has_crops->transform(function ($crop) {
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
        $form = FormSr6::where('administrator_id', $id)->firstOrFail();
    
        // Delete related crop records
        $form->form_sr6_has_crops()->delete();
    
        // Delete related attachment records
        $form->attachments()->delete();
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = FormSr6::where('inspector_id', $id)
                        ->with(['form_sr6_has_crops.crops:id,name', 'attachments'])
                        ->get();
        
        // Iterate over each form and transform the crop data
        $forms->transform(function ($form) {
            $form->form_sr6_has_crops->transform(function ($crop) {
                $crop->name = $crop->crops->name;
                unset($crop->crops);
                return $crop;
            });
            return $form;
        });
    
        return response()->json($forms);
    }

}
