<?php

namespace App\Http\Controllers\Api;

use App\Models\Quotation;
use Encore\Admin\Controllers\AdminController;  
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;


class QuotationApiController extends AdminController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function quotations_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = DB::table('quotations')->where('administrator_id', '=', $user->id)->get();
        // $query = Quotation::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    }    
}
