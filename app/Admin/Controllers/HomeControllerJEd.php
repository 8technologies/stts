<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\AdminRoleUser;
use App\Models\CropInspectionType;
use App\Models\CropVariety;
use App\Models\FormQds;
use App\Models\FormSr4;
use App\Models\FormSr6;
use App\Models\ImportExportPermit;
use App\Models\PlantingReturn;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Collapse;
use Encore\Admin\Widgets\InfoBox;
use Encore\Admin\Widgets\Tab;
use Encore\Admin\Widgets\Table;
use Illuminate\Support\Facades\Auth;


class HomeController extends Controller
{
    public function index(Content $content)
    {
        // foreach (CropInspectionType::all() as $key => $v) {
        //     echo "==> {$v->crop->name}<hr>";
        // }
        // dd();

        $content->title('Admin Dashboard');
        //$content->description('Description...');

        $content->row(function ($row) { 
            if (Admin::user()->isRole('admin') || Admin::user()->isRole('inspector')) {

                $box3 = new Box('About the SR4 Forms submitted', view('admin.dashboard.submitted_sr4_forms'));
                $box3->removable();
                $box3->collapsable();
                $box3->style('success');
                $box3->solid();
                $row->column(6, $box3);

                $box1 = new Box('Marketable seed', view('admin.dashboard.chart-marketable-seed'));
                $box1->removable();
                $box1->collapsable();
                $box1->style('success');
                $box1->solid();
                $row->column(6, $box1);
            }

        });
        return $content;
    
    }


    // public function index2()
    // {
    //     if (Admin::user()->isRole('admin') || Admin::user()->isRole('inspector')) {
    //         return Admin::content(function (Content $content) {
    //             $content->header('chart');
    //             $content->description('.....');
    //             $content->body(view('admin.charts.bar'));
    //         });
    //     }
    // }
}
