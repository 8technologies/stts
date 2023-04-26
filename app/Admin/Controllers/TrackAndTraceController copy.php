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
use Encore\Admin\Tree;
use Encore\Admin\Widgets\Tab;
use Encore\Admin\Widgets\Table;


class TrackAndTraceController extends AdminController
{
    public function index(Content $content)
    {
        return Admin::content(function (Content $content) {
            $title = "No lot number set";
            $lot_number = "";
            $lot_is_set = false;

            if (isset($_GET['lot_number'])) {
                if (strlen(trim($_GET['lot_number'])) > 0) {
                    $lot_is_set = true;
                    $lot_number = trim($_GET['lot_number']);
                    $title = "LOT NUMBER: " . $lot_number;
                }
            }

            $lab_works = SeedLab::where('temp_parent', '>', 0)->get();

            foreach ($lab_works as $key => $lab_work) {
                $lab_work->parent_id = $lab_work->temp_parent;
                $lab_work->temp_parent = 0;
                $lab_work->save();
            }

            $content->header($title);
            $track = SeedLab::tree(
                function (Tree $tree) {

                    $lot_number = "";
                    $lot_is_set = false;
                    if (isset($_GET['lot_number'])) {
                        if (strlen(trim($_GET['lot_number'])) > 0) {
                            $lot_is_set = true;
                            $lot_number = trim($_GET['lot_number']);
                        }
                    }

                    if ($lot_is_set) {
                        $tree->query(function ($model) {
                            $pending = [];
                            $done = [];
                            $found = [];
                            $temp = [];

                            $lot_number = trim($_GET['lot_number']);
                            $lab = SeedLab::where([
                                'lot_number' => $lot_number,
                                'parent_id' => 0,
                            ])
                                ->first();

                            if ($lab == null) {

                                $lab_temp = SeedLab::where([
                                    'mother_lot' => $lot_number,
                                ])
                                    ->first();
                                if ($lab_temp != null) {
                                    $lab_temp->temp_parent = $lab_temp->parent_id;
                                    $lab_temp->parent_id = 0;
                                    $lab_temp->save();
                                }
                                $lab = $lab_temp;
                            }

                            if ($lab != null) {
                                $pending[] = $lab->id;
                                $found[] = $lab->id;
                                while (true) {


                                    foreach ($pending as $key => $id) {
                                        if (in_array($id, $done)) {
                                            continue;
                                        }
                                        $found[] = $id;

                                        $lab_2 = SeedLab::where('mother_lot', $id)
                                            ->orWhere('lot_number', $id)
                                            ->orWhere('parent_id', $id)
                                            ->get();

                                        if (!in_array($id, $done)) {
                                            $done[] = $id;
                                        }

                                        foreach ($lab_2 as $key => $lab_2_value) {

                                            if (!in_array($lab_2_value->id, $temp)) {
                                                $temp[] = $lab_2_value->id;
                                            }
                                        }
                                    }

                                    $is_done = true;
                                    foreach ($temp as $key => $temp_value) {
                                        $pending[] = $temp_value;
                                        if (!in_array($temp_value, $done)) {
                                            $is_done = false;
                                        }
                                    }
                                    if ($is_done) {
                                        break;
                                    }
                                }
                            }

                            return $model->whereIn('id', $found);
                        });
                    }


                    //$tree->disableCreate();
                    $tree->disableSave();

                    $tree->branch(function ($branch) {

                        $ord = $branch['id'];
                        $lab = SeedLab::find($ord);
                        if (!$lab) {
                            return $ord . " N/A";
                        }
                        // return "Id:(" . $lab->id . ') ' . "Mother Lot: " . ($lab->mother_lot?$lab->mother_lot:"?") . " => " . "Lot Number: " . ($lab->lot_number?$lab->lot_number:"?");
                        return "Mother Lot: " . ($lab->mother_lot?$lab->mother_lot:"?") . " => " . "Lot Number: " . ($lab->lot_number?$lab->lot_number:"?");

                        return ($branch['mother_lot']);

                        $src = url("storage/" . $branch['logo']);

                        $logo = "<img src='$src' style='max-width:30px;max-height:30px' class='img'/>";

                        return '<a href="/love">' . "{$branch['id']} - {$branch['title']} $logo" . '</a>';
                    });
                }
            );


            $tab = new Tab();
            $tab->add("Tracking", $track);
            $trace_table = "Nothing to trace.";

            if ($lot_is_set) {
                $traces = [];
                $temp_lot_number = $lot_number;

                $trace_lab = SeedLab::where([
                    // 'mother_lot' => $temp_lot_number,
                    'lot_number' => $temp_lot_number,
                ])
                    ->first();

                if ($trace_lab != null) {
                    $traces[] = $trace_lab;
                    $temp_lot_number = $trace_lab->parent_id;

                    while (true) {
                        $trace_lab = SeedLab::where([
                            'id' => $temp_lot_number,
                        ])
                            ->first();
                        if ($trace_lab == null) {
                            break;
                        }
                        $temp_lot_number = $trace_lab->parent_id;
                        $traces[] = $trace_lab;
                    }
                }

                $headers = [
                    'Id', 
                    'Mother lot', 
                    'Lot number', 
                    // 'Company Name', 
                    'Crop Variety', 
                    'Year', 
                    'Original Quantity'
                ];

                $rows = [];

                foreach ($traces as $key => $trace_value) {
                    $row['id'] = $trace_value->id;
                    $row['mother_lot'] = $trace_value->mother_lot;
                    $row['lot_number'] = $trace_value->lot_number;
                    // $row['company_name'] = $trace_value->company_initials;
                    $row['crop_variety'] = $trace_value->crop_variety->name;
                    
                    $year = Carbon::createFromFormat('Y-m-d', $trace_value->collection_date)->year;
                    $row['year'] = $year;
                    
                    $row['Original Quantity'] = $trace_value->quantity;
                    $rows[] = $row;
                }

                $trace_table = new Table($headers, $rows);
            }
            
            $tab->add("Tracing", $trace_table);

            $content->body($tab);
        });

        return $content;
    }


    protected function form()
    {
        $form = new Form(new SeedLab());

        $form->display('id', 'ID');

        $form->select('parent_id')->options(SeedLab::selectOptions());

        $form->text('mother_lot')->rules('required');

        // $form->image('logo');


        return $form;
    }
}
