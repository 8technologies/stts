<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use App\Models\FormSr10; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class FormSr10ApiController extends AdminController
{    
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_sr10_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('form_sr10s')->where('administrator_id', '=', $user->id)->get();
        // $query = FormSr10::all();
        
        
        return $this->successResponse($query, $message="SR10 forms"); 
    } 

    // form_sr10_create
    public function planting_returns_grower_create(Request $request)
    {
        // code here..
    }
}
