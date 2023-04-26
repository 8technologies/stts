<?php

namespace App\Admin\Controllers\Charts\QualityAssurance;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use Illuminate\Support\Facades\DB;


class PieChartTotalsController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }
    
    public function index(Content $content)
    {
        $user = auth()->user();

        // $total_products = DB::table('import_export_permits')->where('administrator_id', $user->id)->count();
       
        $total_products = DB::table('products')->where('administrator_id', 3)->count();
        $total_orders = DB::table('orders')->where('administrator_id', 3)->count();
        $total_pre_orders = DB::table('pre_orders')->where('administrator_id', 3)->count();
        $total_quotations = DB::table('quotations')->where('administrator_id', 3)->count();
        
        $context = [
            'total_products'=> $total_products,
            'total_orders'=> $total_orders,
            'total_pre_orders'=> $total_pre_orders,
            'total_quotations'=> $total_quotations
        ];

        return view('admin.chartjs.bar', compact('context'));
    }
}
