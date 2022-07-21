<?php

namespace App\Http\Controllers\Api;

use App\Models\Crop;
use App\Models\CropVariety;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use App\Models\ImportExportPermit;
use App\Models\ImportExportPermitsHasCrops;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;


class ImportPermitApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function import_permits_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('import_export_permits')->where('administrator_id', $user->id)->get();
        // $query = ImportExportPermit::all();
        
        return $this->successResponse($query, $message="Import permits"); 
    } 


    
    // create new sr4 form
    public function import_permits_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            // 'name',
            'address',
            'telephone',
            'type',
            'store_location',
            'quantiry_of_seed',
            'name_address_of_origin',
            'ista_certificate', 
            'phytosanitary_certificate',
            'crop_category',
        );

        $post_data = Validator::make($data, [
            'address' => 'required',
            'telephone' => 'required',
            'type' => 'required',
            'store_location' => 'required',
            'quantiry_of_seed' => 'required',
            'name_address_of_origin' => 'required',
            'ista_certificate', 
            'phytosanitary_certificate',
            'crop_category' => 'required',
        ]);
        
 
        if ($post_data->fails()) {
            return $this->errorResponse("Import Permit validation error", 200); 
        }

        $form = ImportExportPermit::create([
            'administrator_id' => $user->id, 
            'name' => $user->name,
            'address' => $request->input('address'),
            'telephone' => $request->input('telephone'),
            'type' => $request->input('type'),
            'store_location' => $request->input('store_location'),
            'quantiry_of_seed' => $request->input('quantiry_of_seed'),
            'name_address_of_origin' => $request->input('name_address_of_origin'),
            'ista_certificate' => $request->input('ista_certificate'), 
            'phytosanitary_certificate' => $request->input('phytosanitary_certificate'),
            'crop_category' => $request->input('crop_category')
        ]);

        $import_export_permits_has_crops = json_decode($request->input('import_export_permits_has_crops'));
        if($import_export_permits_has_crops!=null){
            if(is_array($import_export_permits_has_crops)){ 
                foreach ($import_export_permits_has_crops as $key => $value) {
                    $crop_variety_id = ((int)($value));
                    $crop_var = CropVariety::find($crop_variety_id);
                    if($crop_var == null){
                        continue;
                    }
                    $ImportExportPermitsHasCrop = new ImportExportPermitsHasCrops();
                    $ImportExportPermitsHasCrop->import_export_permit_id = $form->id;
                    $ImportExportPermitsHasCrop->crop_variety_id = $crop_variety_id;
                    $ImportExportPermitsHasCrop->save();

                }
            }
        } 
        
        // Form created, return success response
        return $this->successResponse($form, "Import Permit submit success! => ".$form->id, 201); 
    }
}


/*


*/