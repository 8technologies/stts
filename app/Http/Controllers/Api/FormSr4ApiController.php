<?php

namespace App\Http\Controllers\Api;

use App\Models\FormSr6;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use App\Models\FormSr4;
use App\Models\Utils;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;


class FormSr4ApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_sr4_list()
    {
        $user = auth()->user();
        $query = DB::table('form_sr4s')->where('administrator_id', '=', $user->id)->get();

        return $this->successResponse($query, $message = "SR4 forms");
    }


    // create new sr4 form
    public function form_sr4_create(Request $request): \Illuminate\Http\JsonResponse
    {
 
        $user = Auth::user();
 
        $data = $request->only(
            'type',
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

            'accept_declaration' => 'required',
        ]);
        $has_form = FormSr4::where([
            'administrator_id' => $user->id,
            'status' => 5,
            'type' => $request->input('type'),
        ])->first();

        $type = $request->input('type');
        if ($has_form != null) {
            return $this->errorResponse("You already have active $type form.", 200); 
        }
        
        if ($post_data->fails()) {
            //return $this->errorResponse("SR4 form submit error", 200); 
        }

        $receipt = Utils::upload_images_1($_FILES,true); 

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
            'receipt' => $receipt,
            'accept_declaration' => $request->input('accept_declaration')
        ]);

        // Form created, return success response
        return $this->successResponse($form, "SR4 form submit success!", 201);
    }

    
    // delete sr4 form
    public function form_sr4_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();
        $id = ((int)($request->input('id')));
        $item = FormSr4::find($id);
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user->id) {
            return $this->errorResponse("You cannot delete an item that does not belog to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }

        FormSr4::where(['id' => $id ])->delete();


        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
