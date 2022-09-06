<?php

namespace App\Http\Controllers\Api;

use App\Models\SeedLab;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
use App\Models\Utils;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class SeedLabApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function seed_lab_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = SeedLab::where('administrator_id', '=', $user->id)->get();
        return $this->successResponse($query, $message = "Seed Labs");
    }


    // create seed lab create via api
    public function seed_lab_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            'form_stock_examination_request_id',
            'collection_date',
            'applicant_remarks',
        );

        $post_data = Validator::make($data, [
            'form_stock_examination_request_id',
            'collection_date' => 'required',
            'applicant_remarks' => 'required',
        ]);


        if ($post_data->fails()) {
            return $this->errorResponse("Seed Lab submit error", 200);
        }
        $payment_receipt = Utils::upload_images_1($_FILES, true);


        $form = SeedLab::create([
            'administrator_id' => $user->id,
            'form_stock_examination_request_id' => $request->input('form_stock_examination_request_id'),
            'collection_date' => $request->input('collection_date'),
            'payment_receipt' => $payment_receipt,
            'applicant_remarks' => $request->input('applicant_remarks'),
        ]);

        // Form created, return success response
        return $this->successResponse($form, "Seed Lab submit success!", 201);
    }


    // delete seed lab
    public function seed_lab_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = SeedLab::find($id);
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        SeedLab::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
