<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use App\Models\FormStockExaminationRequest;
use Encore\Admin\Controllers\AdminController; 
use Encore\Admin\Form; 
use Encore\Admin\Grid; 
use Encore\Admin\Show; 
use Illuminate\Support\Facades\Request; 
use App\Admin\Extensions\Tools\GridView; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


class ProductApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        // $this->middleware('auth');
        $this->middleware('auth');
    }

    public function products_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        // $query = Product::where('administrator_id', $user->id)->get();
        // $query = DB::table('products')->where('administrator_id', '=', $user->id)->get();
        $query = Product::all();
        
        return $this->successResponse($query, $message="List of Marketplace products"); 
    }   
}
