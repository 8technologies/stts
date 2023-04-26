<?php

namespace App\Admin\Controllers\Dashboard;

use App\Models\FormQds;
use App\Models\FormSr10;
use App\Models\FormStockExaminationRequest;
// use Encore\Admin\Admin;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Encore\Admin\Controllers\AdminController; 
use App\Models\ImportExportPermit;
use App\Models\MarketableSeed;
use App\Models\Order;
use App\Models\PlantingReturn;
use App\Models\PreOrder;
use App\Models\Product;
use App\Models\Quotation;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\StockRecord;
use DateTime as GlobalDateTime;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Form\Field\Datetime;


class HomeDashboardController1 extends AdminController
{
    public function __construct()
    {
        $this->middleware('auth');
    }


    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public static function indexx()
    {
        if (Admin::user()->isRole('super-admin')) {
            $my_role= "Super Admin";
        } else if (Admin::user()->isRole('admin')) {
            $my_role= "Admin"; 
        }else if (Admin::user()->isRole('basic-user')) {
                $my_role= "Basic User";
        } else if (Admin::user()->isRole('inspector')) {
            $my_role= "Inspector";
        } else if (Admin::user()->isRole('lab-reception')) {
            $my_role= "Lab Receptionist";
        } else if (Admin::user()->isRole('lab-technician')) {
            $my_role= "Lab Technician";
        } else if (Admin::user()->isRole('usta')) {
            $my_role= "USTA";
        } else {
            $my_role= "!!Unknown Role!!";
        }

        $envs = [
            ['name' => 'Today:', 'value' => date('l, d F Y H:i:s')],
            ['name' => 'Logged in as: ', 'value' => $my_role],

            ['name' => "DATA", 'value' => ""],

            ['name' => 'Registered users:', 'value' => Administrator::get()->count()],

            ['name' => 'Import Permits:', 'value' =>  ImportExportPermit::get()->count()],
            ['name' => 'Export Permits:', 'value' =>  ImportExportPermit::get()->count()],
            ['name' => 'Planting returns:', 'value' => PlantingReturn::get()->count()],
            ['name' => 'SR10 Forms:', 'value' => FormSr10::get()->count()],
            ['name' => 'QDS Forms:', 'value' => FormQds::get()->count()],
            ['name' => 'Seed Labs:', 'value' => SeedLab::get()->count()],
            ['name' => 'Seed Labels:', 'value' => SeedLabel::get()->count()],

            ['name' => 'Stock Examination Requests:', 'value' => FormStockExaminationRequest::get()->count()],
            ['name' => 'Stock Records:', 'value' => StockRecord::where()->count()],
            ['name' => 'Marketable Seed:', 'value' => MarketableSeed::get()->count()],

            ['name' => 'Marketplace:', 'value' => Product::get()->count()],
            ['name' => 'Orders:', 'value' => Order::get()->count()],
            ['name' => 'PreOrders:', 'value' => PreOrder::get()->count()],
            ['name' => 'Quotations:', 'value' => Quotation::get()->count()],

            ['name' => 'Timezone:', 'value' => config('app.timezone')],
            ['name' => 'Locale:', 'value' => config('app.locale')],
        ];

        $user = auth()->user();

        $non_admin_envs = [
            ['name' => 'Today:', 'value' => date('l, d F Y H:i:s')],
            ['name' => 'Logged in as: ', 'value' => $my_role],
            
            ['name' => "DATA", 'value' => ""],
            ['name' => 'Import Permits:', 'value' =>  ImportExportPermit::where('administrator_id', $user->id)->count()],
            ['name' => 'Export Permits:', 'value' =>  ImportExportPermit::where('administrator_id', $user->id)->count()],
            ['name' => 'Planting returns:', 'value' => PlantingReturn::where('administrator_id', $user->id)->count()],
            ['name' => 'SR10 Forms:', 'value' => FormSr10::where('administrator_id', $user->id)->count()],
            ['name' => 'QDS Forms:', 'value' => FormQds::where('administrator_id', $user->id)->count()],
            ['name' => 'Seed Labs:', 'value' => SeedLab::where('administrator_id', $user->id)->count()],
            ['name' => 'Seed Labels:', 'value' => SeedLabel::where('administrator_id', $user->id)->count()],

            ['name' => 'Stock Examination Requests:', 'value' => FormStockExaminationRequest::where('administrator_id', $user->id)->count()],
            ['name' => 'Stock Records:', 'value' => StockRecord::where('administrator_id', $user->id)->count()],
            ['name' => 'Marketable Seed:', 'value' => MarketableSeed::where('administrator_id', $user->id)->count()],

            ['name' => 'Marketplace:', 'value' => Product::get()->count()],
            ['name' => 'Orders:', 'value' => Order::where('administrator_id', $user->id)->count()],
            ['name' => 'PreOrders:', 'value' => PreOrder::where('administrator_id', $user->id)->count()],
            ['name' => 'Quotations:', 'value' => Quotation::where('administrator_id', $user->id)->count()],

            // ['name' => 'Timezone:', 'value' => config('app.timezone')],
            // ['name' => 'Locale:', 'value' => config('app.locale')],
        ];
        
        if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) {
            return view('admin.chartjs.bar', compact('envs'));
        }
        return view('admin.chartjs.bar', compact([
            'Marketplace',
        ]));
    }


    public static function indexx2()
    {
        $envs = [
            ['name' => "DATA", 'value' => ""],
            
            ['name' => 'Registered users:', 'value' => Administrator::get()->count()],

            ['name' => 'Import Permits:', 'value' =>  ImportExportPermit::get()->count()],
            ['name' => 'Export Permits:', 'value' =>  ImportExportPermit::get()->count()],
         
        ];

        $user = auth()->user();

        $non_admin_envs = [
            ['name' => "DATA", 'value' => ""],
            ['name' => 'Import Permits:', 'value' =>  ImportExportPermit::where('administrator_id', $user->id)->count()],
            ['name' => 'Export Permits:', 'value' =>  ImportExportPermit::where('administrator_id', $user->id)->count()],
          
            
        ];

        
        if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) {
            return view('admin::dashboard.dash', compact('envs'));
        }
        return view('admin::dashboard.dash2', compact('non_admin_envs'));
    }


    public static function indexx3()
    {
        
        if (Admin::user()->isRole('super-admin')) {
            $my_role= "Super Admin";
        } else if (Admin::user()->isRole('admin')) {
            $my_role= "Admin"; 
        }else if (Admin::user()->isRole('basic-user')) {
                $my_role= "Basic User";
        } else if (Admin::user()->isRole('inspector')) {
            $my_role= "Inspector";
        } else if (Admin::user()->isRole('lab-reception')) {
            $my_role= "Lab Receptionist";
        } else if (Admin::user()->isRole('lab-technician')) {
            $my_role= "Lab Technician";
        } else if (Admin::user()->isRole('usta')) {
            $my_role= "USTA";
        } else {
            $my_role= "!!Unknown Role!!";
        }

        $envs = [
            ['name' => "DATA", 'value' => ""],
            
            ['name' => 'Registered users:', 'value' => Administrator::get()->count()],

            ['name' => 'Import Permits:', 'value' =>  ImportExportPermit::get()->count()],
            ['name' => 'Export Permits:', 'value' =>  ImportExportPermit::get()->count()],            
        ];

        $user = auth()->user();

        $non_admin_envs = [
            ['name' => "DATA", 'value' => ""],
            ['name' => 'Import Permits:', 'value' =>  ImportExportPermit::where('administrator_id', $user->id)->count()],
            ['name' => 'Export Permits:', 'value' =>  ImportExportPermit::where('administrator_id', $user->id)->count()],  
        ];

        
        if (Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')) {
            return view('admin::dashboard.dash', compact('envs'));
        }
        return view('admin::dashboard.dash3', compact('non_admin_envs'));
    }
}
