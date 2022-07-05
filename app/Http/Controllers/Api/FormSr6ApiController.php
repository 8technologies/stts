<?php

namespace App\Http\Controllers\Api;

use App\Models\FormSr6;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB; 


class FormSr6ApiController extends AdminController 
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_sr6_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('form_sr6s')->where('administrator_id', '=', $user->id)->get();
        // $query = FormSr6::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    } 
    
}
