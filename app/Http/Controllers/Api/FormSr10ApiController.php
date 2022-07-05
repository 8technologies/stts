<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use App\Models\FormSr10; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;


class FormSr10ApiController extends AdminController
{    
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
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    } 
}
