<?php

namespace App\Http\Controllers\Api;

use App\Models\Crop;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;
use App\Models\FormQds;
use App\Models\QdsHasCrop;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;



class FormQDSApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_qds_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('form_qds')->where('administrator_id', '=', $user->id)->get();
        // $query = SeeFormQds::all();
        
        return $this->successResponse($query, $message="QDS forms"); 
    } 


    public function form_qds_create(Request $request){ // \Illuminate\Http\JsonResponse
        $user = Auth::user();

        $data = $request->only(
            // 'name_of_applicant',
            'address',
            'premises_location', 
            'years_of_expirience',
            'have_been_qds',
            'have_adequate_storage_facility',
            'cropping_histroy',
            'have_adequate_isolation',
            'have_adequate_labor',
            'aware_of_minimum_standards',
            'signature_of_applicant',

        );

        $post_data = Validator::make($data, [
            'address' => 'required',
            'premises_location' => 'required', 
            'years_of_expirience' => 'required|min:1|integer',
            'have_been_qds' => 'required',
            'have_adequate_storage_facility' => 'required',
            'cropping_histroy' => 'required',
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required',
            'signature_of_applicant' => 'required',
            'qds_crops' => 'required',
        ]);

        if ($post_data->fails()) {
            //return $this->errorResponse("QDS form submit error", 200); 
        }

        $form = FormQds::create([
            'administrator_id' => $user->id,
            'name_of_applicant' => $user->name,
            'address' => $request->input('address'),
            'premises_location' => $request->input('premises_location'), 
            'years_of_expirience' => $request->input('years_of_expirience'),
            'have_been_qds' => $request->input('have_been_qds'),
            'have_adequate_storage_facility' => $request->input('have_adequate_storage_facility'),
            'cropping_histroy' => $request->input('cropping_histroy'),
            'have_adequate_isolation' => $request->input('have_adequate_isolation'),
            'have_adequate_labor' => $request->input('have_adequate_labor'),
            'aware_of_minimum_standards' => $request->input('aware_of_minimum_standards'),
            'signature_of_applicant' => $request->input('signature_of_applicant'),
        ]);

        $qds_crops_items = json_decode($request->input('qds_crops'));
        if($qds_crops_items!=null){
            if(is_array($qds_crops_items)){ 
                foreach ($qds_crops_items as $key => $value) {
                    $crop_id = ((int)($value));
                    $crop = Crop::find($crop_id);
                    if($crop == null){
                        continue;
                    }
                    $sub_form = new QdsHasCrop();
                    $sub_form->form_qds_id = $form->id;
                    $sub_form->crop_id = $crop_id;
                    $sub_form->save();
                }
            }
        } 

        // Form created, return success response
        return $this->successResponse($form, "QDS form submit success!", 201); 
    }
}
