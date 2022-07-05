<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController;  
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Models\PreOrder;


class PreOrderApiController extends AdminController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function pre_order_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        // $query = DB::table('pre_orders')->where('administrator_id', '=', $user->id)->get();
        $query = PreOrder::all();
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    }    
}
