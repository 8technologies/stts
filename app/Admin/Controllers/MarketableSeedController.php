<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\MarketableSeed;
use Carbon\Carbon;
use Dotenv\Validator;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MarketableSeedController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Marketable Seed';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        $grid = new Grid(new MarketableSeed());
        $grid->disableBatchActions();
        //anjane//

        $grid->disableFilter();
        $grid->disableCreateButton();
        $grid->disableColumnSelector();
        // $grid->disableExport();

        $grid->filter(function ($filter) {

            if (Admin::user()->isRole('admin')) {
                $filter->equal('administrator_id', "Filter by user")->select(Administrator::all()->pluck('name', 'id'));
            }
            $filter->equal('crop_variety_id', "Filter by crop variety")->select(CropVariety::all()->pluck('name', 'id'));
            $filter->equal('is_deposit', "Filter by stock record type")->select([
                '1' => "Stock in",
                '0' => "Stock out",
            ]);
        });


        if (!Admin::user()->isRole('admin')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
        }
        if (!Admin::user()->isRole('basic-user')) {
            $grid->disableCreateButton();
        }

        $grid->actions(function ($actions) {
            $actions->disableEdit();
            $actions->disableDelete();
        });

        $grid->column('created_at', __('Created'))
        ->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();


        $grid->column('administrator_id', __('Belongs to'))->display(function ($user) {
            $_user = Administrator::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->name;
        })->sortable();

        $grid->column('crop_variety_id', __('Crop variety'))
            ->display(function ($item) {
                $var = CropVariety::find($item);
                if(!$var){
                    return "-";
                }
                return $var->crop->name . ", " . $var->name;
            })->sortable();

        $grid->column('lab_test_number', __('Lab test no.'))->sortable();
        $grid->column('lot_number', __('Lot number'))->sortable();
        //$grid->column('source', __('Source'));

        $grid->column('is_deposit', __('Type'))
            ->display(function ($item) {
                if ($item) {
                    return '<span class="badge" style="background-color: green;">Stock in</span>';
                } else {
                    return '<span class="badge"  style="background-color: red;">Stock out</span>';
                }
            })->sortable();

        $grid->column('seed_label_package_id', __('Package'))
            ->display(function ($item) {
                $value =  $this->seed_label_package;
                if (!$value) {
                    return "-";
                }
                return $value->package_size . " Kgs @ " . $value->package_price . " UGX";
            })->sortable();

        $grid->column('quantity', __('Quantity'))->display(function ($item) {
            return number_format($item);
        })->sortable();
           

        return $grid;
    }


    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(MarketableSeed::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('seed_label_id', __('Seed label id'));
        $show->field('lot_number', __('Lot number'));
        $show->field('quantity', __('Quantity'));
        $show->field('seed_class', __('Seed class'));
        $show->field('source', __('Source'));
        $show->field('detail', __('Detail'));
        $show->field('is_deposit', __('Is deposit'));
        $show->field('seed_label_package_id', __('Seed label package id'));
        $show->field('lab_test_number', __('Lab test number'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new MarketableSeed());
        $user = Admin::user();

        if ($form->isCreating()) {
            if (!$user->isRole('basic-user')) {
                admin_error("Warning", "You need to be a basic user to create a custom marketable seed record.");
                return redirect(admin_url('marketable-seeds'));
            } else {
                if ($form->saving(function ($form) {

                    $models = MarketableSeed::where('lab_test_number', $form->lab_test_number)->get();
                    if (count($models) < 1) {
                        admin_error("Warning", "Marketable seed with provided lab test number not found");
                        return redirect(admin_url('marketable-seeds/create'))
                            ->withInput();
                    }
                    $tot_qty_in_stock = 0;
                    foreach ($models as $key => $val) {
                        $tot_qty_in_stock += $val->quantity;
                    }
                    $quantity = (int)($form->quantity);

                    if ($quantity < 1) {
                        admin_error("Warning", "You have insufitient Marketable seed in stock.");
                        return redirect(admin_url('marketable-seeds/create'))
                            ->withInput();
                    }

                    if ($tot_qty_in_stock < $quantity) {
                        admin_error("Warning", "You have insufitient Marketable seed in stock.");
                        return redirect(admin_url('marketable-seeds/create'))
                            ->withInput();
                    }
                    $model = $models[0];

                    $stock_out = new MarketableSeed();
                    $stock_out->administrator_id = $model->administrator_id;
                    $stock_out->crop_variety_id = $model->crop_variety_id;
                    $stock_out->seed_label_id = $model->seed_label_id;
                    $stock_out->lot_number = $model->lot_number;
                    $stock_out->quantity = (-1) * ($quantity);
                    $stock_out->seed_class = $model->seed_class;
                    $stock_out->source = $model->source;
                    $stock_out->detail = $form->detail;
                    $stock_out->is_deposit = 0;
                    $stock_out->seed_label_package_id = $model->seed_label_package_id;
                    $stock_out->lab_test_number = $form->lab_test_number;

                    if ($stock_out->save()) {
                        admin_success("Success", "Market record created successfully.");
                        return redirect(admin_url('marketable-seeds'))
                            ->withInput();
                    }
                    else {
                        admin_error("Warning", "Market record was not created successfully.");
                        return redirect(admin_url('marketable-seeds/create'))
                            ->withInput();
                    }
                }));
            }
        }


        $vars = [];
        $stock = [];
        $stock_ids = [];
        $marketable_seeds = MarketableSeed::WHERE([
            'administrator_id' => $user->id
        ])->get();
        
        foreach ($marketable_seeds as $key => $value) { 
            $stock[$value->lab_test_number][] = $value;
            if (!isset($stock_ids[$value->lab_test_number])) {
                $stock_ids[$value->lab_test_number]['quantity'] = 0;
                $stock_ids[$value->lab_test_number]['variety'] = $value;
                $stock_ids[$value->lab_test_number]['lab_test_number'] = $value->lab_test_number;
            }
            $stock_ids[$value->lab_test_number]['quantity'] += $value->quantity;
        }


        foreach ($stock_ids as $key => $val) {
            $value = $val['variety'];
            if ($value->quantity > 0) {
                $vars[$value['lab_test_number']] = "SEED: " . $value->crop_variety->name. ", LAB No.: " . $value->lab_test_number . ", QTY: " . $val['quantity'] . " KGs";
            }
        }


        $form->select('lab_test_number', __('Select crop variety'))
            ->options($vars)
            ->required();
        $form->text('quantity', __('Stock Out - Quantity'))->attribute('type', 'number')->required();

        $form->textarea('detail', __('Detail'))->required();

        $form->tools(function (Form\Tools $tools) {

            $tools->disableDelete();
            $tools->disableView();
        });

        $form->footer(function ($footer) {
            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });


        /*$form->number('administrator_id', __('Administrator id'))->default(1);
        $form->number('crop_variety_id', __('Crop variety id'))->default(1);
        $form->number('lot_number', __('Lot number'));
        $form->number('seed_label_id', __('Seed label id'))->default(1);
        $form->number('seed_class', __('Seed class'));
        $form->textarea('source', __('Source'));
        $form->textarea('', __('Detail'));
        $form->switch('is_deposit', __('Is deposit'));
        $form->number('seed_label_package_id', __('Seed label package id'));
        $form->textarea('lab_test_number', __('Lab test number'));*/


        return $form;
    }
}
