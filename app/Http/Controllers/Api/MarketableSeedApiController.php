<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\FormStockExaminationRequest;
use Encore\Admin\Controllers\AdminController; 
use Encore\Admin\Form; 
use Encore\Admin\Grid; 
use Encore\Admin\Show; 
use Illuminate\Support\Facades\Request; 
use App\Admin\Extensions\Tools\GridView; 
use Symfony\Component\HttpFoundation\Response;


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
        // return MarketableSeed::all();  
        $user = auth()->user();
        $query = MarketableSeed::all()->where('administrator_id', $user->id)->get();
        
        return response()->json([
            'success' => false,
            'user id' => $query,
            'data' => $query,
        ], Response::HTTP_OK); 
    }   
}
