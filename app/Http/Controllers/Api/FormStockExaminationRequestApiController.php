<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\FormStockExaminationRequest;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


class FormStockExaminationRequestApiController extends AdminController
{ 
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_stock_examination_requests_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = DB::table('form_stock_examination_requests')->where('administrator_id', $user->id)->get();
        // $query = FormStockExaminationRequest::all();
        
        return $this->successResponse($query, $message="Stock Examination requests"); 
    }   
}
