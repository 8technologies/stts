<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\FormStockExaminationRequest;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FormStockExaminationRequestApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_stock_examination_requests_create(Request $request)
    {
        $user = auth()->user();

        $data = $request->only(
            'examination_category',
            'remarks',
        );

        $post_data = Validator::make($data, [
            'examination_category' => 'required',
            'remarks' => 'required',
        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("Validation failed", 200);
        }

        $form = new FormStockExaminationRequest();
        $form->examination_category = $request->examination_category;
        $form->remarks = $request->remarks;
        $form->planting_return_id = $request->planting_return_id;//    
        $form->export_permit_id = $request->export_permit_id;//    
        $form->administrator_id = $user->id;
        $form->status = 0;
        $form->save();


        return $this->successResponse($form, 'Form was submitted successfully.', 201);
    }

    public function form_stock_examination_requests_list()
    {
        $user = auth()->user();
        $query = DB::table('form_stock_examination_requests')->where('administrator_id', $user->id)->get();

        return $this->successResponse($query, $message = "Stock Examination requests");
    }



    // delete stock examination request
    public function form_stock_examination_requests_delete(Request $request)  //\Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = FormStockExaminationRequest::find($id);

        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        FormStockExaminationRequest::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
