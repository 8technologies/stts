<?php

namespace App\Http\Controllers\Api;

use App\Models\FormSr6;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 
use App\Traits\ApiResponser;


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
}
