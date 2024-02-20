<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ImportExportPermit;  
use App\Models\Utils;


class ExportPermitController extends Controller
{
    public function index()
    {
        // Retrieve all ImportExportPermit instances where 'is_import' is 0 and eager load the relationship 'import_export_permits_has_crops' along with the 'crop_variety' relationship
        $forms = ImportExportPermit::where('is_import', 0)
                                    ->with(['import_export_permits_has_crops' => function ($query) {
                                        $query->with('variety:id,name'); // Eager load the 'crop_variety' relationship with only 'id' and 'name' fields
                                    }])
                                    ->get();

        // Return a collection of ImportExportPermit resources
        return response()->json($forms);
    }

    
    public function store(Request $request)
    {
        $data = $request->all();
        
        // Check if the user has already submitted this form
    
        $import = ImportExportPermit::where('type',$request->type)
            ->where('administrator_id', $request->administrator_id)
            ->where('is_import', 0)
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
        $form = ImportExportPermit::create($data);

        // Handle the crops data
        if ($request->has('import_export_permits_has_crops')) {
            $cropsData = $request->input('import_export_permits_has_crops');
            $form->import_export_permits_has_crops()->createMany($cropsData);
        }

        $form = ImportExportPermit::where('id', $form->id)
            ->with(['import_export_permits_has_crops' => function ($query) {
                $query->with('variety:id,name'); 
            }])
            ->first();

        // Return the created main form instance
        return response()->json($form);
    }

        
    public function update(Request $request, $id)
    {
        // Find the form instance to update
        $import = ImportExportPermit::where('type',$request->type)
            ->where('id', $id)
            ->where('is_import', 0)
            ->first();
 
        $data = $request->all();

        // Update the main form instance
        $import->update($data);

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
            $import->import_export_permits_has_crops()->delete(); // Delete existing crops records
            $import->import_export_permits_has_crops()->createMany($cropsData); // Create new crop records
        }

        $form = ImportExportPermit::where('id', $import->id)
            ->with(['import_export_permits_has_crops' => function ($query) {
                $query->with('variety:id,name'); 
            }])
            ->first();

        // Return the updated main form instance
        return response()->json($form);
    }


    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = ImportExportPermit::where('administrator_id', $id)
            ->where('is_import', 0)
            ->with(['import_export_permits_has_crops' => function ($query) {
                $query->with('variety:id,name'); 
            }])
            ->get();

        // Return the JSON response
        return response()->json($form);
    }


    public function destroy($id)
    {
        // Find the form instance to delete
        $form = ImportExportPermit::where('id', $id)->where('is_import', 0)->firstOrFail();

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
    
        $forms = ImportExportPermit::where('inspector_id', $id)
                        ->where('is_import', 0)
                        ->with(['import_export_permits_has_crops' => function ($query) {
                            $query->with('variety:id,name'); 
                        }])
                        ->get();
        
        return response()->json($forms);
    }
}