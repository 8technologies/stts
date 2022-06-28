<?php

namespace App\Http\Controllers\Api;

use App\Models\FormSr6;
use Encore\Admin\Controllers\AdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class FormSr6ApiController extends AdminController {

    // create new sr6 form via json response api end points defined in api.php
    public function new_sr6_form(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = auth()->user();

        $data = $request->only(
            'administrator_id',
            'dealers_in',
            'type',
            'name_of_applicant',
            'address',
            'premises_location',
            'years_of_expirience',
            'form_sr6_has_crops',
            'seed_grower_in_past',
            'cropping_histroy',
            'have_adequate_isolation',
            'have_adequate_labor',
            'aware_of_minimum_standards',
            'signature_of_applicant',
        );

        $post_data = Validator::make($data, [
            'type' => 'required',
            'name_of_applicant' => 'required',
            'address' => 'required',
            'premises_location' => 'required',
            'years_of_expirience' => 'required',
            'form_sr6_has_crops' => 'required',
            'seed_grower_in_past' => 'required',
            'cropping_histroy' => 'required',
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required',
            'signature_of_applicant' => 'required',
        ]);

        // Send failed response if request is not valid
        if ($post_data->fails()) {
            return response()->json(['error' => $post_data->messages()], 200);
        }

        $form = FormSr6::create([
            'administrator_id' => '114',
            'dealers_in' => $request->input('dealers_in'),
            'type' => $request->input('type'),
            'name_of_applicant' => $request->input('name_of_applicant'),
            'address' => $request->input('address'),
            'premises_location' => $request->input('premises_location'),
            'years_of_expirience' => $request->input('years_of_expirience'),
            'form_sr6_has_crops' => $request->input('form_sr6_has_crops'),
            'seed_grower_in_past' => $request->input('seed_grower_in_past'),
            'cropping_histroy' => $request->input('cropping_histroy'),
            'have_adequate_isolation' => $request->input('have_adequate_isolation'),
            'have_adequate_labor' => $request->input('have_adequate_labor'),
            'aware_of_minimum_standards' => $request->input('aware_of_minimum_standards'),
            'signature_of_applicant' => $request->input('signature_of_applicant')
        ]);

        // Form sr6 created, return success response
        return response()->json([
            'success' => true,
            'message' => 'SR6 form submit success!',
            'form' => $form
        ], 200);
    }
}
