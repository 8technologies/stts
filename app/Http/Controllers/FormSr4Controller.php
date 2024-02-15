<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FormSr4;

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
  
        $data = $request->all();

        //check if the user has a form already
        $form = FormSr4::where(['applicant_id', $request->applicant_id,
        'status'=> 5,
        'type'=> $request->type,
        ])->first();

        if($form){
            return $this->errorResponse('You have already submitted this form', 409);
        }

           // Store the uploaded photo
       if ($request->has('receipt')) 
       {
             $photoPath = Utils::storeUploadedPhoto($request->input('receipt'));
             $data['receipt'] = $photoPath;
        }

       
        $form = FormSr4::create($data);

        // Return a single FormSr4 resource
        return response()->json($form);
    }

   
    public function show($id)
    {
         // Retrieve a specific FormSr4 instance
         $form = FormSr4::where('administrator_id', $id)->firstOrFail();
         // Return a single FormSr4 resource
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
        // Find the FormSr4 instance
        $form =  FormSr4::where('applicant_id', $id)->firstOrFail();

        // Delete the FormSr4 instance
        $form->delete();

        // Return success response
        return response()->json(['message' => 'Form deleted successfully']);
    }
}
