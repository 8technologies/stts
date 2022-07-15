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

        // $total_import_permits = DB::table('import_export_permits')->where('administrator_id', $user->id)->count();
        // $total_export_permits = DB::table('import_export_permits')->where('administrator_id', $user->id)->count();
        // $total_planting_returns_company = DB::table('planting_returns')->where('administrator_id', $user->id)->count();
        // $total_planting_returns_grower = DB::table('sub_growers')->where('administrator_id', $user->id)->count();
        // $total_form_sr10s = DB::table('form_sr10s')->where('administrator_id', $user->id)->count();
        // $total_form_qds = DB::table('form_qds')->where('administrator_id', $user->id)->count();
        // $total_seed_labs = DB::table('seed_labs')->where('administrator_id', $user->id)->count();
        // $total_seed_labels = DB::table('seed_labels')->where('administrator_id', $user->id)->count();

        $total_import_permits = DB::table('import_export_permits')->where('administrator_id', 21)->count();
        $total_export_permits = DB::table('import_export_permits')->where('administrator_id', 21)->count();
        $total_planting_returns_company = DB::table('planting_returns')->where('administrator_id', 21)->count();
        $total_planting_returns_grower = DB::table('sub_growers')->where('administrator_id', 21)->count();
        $total_form_sr10s = DB::table('form_sr10s')->where('administrator_id', 21)->count();
        $total_form_qds = DB::table('form_qds')->where('administrator_id', 21)->count();
        $total_seed_labs = DB::table('seed_labs')->where('administrator_id', 21)->count();
        $total_seed_labels = DB::table('seed_labels')->where('administrator_id', 21)->count();

        return view('admin.chartjs.pie', [
            'total_import_permits'=> $total_import_permits,
            'total_export_permits'=> $total_export_permits,
            'total_planting_returns_company'=> $total_planting_returns_company,
            'total_planting_returns_grower'=> $total_planting_returns_grower,
            'total_form_sr10s'=> $total_form_sr10s,
            'total_form_qds'=> $total_form_qds,
            'total_seed_labs'=> $total_seed_labs,
            'total_seed_labels'=> $total_seed_labels
        ]);
    }
}
