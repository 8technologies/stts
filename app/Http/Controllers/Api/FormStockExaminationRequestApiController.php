<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\FormStockExaminationRequest;
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
}
