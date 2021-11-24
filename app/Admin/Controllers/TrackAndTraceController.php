<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CropVariety;
use App\Models\FormStockExaminationRequest;
use App\Models\SeedLab;
use App\Models\StockRecord;
use App\Models\TestTree;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Tab;

class TrackAndTraceController extends AdminController
{
    public function index(Content $content)
    {

        return Admin::content(function (Content $content) {
            $content->header('SeedLab');
            $content->body(SeedLab::tree());
        });


        return "romina";
        $tab = new Tab();
        $tab->add("Romina", "sumayya");
        $tab->add("Sumayya", "Romina");

        $content->body($tab);
        return $content;
    }

    protected function tree()
    {
        return SeedLab::tree(function (Tree $tree) {

            $tree->branch(function ($branch) {
                //return "romina";

                $ord = $branch['id'];
                $lab = SeedLab::find($ord);
                if (!$lab) {
                    return $ord;
                }
                return $lab->mother_lot."";

                return ($branch['mother_lot']);

                $src = url("storage/" . $branch['logo']);

                $logo = "<img src='$src' style='max-width:30px;max-height:30px' class='img'/>";

                return '<a href="/love">' . "{$branch['id']} - {$branch['title']} $logo" . '</a>';
            });
        });
    }
}
