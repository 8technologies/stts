<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FormSr6;
use App\Models\Utils;

class FormSr6Controller extends Controller
{
    
    public function index()
    {
        // Retrieve all FormSr6 instances
        $forms = FormSr6::all();
        // Return a collection of FormSr6 resources
        return response()->json($forms);
    }

    
     
    public function store(Request $request)
    {
  
         
                 // Validate incoming request
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
        
            // Check if the user has a form already
            $form = FormSr6::where('administrator_id', $request->administrator_id)
            ->where('status', 5)
            ->where('type', $request->type)
            ->first();

            if ($form) {
            return $this->errorResponse('You have already submitted this form', 409);
            }

            // Store the uploaded photo
            if ($request->has('receipt')) {
            $photoPath = Utils::storeUploadedPhoto($request->file('receipt')); // Corrected input to file
            $validatedData['receipt'] = $photoPath; // Corrected variable name to use validatedData
            }

            $form = FormSr6::create($validatedData);

            // Return a single FormSr4 resource
            return response()->json($form);
        }

         
    public function update(Request $request, $id)
    {
         // Validate incoming request
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

        
        // Find the FormSr4 instance
        $form = FormSr6::where('administrator_id', $id)->firstOrFail();

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

    
    public function show($id)
    {
       
        $form = FormSr6::where('administrator_id', $id)->firstOrFail();
      
        return response()->json($form);
    }

    public function destroy($id)
    {
      
        $form =  FormSr6::where('administrator_id', $id)->firstOrFail();

        $form->delete();
        return response()->json(['message' => 'Form deleted successfully']);
    }

   //get the inspections assigned to an inspector
    public function getAssignedForms($id)
    {
    
        $forms = FormSr6::where('inspector_id', $id)->get();
       
        return response()->json($forms);
    }
}
