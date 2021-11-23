<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\AdminRoleUser;
use App\Models\FormQds;
use App\Models\FormSr4;
use App\Models\FormSr6;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Collapse;
use Encore\Admin\Widgets\InfoBox;
use Encore\Admin\Widgets\Tab;
use Encore\Admin\Widgets\Table;

class HomeController extends Controller
{
    public function index(Content $content)
    {

        $content->title('Info box');
        $content->description('Description...');

        $content->row(function ($row) {

            $tab = new Tab();

            $row->column(3, new InfoBox('All users.', 'users', 'green', admin_url('/auth/users'), Administrator::count()));
            $row->column(3, new InfoBox('Sr4s.', 'form', 'green', admin_url('/auth/users'), FormSr4::count()));
            $row->column(3, new InfoBox('Sr6s.', 'form', 'green', admin_url('/auth/users'), FormSr6::count()));
            $row->column(3, new InfoBox('QDs.', 'form', 'green', admin_url('/auth/users'), FormQds::count()));
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
