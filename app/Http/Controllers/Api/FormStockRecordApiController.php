<?php

namespace App\Http\Controllers\Api;

use App\Models\StockRecord;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


class FormStockRecordApiController extends AdminController
{ 
    use ApiResponser;
    
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_stock_records_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = DB::table('stock_records')->where('administrator_id', '=', $user->id)->get();
        // $query = StockRecord::all();
                
        return $this->successResponse($query, $message="My Stock Records"); 
    }   
}
