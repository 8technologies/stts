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


class HomeControllerJEd extends Controller
{
    public function index(Content $content)
    {
        return view('admin.dashboard.dashboard');
    }
}
