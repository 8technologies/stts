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
  
        //get the logged in user
        $user = auth()->user();
        return response()->json($user);
           // Validate incoming request
           $data = $request->all();
            // Check if the user has a form already
            $form = FormSr4::where('administrator_id', $request->administrator_id)
            ->where('type', $request->type)
            ->first();

            if ($form) {
                if(!Utils::can_create_form($form))
                {
                    return  response()->json(['message' => 'You cannot create a new SR4 form  while having PENDING one of the same category.'], 403);
                }
                
                //check if its still valid
                if (Utils::can_renew_app_form($form)) 
                {
                    return  response()->json(['message' => 'You cannot create a new SR4 form  while having a VALID one of the same category.'], 403);
                }
            }

            // Store the uploaded photo
            if ($request->has('receipt')) {
            $photoPath = Utils::storeUploadedPhoto($request->input('receipt')); 
            $data['receipt'] = $photoPath;
            }

          

            $form = FormSr4::create($data);

            // Return a single FormSr4 resource
            return response()->json($form);
        }

   
    public function show($id)
    {
        
         $form = FormSr4::where('administrator_id', $id)->get();
       
         return response()->json($form);
    }

    
    public function update(Request $request, $id)
    {
         
         $data = $request->all();
        
        // Find the FormSr4 instance
        $form = FormSr4::where('administrator_id', $id)->firstOrFail();

        if ($form) {
            if(!Utils::can_create_form($form))
            {
                return  response()->json(['message' => 'You cannot create a new SR4 form  while having PENDING one of the same category.'], 403);
            }
            
            //check if its still valid
            if (Utils::can_renew_app_form($form)) 
            {
                return  response()->json(['message' => 'You cannot create a new SR4 form  while having a VALID one of the same category.'], 403);
            }
        }


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
        $form->update($data);

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
