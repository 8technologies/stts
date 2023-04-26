<?php

namespace App\Http\Controllers\Api;

use App\Models\Crop;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use App\Models\FormQds;
use App\Models\QdsHasCrop;
use App\Models\Utils;
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

        return $this->successResponse($query, $message = "QDS forms");
    }


    public function form_qds_create(Request $request)
    { // \Illuminate\Http\JsonResponse
        $user = Auth::user();


        $has_form = FormQds::where([
            'administrator_id' => $user->id,
        ])->first();

        if ($has_form != null) {
            return $this->errorResponse("You already have active QDS Certificate.", 200);
        }



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

        );

        $post_data = Validator::make($data, [
            'address' => 'required',
            'premises_location' => 'required',
            'years_of_expirience' => 'required',
        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("QDS form submit error", 200);
        }

        $receipt = Utils::upload_images_1($_FILES, true);
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
            'signature_of_applicant' => $receipt,
        ]);

        $qds_crops_items = json_decode($request->input('qds_crops'));
        if ($qds_crops_items != null) {
            if (is_array($qds_crops_items)) {
                foreach ($qds_crops_items as $key => $value) {
                    $crop_id = ((int)($value));
                    $crop = Crop::find($crop_id);
                    if ($crop == null) {
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


    // delete qds form
    public function form_qds_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = FormQds::find($id);
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        FormQds::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
