<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FormSr4;
use Illuminate\Support\Facades\Storage;


use App\Models\Utils;

class FormSr4Controller extends Controller
{
   
    public function index()
    {
              // Retrieve all FormSr4 instances
              $forms = FormSr4::all();
              // Return a collection of FormSr4 resources
              return response()->json($forms);
    }

   
    public function store(Request $request)
    {
  
           // Validate incoming request
           $validatedData = $request->validate([
            'administrator_id' => 'required',
            'type' => 'required',
            'address' => 'required',
            'company_initials' => 'required',
            'premises_location' => 'required',
            'expirience_in' => 'required',
            'years_of_expirience' => 'required',
            'dealers_in' => 'required',
            'marketing_of' => 'required',
            'have_adequate_land' => 'required',
            'have_adequate_storage' => 'required',
            'have_adequate_equipment' => 'required',
            'have_contractual_agreement' => 'required',
            'have_adequate_field_officers' => 'required',
            'have_conversant_seed_matters' => 'required',
            'souce_of_seed' => 'required',
            'have_adequate_land_for_production' => 'required',
            'have_internal_quality_program' => 'required',
            'accept_declaration' => 'required',

        ]);

            // Check if the user has a form already
            $form = FormSr4::where('administrator_id', $request->administrator_id)
            ->where('status', 5)
            ->where('type', $request->type)
            ->first();

            if ($form) {
            return $this->errorResponse('You have already submitted this form', 409);
            }

            // Store the uploaded photo
            if ($request->has('receipt')) {
            $photoPath = Utils::storeUploadedPhoto($request->input('receipt')); 
            $validatedData['receipt'] = $photoPath;
            }

          

            $form = FormSr4::create($validatedData);

            // Return a single FormSr4 resource
            return response()->json($form);
        }

   
    public function show($id)
    {
        
         $form = FormSr4::where('administrator_id', $id)->firstOrFail();
       
         return response()->json($form);
    }

    
    public function update(Request $request, $id)
    {
         // Validate incoming request
         $validatedData = $request->validate([
            'type' => 'required',
            'address' => 'required',
            'company_initials' => 'required',
            'premises_location' => 'required',
            'expirience_in' => 'required',
            'years_of_expirience' => 'required',
            'dealers_in' => 'required',
            'marketing_of' => 'required',
            'have_adequate_land' => 'required',
            'have_adequate_storage' => 'required',
            'have_adequate_equipment' => 'required',
            'have_contractual_agreement' => 'required',
            'have_adequate_field_officers' => 'required',
            'have_conversant_seed_matters' => 'required',
            'souce_of_seed' => 'required',
            'have_adequate_land_for_production' => 'required',
            'have_internal_quality_program' => 'required',
            'accept_declaration' => 'required'
        ]);

        
        // Find the FormSr4 instance
        $form = FormSr4::where('administrator_id', $id)->firstOrFail();

        //if the status is not null, or 1 then return an error
        if(($form->status != null || $form->status != 1) && $form->inspector_id != null){
            return response()->json(['message' => 'You cannot edit this form'], 403);
        }

        if ($request->has('receipt')) 
        {
            $photoPath = Utils::storeUploadedPhoto($request->input('receipt'));
            $data['receipt'] = $photoPath;
        }

        // Update the FormSr4 instance
        $form->update($validatedData);

        // Return a single FormSr4 resource
        return response()->json($form);
    }

   
    public function destroy($id)
    {

        $form =  FormSr4::where('administrator_id', $id)->firstOrFail();
        $form->delete();

    
        return response()->json(['message' => 'Form deleted successfully']);
    }

        //get the inspections assigned to an inspector
        public function getAssignedForms($id)
        {
            $forms = FormSr4::where('inspector_id', $id)->get();

            return response()->json($forms);
        }
}
