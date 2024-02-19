<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ImportExportPermit;
use App\Models\Utils;


class ImportPermitController extends Controller
{     
    public function index()
    {
        // Retrieve all ImportExportPermit instances
        $forms = ImportExportPermit::where('is_import', 1)->load('import_export_permits_has_crops:id,name');

        // Iterate over each form and transform the crop data
        $forms->transform(function ($form) {
            $form->import_export_permits_has_crops->transform(function ($crop) {
                $crop->name = $crop->crops->name;
                unset($crop->crops);
                return $crop;
            });
            return $form;
        });
        
        // Return a collection of ImportExportPermit resources
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
      
        $import = ImportExportPermit::where('type',$request->type)
            ->where('administrator_id', $request->administrator_id)
            ->where('is_import', 1)
            ->first();

        if ($import) {
            if (!Utils::can_create_import($import)) {
                return response()->json(['message' => 'You cannot create a new import permit form while having a PENDING one of the same category.']);
            }

            if (Utils::can_renew_permit($import)) {
                return response()->json(['message' => 'You cannot create a new import permit form while having a VALID one of the same category.']);
            }
        }

        // Create the main form instance
        $form = ImportExportPermit::create($validatedData);

        // Handle the crops data
        if ($request->has('import_export_permits_has_crops')) {
            $cropsData = $request->input('import_export_permits_has_crops');
            $form->import_export_permits_has_crops()->createMany($cropsData);
        }

        // Return the created main form instance
        return response()->json($form);
    }

         
    public function update(Request $request, $id)
    {
        // Find the form instance to update
        $form = ImportExportPermit::findOrFail($id);
        
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
    
        // Update the main form instance
        $form->update($validatedData);

        $import = ImportExportPermit::where('type',$request->type)
            ->where('administrator_id', $request->administrator_id)
            ->where('is_import', 1)
            ->first();


        $import_permit = ImportExportPermit::find($request->id);

        if ($import && $import->id !== $import_permit->id) {
            if (!Utils::can_create_import($import)) {
                return response()->json(['message' => 'You cannot create a new import-export-permits form while having a PENDING one of the same category.']);
            }

            if (Utils::can_renew_permit($import)) {
                return response()->json(['message' => 'You cannot create a new import-export-permits form while having a VALID one of the same category.']);
            }
        } elseif ($import) {
            if (!Utils::can_create_import($import)) {
                return response()->json(['message' => 'You cannot create a new import-export-permits form while having a PENDING one of the same category.']);
            }

            if (Utils::can_renew_permit($import)) {
                return response()->json(['message' => 'You cannot create a new import-export-permits form while having a VALID one of the same category.']);
            }
        }
        // Handle the crops data
        if ($request->has('import_export_permits_has_crops')) {
            $cropsData = $request->input('import_export_permits_has_crops');
            $form->import_export_permits_has_crops()->delete(); // Delete existing crops records
            $form->import_export_permits_has_crops()->createMany($cropsData); // Create new crop records
        }
    
        // Return the updated main form instance
        return response()->json($form);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = ImportExportPermit::where('administrator_id', $id)
             ->where('is_import', 1)
            ->with('import_export_permits_has_crops.crops:id,name') 
            ->firstOrFail();
      
        // Transform the crop data to include the name instead of ID
        $form->import_export_permits_has_crops->transform(function ($crop) {
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
        $form = ImportExportPermit::where('administrator_id', $id)->where('is_import', 1)->firstOrFail();
    
        // Delete related crop records
        $form->import_export_permits_has_crops()->delete();
    
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

    //get the inspections assigned to an inspector
    public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = ImportExportPermit::where('inspector_id', $id)
                        ->where('is_import', 1)
                        ->with('import_export_permits_has_crops.crops:id,name')
                        ->get();
        
        // Iterate over each form and transform the crop data
        $forms->transform(function ($form) {
            $form->import_export_permits_has_crops->transform(function ($crop) {
                $crop->name = $crop->crops->name;
                unset($crop->crops);
                return $crop;
            });
            return $form;
        });
    
        return response()->json($forms);
    }
    
}
