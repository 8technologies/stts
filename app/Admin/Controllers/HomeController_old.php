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
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') 
            ) {

                $box3 = new Box('Number of SR4 Forms submitted', view('admin.dashboard.submitted_sr4_forms'));
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

            #======================= Users - Starts =========================#
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') 
            ) {
                $row->column(4, new InfoBox(
                    ''
                        . AdminRoleUser::where('role_id', 2)->count() . " Admins, "
                        . AdminRoleUser::where('role_id', 3)->count() . " Basic Users, "
                        . AdminRoleUser::where('role_id', 4)->count() . " Inspectors "
                        // . AdminRoleUser::where('role_id', 5)->count() . " Lab receptionists, "
                        // . AdminRoleUser::where('role_id', 6)->count() . " Lab technicians, "
                        // . AdminRoleUser::where('role_id', 1)->count() . " Super Admins, "
                        // . AdminRoleUser::where('role_id', 7)->count() . " USTA users. ",
                    ,'All users',
                    'green',
                    admin_url('/auth/users'),
                    Administrator::count() . " - Registered Users"
                ));
            }
            #======================= Users - ends =========================#


            #======================= Sr6s forms - Starts =========================#
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') ||
                Admin::user()->isRole('basic-user')

            ) {
                if (Admin::user()->isRole('admin')) {
                    $count = FormSr6::count();
                    $_count = FormSr6::where('status', "=", 1)->count();
                } else if (Admin::user()->isRole('inspector')) {
                    $count = FormSr6::where('inspector', Admin::user()->id)->count();
                    $_count = FormSr6::where([
                        'status' => 2,
                        'inspector' => Admin::user()->id,
                    ])->count();
                } else if (Admin::user()->isRole('basic-user')) {
                    $count = FormSr6::where('administrator_id', Admin::user()->id)->count();
                    $_count = FormSr6::where([
                        'status' => 1,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                    $_count += FormSr6::where([
                        'status' => 3,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                }
                $color = "green";
                if ($_count > 0) {
                    $color = "red";
                }
                $row->column(4, new InfoBox(
                    "{$_count} Need(s) attention.",
                    'wpforms',
                    $color,
                    admin_url('/import-export-permits'),
                    $count . " - Sr6 Forms"
                ));
            }
            #======================= Sr6s forms - Ends =========================#



            #======================= FormSr4 forms - Starts =========================#
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') ||
                Admin::user()->isRole('basic-user')

            ) {
                if (Admin::user()->isRole('admin')) {
                    $count = FormSr4::count();
                    $_count = FormSr4::where('status', "=", 1)->count();
                } else if (Admin::user()->isRole('inspector')) {
                    $count = FormSr4::where('inspector', Admin::user()->id)->count();
                    $_count = FormSr4::where([
                        'status' => 2,
                        'inspector' => Admin::user()->id,
                    ])->count();
                } else if (Admin::user()->isRole('basic-user')) {
                    $count = FormSr4::where('administrator_id', Admin::user()->id)->count();
                    $_count = FormSr4::where([
                        'status' => 1,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                    $_count += FormSr4::where([
                        'status' => 3,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                }
                
                $color = "green";
                // if ($_count > 0) {
                //     $color = "blue";
                // }
                $row->column(4, new InfoBox(
                    "{$_count} Need(s) attention.",
                    'wpforms',
                    $color,
                    admin_url('/import-export-permits'),
                    $count . " - Sr4 forms"
                ));
            }
            #======================= FormSr4 forms - Ends =========================#


            #======================= Import permits - Starts =========================#
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') ||
                Admin::user()->isRole('basic-user')

            ) {
                if (Admin::user()->isRole('admin')) {
                    $count = ImportExportPermit::count();
                    $_count = ImportExportPermit::where('status', "=", 1)->count();
                } else if (Admin::user()->isRole('inspector')) {
                    $count = ImportExportPermit::where('inspector', Admin::user()->id)->count();
                    $_count = ImportExportPermit::where([
                        'status' => 2,
                        'inspector' => Admin::user()->id,
                    ])->count();
                } else if (Admin::user()->isRole('basic-user')) {
                    $count = ImportExportPermit::where('administrator_id', Admin::user()->id)->count();
                    $_count = ImportExportPermit::where([
                        'status' => 1,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                    $_count += ImportExportPermit::where([
                        'status' => 3,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                }
                $color = "green";
                // if ($_count > 0) {
                //     $color = "blue";
                // }
                $row->column(4, new InfoBox(
                    "{$_count} Need(s) attention.",
                    'wpforms',
                    $color,
                    admin_url('/import-export-permits'),
                    $count . " - Import/Exports"
                ));
            }
            #======================= Import permits - Ends =========================#



            #======================= QDS Producer - Starts =========================#
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') ||
                Admin::user()->isRole('basic-user')

            ) {
                if (Admin::user()->isRole('admin')) {
                    $count = FormQds::count();
                    $_count = FormQds::where('status', "=", 1)->count();
                } else if (Admin::user()->isRole('inspector')) {
                    $count = FormQds::where('inspector', Admin::user()->id)->count();
                    $_count = FormQds::where([
                        'status' => 2,
                        'inspector' => Admin::user()->id,
                    ])->count();
                } else if (Admin::user()->isRole('basic-user')) {
                    $count = FormQds::where('administrator_id', Admin::user()->id)->count();
                    $_count = FormQds::where([
                        'status' => 1,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                    $_count += FormQds::where([
                        'status' => 3,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                }
                $color = "green";
                // if ($_count > 0) {
                //     $color = "red";
                // }
                $row->column(4, new InfoBox(
                    "{$_count} Need(s) attention.",
                    'wpforms',
                    $color,
                    admin_url('/form-qds'),
                    $count . " - QDS forms"
                ));
            }
            #======================= QDS Producer - Ends =========================#


            #======================= Planting Return - Starts =========================#
            if (
                Admin::user()->isRole('admin') ||
                Admin::user()->isRole('inspector') ||
                Admin::user()->isRole('basic-user')

            ) {
                if (Admin::user()->isRole('admin')) {
                    $count = PlantingReturn::count();
                    $_count = PlantingReturn::where('status', "=", 1)->count();
                } else if (Admin::user()->isRole('inspector')) {
                    $count = PlantingReturn::where('inspector', Admin::user()->id)->count();
                    $_count = PlantingReturn::where([
                        'status' => 2,
                        'inspector' => Admin::user()->id,
                    ])->count();
                } else if (Admin::user()->isRole('basic-user')) {
                    $count = PlantingReturn::where('administrator_id', Admin::user()->id)->count();
                    $_count = PlantingReturn::where([
                        'status' => 1,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                    $_count += PlantingReturn::where([
                        'status' => 3,
                        'administrator_id' => Admin::user()->id,
                    ])
                        ->count();
                }
                $color = "green";
                // if ($_count > 0) {
                //     $color = "red";
                // }
                $row->column(4, new InfoBox(
                    "{$_count} Need(s) attention.",
                    'wpforms',
                    $color,
                    admin_url('/planting-returns'),
                    $count . "  - QDS forms"
                ));
            }
            #======================= Planting Return - Ends =========================#


        });
        return $content;


        return $content
            ->title('Dashboard')
            ->description('Description...')
            // ->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append("Main dashboard...");
                    $column->append(Dashboard::environment());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
    }
}
