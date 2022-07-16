<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;
use App\Models\FormQds;
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


    public function form_qds_create(Request $request): \Illuminate\Http\JsonResponse
        $user = Auth::user();

        $data = $request->only(
            'name_of_applicant',
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
            'type' => 'required',
            'address' => 'required',
            'company_initials' => 'required',
            'premises_location' => 'required',
            'expirience_in' => 'required',
            'years_of_expirience' => 'required|min:1|integer',
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
            'receipt' => 'required',
            'accept_declaration' => 'required',
        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("SR4 form submit error", 200); 
        }


        $form = FormSr4::create([
            'administrator_id' => $user->id,
            'type' => $request->input('type'),
            'name_of_applicant' => $user->name,
            'address' => $request->input('address'),
            'company_initials' => $request->input('company_initials'),
            'premises_location' => $request->input('premises_location'),
            'expirience_in' => $request->input('expirience_in'),
            'years_of_expirience' => $request->input('years_of_expirience'),
            'dealers_in' => $request->input('dealers_in'),
            'marketing_of' => $request->input('marketing_of'),
            'have_adequate_land' => $request->input('have_adequate_land'),
            'have_adequate_storage' => $request->input('have_adequate_storage'),
            'have_adequate_equipment' => $request->input('have_adequate_equipment'),
            'have_contractual_agreement' => $request->input('have_contractual_agreement'),
            'have_adequate_field_officers' => $request->input('have_adequate_field_officers'),
            'have_conversant_seed_matters' => $request->input('have_conversant_seed_matters'),
            'souce_of_seed' => $request->input('souce_of_seed'),
            'have_adequate_land_for_production' => $request->input('have_adequate_land_for_production'),
            'have_internal_quality_program' => $request->input('have_internal_quality_program'),
            'receipt' => $request->input('receipt'),
            'accept_declaration' => $request->input('accept_declaration')
        ]);

        // Form created, return success response
        return $this->successResponse($form, "SR4 form submit success!", 201); 
    }
}
