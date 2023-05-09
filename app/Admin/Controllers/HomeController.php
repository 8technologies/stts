<?php

namespace App\Admin\Controllers;

use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Column;
use Encore\Admin\Widgets;
use Encore\Admin\Widgets\Box;
use App\Admin\Controllers\Dashboard\HomeDashboardController2;
use Encore\Admin\Facades\Admin;


class HomeController extends Controller
{
    public function myChart(Content $content) {            
        return $content
        ->title($title = Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')? 'The Admin Dashboard': 'Showing your Dashboard')
    
        ->row(function (Row $row) {

            $row->column(1/3, function (Column $column) {
                $box  = new Box(
                    Admin::user()->isRole('super-admin') || Admin::user()->isRole('admin')?"At a glance- (General activity)":"At a glance- (Your activity)", HomeDashboardController2::indexx());
                $box->style('success');
                $column->append($box);
            });

            
            // $bar = view('admin.chartjs.bar');
            // $row->column(1/3, new Box('Marktet place Statistics\' Bar Graph', $bar));

            // $bar = view('admin.chartjs.line');
            // $row->column(1/3, new Box('Marktet place Statistics\' Bar Graph', $bar));

            // $bar = view('admin.chartjs.pie');
            // $row->column(1/3, new Box('Quality Assurance Statistics\' Pie Chart', $bar));

            $row->column(1/3, function (Column $column) {
                $box  = new Box('Marketplace Bar Graph', view('admin.chartjs.bar'));
                $box->style('success');
                $column->append($box);
            });

            $row->column(1/3, function (Column $column) {
                $box  = new Box('Seed Stock Line Graph', view('admin.chartjs.line'));
                $box->style('success');
                $column->append($box);
            });

            $row->column(1/3, function (Column $column) {
                $box  = new Box('Scatter Graph', view('admin.chartjs.scatter'));
                $box->style('success');
                $column->append($box);
            });

            $row->column(1/3, function (Column $column) {
                $box  = new Box('Combo Bar Graph', view('admin.chartjs.combo-bar-line'));
                $box->style('success');
                $column->append($box);
            });

            $row->column(1/3, function (Column $column) {
                $box  = new Box('Marketplace Pie Chart', view('admin.chartjs.pie'));
                $box->style('success');
                $column->append($box);
            });

            $row->column(1/3, function (Column $column) {
                $box  = new Box('Radar Graph', view('admin.chartjs.radar'));
                $box->style('success');
                $column->append($box);
            });

            // $bar = view('admin::dashboard.dash');
            // $row->column(11/12, new Box('Quality Assurance Statistics\' Pie Chart', $bar));
        }); 
    }


    public function tab(Content $content)
    {
        $content->title('Your Dashboard')
        ->row(function (Row $row) {
            
            $row->column(4, function (Column $column) {
                // $column->append(HomeDashboardController2::indexx());
            });
        });

        $this->showFormParameters($content);

        $tab = new Widgets\Tab();

        $box1 = new Widgets\Box('', HomeController::myChart($content)); // overview tab // original
        // $box2 = new Widgets\Box('', HomeDashboardController2::indexx());  // the table
        
        
        $box3 = new Widgets\Box('', view('admin.chartjs.pie'), 'For latest data, kindly refresh the page!');
        $box4 = new Widgets\Box('', view('admin.chartjs.bar'), 'For latest data, kindly refresh the page!');
        $box5 = new Widgets\Box('', view('admin.chartjs.line'), 'For latest data, kindly refresh the page!');            

        $tab->add('Welcome tab', $box1);    // tab 1
        $tab->add('Overview Table', $box2);    // tab 2
        $tab->add('Quality Assurance', $box3);    // tab 3
        $tab->add('Seed Stock', $box4);    // tab 4
        $tab->add('Marketplace', $box5);    // tab 5
        
        $content->row($tab);
        
        return $content;
    }

    protected function showFormParameters($content)
    {
        $parameters = request()->except(['_pjax', '_token']);

        if (!empty($parameters)) {

            ob_start();

            dump($parameters);

            $contents = ob_get_contents();

            ob_end_clean();

            $content->row(new Widgets\Box('Form parameters', $contents));
        }
    }
}

