<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;


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
}
