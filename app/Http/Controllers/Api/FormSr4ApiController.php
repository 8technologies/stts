<?php

namespace App\Http\Controllers\Api;

use App\Models\FormSr4;
use Encore\Admin\Controllers\AdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Models\Profile;


class FormSr4ApiController extends AdminController {
    
     /**
      * Create a new AuthApiController instance.
      *
      * @return void
      */
      public function __construct()
      {
          $this->middleware('auth');
      } 

    // create new sr4 form via json response api end points defined in api.php
    public function new_sr4_form(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            'administrator_id',
            'type',
            'name_of_applicant',
            'address',
            'company_initials',
            'premises_location',
            'expirience_in',
            'years_of_expirience',
            'dealers_in',
            'marketing_of',
            'have_adequate_land',
            'have_adequate_storage',
            'have_adequate_equipment',
            'have_contractual_agreement',
            'have_adequate_field_officers',
            'have_conversant_seed_matters',
            'souce_of_seed',
            'have_adequate_land_for_production',
            'have_internal_quality_program',
            'receipt',
            'accept_declaration'
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

        // Send failed response if request is not valid
        if ($post_data->fails()) {
            return response()->json(['error' => $post_data->messages()], 200);
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
        return response()->json([
            'success' => true,
            'message' => 'SR4 form submit success!',
            'form' => $form
        ], 200);
    }
}
