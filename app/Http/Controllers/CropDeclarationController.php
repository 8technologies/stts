<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\FormCropDeclaration;
use Illuminate\Http\Request;
use App\Models\Utils;
use App\Models\FormQds;
use Carbon\Carbon;


class CropDeclarationController extends Controller
{
   
    public function index()
    {
              // Retrieve all FormCropDeclaration instances
              $forms = FormCropDeclaration::with(['form_crop_declarations_has_crop_varieties' => function ($query) {
                $query->with('crop_variety:id,name');
            }])->get();
            
              // Return a collection of FormCropDeclaration resources
              return response()->json($forms);
    }

   
    public function store(Request $request)
    {
  
           // Validate incoming request
           $data = $request->all();

           $qds = FormQds::where('administrator_id',  $request->administrator_id)->where('valid_until','>=', Carbon::now())->first();
           if (!$qds) 
           {
               
               return response()->json(['message' => 'To apply for QDS Declaration, you must be an approved QDS Producer'], 403);
           }

            // Store the uploaded photo
            if ($request->has('payment_receipt')) {
            $photoPath = Utils::storeUploadedPhoto($request->input('payment_receipt')); 
            $data['payment_receipt'] = $photoPath;
            }

           $form = FormCropDeclaration::create($data);

             // Handle the crops data
        if ($request->has('form_crop_declarations_has_crop_varieties')) {
            $cropVarietyData = $request->input('form_crop_declarations_has_crop_varieties');
    
            foreach ($cropVarietyData as $data) {
                // Create each crop record and associate it with the main form
                $form->form_crop_declarations_has_crop_varieties()->create(['form_crop_declaration_id' => $form->id,'crop_variety_id' => $data['crop_variety_id']]);
            }
        }

        $new_form = FormCropDeclaration::where('id', $form->id)
        ->with(['form_crop_declarations_has_crop_varieties' => function ($query) {
            $query->with('crop_variety:id,name');
        }])->first();

            return response()->json($new_form);
    }

   
    public function show($id)
    {
        
         $form = FormCropDeclaration::where('administrator_id',$id)
         ->with(['form_crop_declarations_has_crop_varieties' => function ($query) {
            $query->with('crop_variety:id,name');
        }])
         ->get();
       
         return response()->json($form);
    }

    
    public function update(Request $request, $id)
    {
         
         $data = $request->all();
        
        // Find the FormCropDeclaration instance to update

        $form = FormCropDeclaration::find($id);

        // Check if $form is null
        if ($form === null) {
            // Handle the case where the form is not found
            return response()->json(['error' => 'FormCropDeclaration not found'], 404);
        }

        // Store the uploaded photo
        if ($request->has('payment_receipt')) {
        $photoPath = Utils::storeUploadedPhoto($request->input('payment_receipt'));
        $data['payment_receipt'] = $photoPath;
        }

    
        $form->update($data);

        // Handle the crops data
        if ($request->has('form_crop_declarations_has_crop_varieties')) {
            $cropVarietyData = $request->input('form_crop_declarations_has_crop_varieties');
            $form->form_crop_declarations_has_crop_varieties()->delete(); // Delete existing crops records
            foreach ($cropVarietyData as $data) {
                // Create each crop record and associate it with the main form
                $form->form_crop_declarations_has_crop_varieties()->create(['form_crop_declaration_id' => $form->id,'crop_variety_id' => $data['crop_variety_id']]);
            }
        }

        return response()->json($form);
    }

   
    public function destroy($id)
    {

        $form =  FormCropDeclaration::find($id);

        $form->form_crop_declarations_has_crop_varieties()->delete();

        $form->delete();

    
        return response()->json(['message' => 'Form deleted successfully']);
    }

    //get the inspections assigned to an inspector
    public function getAssignedForms($id)
    {
        $forms = FormCropDeclaration::where('inspector_id', $id)
        ->with(['form_crop_declarations_has_crop_varieties' => function ($query) {
            $query->with('crop_variety:id,name');
        }])
        ->get();

        return response()->json($forms);
    }
}
