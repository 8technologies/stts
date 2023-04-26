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
       
        $total_stock_examination = DB::table('form_stock_examination_requests')->where('administrator_id', 3)->count();
        $total_my_stock = DB::table('stock_records')->where('administrator_id', 3)->count();
        $total_marketable_seed = DB::table('marketable_seeds')->where('administrator_id', 3)->count();
        
        $context = [
            'total_stock_examination'=> $total_stock_examination,
            'total_my_stock'=> $total_my_stock,
            'total_marketable_seed'=> $total_marketable_seed
        ];

        return view('admin.chartjs.line', compact('context'));
    }
}
