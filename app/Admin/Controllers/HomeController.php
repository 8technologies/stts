<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\Callout;
use Encore\Admin\Layout\Column;
use App\Admin\Controllers\Dashboard\HomeDashboardController;
use Encore\Admin\Facades\Admin;


class HomeController extends Controller
{
    public function index(Content $content)
    {          
        return $content
            ->title($title = Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')? 'The Admin Dashboard': 'Showing your Dashboard')
        
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append(HomeDashboardController::indexx());
                });

                $bar = view('admin.chartjs.pie');
                $row->column(1/3, new Box('Quality Assurance Statistics\' Pie Chart', $bar));

                $bar = view('admin.chartjs.bar');
                $row->column(1/3, new Box('Marktet place Statistics\' Bar Graph', $bar));

                $bar = view('admin.chartjs.line');
                $row->column(1/3, new Box('Marktet place Statistics\' Bar Graph', $bar));

                $row->column(4, function (Column $column) {
                    $column->append(HomeDashboardController::indexx2());
                });

                $row->column(4, function (Column $column) {
                    $column->append(HomeDashboardController::indexx3());
                });

            });     
    }
}
