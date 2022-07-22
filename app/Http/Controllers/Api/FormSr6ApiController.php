<?php

namespace App\Http\Controllers\Api;

use App\Models\Crop;
use App\Models\FormSr6;
use App\Models\FormSr6HasCrop;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser; 
use IWasHereFirst2\LaravelMultiMail\Facades\Multimail;
use Illuminate\Support\Facades\Mail;


class FormSr6ApiController extends AdminController 
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_sr6_list()
    {
        $user = auth()->user();
        $query = DB::table('form_sr6s')->where('administrator_id', '=', $user->id)->get();
        // $query = FormSr6::all();

        return $this->successResponse($query, $message="SR6 forms"); 
    } 


    // create new sr4 form
    public function form_sr6_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            'type',
            'address',
            'premises_location',
            'years_of_expirience',
            'form_sr6_has_crops',
            'crop_id',
            'seed_grower_in_past',
            'cropping_histroy',
            'have_adequate_storage',
            'have_adequate_isolation',
            'have_adequate_labor',
            'aware_of_minimum_standards',
            'signature_of_applicant',
        );

        $post_data = Validator::make($data, [
            'type' => 'required',
            'address' => 'required',
            'premises_location' => 'required',
            'years_of_expirience' => 'required',
            'form_sr6_has_crops' => 'required',
            'seed_grower_in_past' => 'required',
            'cropping_histroy' => 'required',
            'have_adequate_storage' => 'required',
            'have_adequate_isolation' => 'required',
            'have_adequate_labor' => 'required',
            'aware_of_minimum_standards' => 'required', 
        ]);
        
 
        if ($post_data->fails()) {
            return $this->errorResponse("SR6 form submit error", 200); 
        }

        $form = FormSr6::create([
            'administrator_id' => $user->id,
            'type' => $request->input('type'),
            'name_of_applicant' => $user->name,
            'address' => $request->input('address'),
            'premises_location' => $request->input('premises_location'),
            'years_of_expirience' => $request->input('years_of_expirience'), 
            'seed_grower_in_past' => $request->input('seed_grower_in_past'),
            'cropping_histroy' => $request->input('cropping_histroy'),
            'have_adequate_storage' => $request->input('have_adequate_storage'),
            'have_adequate_isolation' => $request->input('have_adequate_isolation'),
            'have_adequate_labor' => $request->input('have_adequate_labor'),
            'aware_of_minimum_standards' => $request->input('aware_of_minimum_standards'), 
            'receipt' => $request->input('receipt'), 
            'previous_grower_number' => $request->input('previous_grower_number'), 
        ]);

        // send bunch of notification via email
        if($form){
            // MultiMail::to($user)->from('info@8technologies.net')->send(new \App\Mail\SR6FormAdded($user));
            Mail::to($user)->send(new \App\Mail\SR6FormAdded($user));
        }

        $form_sr6_has_crops_items = json_decode($request->input('form_sr6_has_crops'));
        if($form_sr6_has_crops_items!=null){
            if(is_array($form_sr6_has_crops_items)){ 
                foreach ($form_sr6_has_crops_items as $key => $value) {
                    $crop_id = ((int)($value));
                    $crop = Crop::find($crop_id);
                    if($crop == null){
                        continue;
                    }
                    $FormSr6HasCrop = new FormSr6HasCrop();
                    $FormSr6HasCrop->form_sr6_id = $form->id;
                    $FormSr6HasCrop->crop_id = $crop_id;
                    $FormSr6HasCrop->save();
                }
            }
        } 
        
        // Form created, return success response
        
        return $this->successResponse($form, "SR6 form submitted successfully!", 201); 
    }
}
