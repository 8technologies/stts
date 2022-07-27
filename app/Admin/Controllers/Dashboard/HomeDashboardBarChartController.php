<?php

namespace App\Admin\Controllers\Dashboard;

use Encore\Admin\Controllers\AdminController; 
use App\Models\Order;
use App\Models\PreOrder;
use App\Models\Product;
use App\Models\Quotation;
use App\Models\ImportExportPermit;
use App\Models\PlantingReturn;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\FormQds;
use App\Models\FormSr10;


class HomeDashboardBarChartController extends AdminController
{
    public static function index_bar()
    {
        $user_id = auth()->user()->id;

        $products_total = Product::get()->count();
        $orders_total = Order::get()->where('administrator_id', $user_id)->count();
        $pre_orders_total = PreOrder::get()->where('administrator_id', $user_id)->count();
        $quotations_total = Quotation::get()->where('administrator_id', $user_id)->count();

        // dd($quotations_total);
        
        return view('admin::dashboard.dash', [
            'products_total' => $products_total,
            'orders_total' => $orders_total,
            'pre_orders_total' => $pre_orders_total,
            'quotations_total' => $quotations_total 
        ]);
    }

    public static function index_pie()
    {
        $user_id = auth()->user()->id;
        $data = [];

        $import_permit_total = ImportExportPermit::where(['administrator_id'=>$user_id, 'is_import'=>1])->count();
        $export_permit_total = ImportExportPermit::where('administrator_id', $user_id)->count();
        $planting_return_total = PlantingReturn::where('administrator_id', $user_id)->count();
        $form_sr10_total = FormSr10::where('administrator_id', $user_id)->count();
        $form_qds_total = FormQds::where('administrator_id', $user_id)->count();
        $seed_lab_total = SeedLab::where('administrator_id', $user_id)->count();
        $seed_label_total = SeedLabel::where('administrator_id', $user_id)->count();

        return view('admin::dashboard.dash', compact(
            $data['import_permit_total'] = $import_permit_total,
            $data['export_permit_total'] = $export_permit_total,
            $data['planting_return_total'] = $planting_return_total,
            $data['form_sr10_total'] = $form_sr10_total,
            $data['form_qds_total'] = $form_qds_total,
            $data['seed_lab_total'] = $seed_lab_total,
            $data['seed_label_total'] = $seed_label_total,
        ));
    }

    public static function index_line()
    {
        $user_id = auth()->user()->id;
        $data = [];

        $products_total = Product::get()->count();
        $orders_total = Order::get()->count()->where('administrator_id', $user_id);
        $pre_orders_total = PreOrder::get()->count()->where('administrator_id', $user_id);
        $quotations_total = Quotation::get()->count()->where('administrator_id', $user_id);

        return view('admin:dashboard.dash', compact(
            $data['products_total'] = $products_total,
            $data['orders_total'] = $orders_total,
            $data['pre_orders_total'] = $pre_orders_total,
            $data['quotations_total'] = $quotations_total
        ));
    }
}
