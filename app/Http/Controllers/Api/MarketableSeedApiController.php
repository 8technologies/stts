<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;


class MarketableSeedApiController extends AdminController
{
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
        
        return response()->json([
            'success' => true,
            'Logged in user' => $user->name,
            'data' => $query,
        ], Response::HTTP_OK); 
    }   
}
