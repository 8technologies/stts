<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


class MarketableSeedApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        // $this->middleware('auth');
        $this->middleware('auth');
    }

    public function marktable_seed_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = DB::table('marketable_seeds')->where('administrator_id', '=', $user->id)->get();
        // $query = MarketableSeed::all();
        
        
        return $this->successResponse($query, $message="Marketable seeds list."); 
    }   
}
