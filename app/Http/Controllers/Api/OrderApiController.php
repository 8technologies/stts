<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


class OrderApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        // $this->middleware('auth');
        $this->middleware('auth');
    }

    public function order_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = Order::where('order_by', $user->id)->get();
        // $query = DB::table('orders')->where('order_by', $user->id)->get();
        // $query = Order::all();
        
        return $this->successResponse($query, $message="List of Orders"); 
    }   
}
