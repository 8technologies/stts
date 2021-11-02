<?php

namespace App\Admin\Controllers;

use App\Models\FormSr10;
use App\Models\FormSr10HasVarietyInspection;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FormSr10Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Sr10 - Feild inspection';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormSr10());

        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);

            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if (
                    $status == 1 ||
                    $status == 5 ||
                    $status == 6
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->disableCreateButton();
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                $actions->disableDelete();
                if (
                    $status == 1
                ) {
                    //$actions->disableEdit();
                }
            });
        } else {
            $grid->disableCreateButton();
        }

        $grid->column('id', __('Id'));
        $grid->column('stage', __('Stage'));
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();
        $grid->column('min_date', __('To be submited before'));
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
        $show = new Show(FormSr10::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('planting_return_id', __('Planting return id'));
        $show->field('stage', __('Stage'));
        $show->field('status', __('Status'));
        $show->field('status_comment', __('Status comment'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('submited_date', __('Submited date'));
        $show->field('min_date', __('Min date'));
        $show->field('max_date', __('Max date'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FormSr10());
        $can_edit = true;

        if ($form->isEditing()) {
            $form->saving(function (Form $form) {
                $id = request()->route()->parameters['form_sr10'];
                $sr10 = $form->model()->find($id);


                if (count($sr10->form_sr10_has_variety_inspections) < 1) {
                    if ($sr10->planting_return != null) {
                        if ($sr10->planting_return->planting_return_crops != null) {
                            foreach ($sr10->planting_return->planting_return_crops as $key => $val) {
                                $d['form_sr10_id']  = $id;
                                $d['planting_return_crop_id'] = $val->id;
                                $d['planting_return_crop_name'] = $val->crop_variety->name;
                                $VarietyInspection = new FormSr10HasVarietyInspection($d);
                                $VarietyInspection->save();
                            }
                            admin_success("Success", "SR10 initilized.");
                            header("Location: " . $_SERVER['REQUEST_URI'] . "/edit");
                            die();
                        }
                    }
                }
            });
        }

        if ($form->isEditing()) {
            if (!Admin::user()->isRole('inspector')) {
                admin_error("Warning", "Only inspectors are allowed to modify an SR10.");
                $can_edit = false;
            }
            $id = request()->route()->parameters['form_sr10'];
            $model = $form->model()->find($id);
            if ($model == null) {
                admin_error("Warning", "SR10  not found.");
                $can_edit = false;
            }

            $min_date = Carbon::parse($model->min_date);
            if (!$min_date->isToday()) {
                if (!$min_date->isPast()) {
                    admin_error(
                        "Attempting early submission",
                        "This SR10 is to be submited " .
                            $min_date->diffForHumans()
                            . " on "
                            . $min_date->toDateString()

                    );
                    $can_edit = false;
                }
            }
            if (!$model->is_active) {
                admin_error("Warning", "This form is not ative yet. You need to submit the previous stage before this.");
                $can_edit = false;
            }
            if ($model->is_done) {
                admin_error("Warning", "This form is already submited. You cannot modify it anymore.");
                $can_edit = false;
            }
        }

        if ($can_edit) {

            Admin::script("$('document').ready(function(){
                $('.remove').hide();
                $('.add').hide();
            });");

            $form->html('<h3>About seed-grower</h3>');
            $form->display('planting_return_id', __('Planting return id'))->readonly();
            $form->display('', __('Name'))->default($model->planting_return->name)->readonly();
            $form->display('', __('Address'))->default($model->planting_return->address)->readonly();
            $form->display('', __('Telephone'))->default($model->planting_return->telephone)->readonly();
            $form->display('', __('Seed rate'))->default($model->planting_return->seed_rate)->readonly();
            $form->divider();
            if ($model->is_initialized) {
                $form->html('<h3>About this Field inspection report - (SR10)</h3>');
                //          $form->number('numbernumber', __('Planting return id'));
                $form->text('stage', __('Stage'))->readonly();
                $form->date('min_date', __('To be submited after'))->readonly();
                $form->date('submited_date', __('Date Submited'))->value(Carbon::now()->toDateString())->default(Carbon::now()->toDateString())->readonly();



                $form->divider();
                $form->html('<h3>Crop varieties inspection</h3>');
                $form->hasMany('form_sr10_has_variety_inspections', __(''), function (NestedForm $form) {

                    $form->text('planting_return_crop_name', __('Crop/Variety'))->readonly();
                    $form->select('seed_class', __('seed_class'))
                        ->options([
                            'Pre-Basic seed' => 'Pre-Basic seed',
                            'Basic seed' => 'Basic seed',
                            'Certified seed' => 'Certified seed',
                        ])
                        ->required();
                    $form->text('size_of_field', __('Enter size of field (in Acres)'))->attribute('type', 'float')->required();
                    $form->text('off_types', __('Crop cultivar characteristics (Off-types)'));
                    $form->text('diseases', __('Crop cultivar characteristics (Diseases)'))->required();
                    $form->text('noxious_weeds', __('Crop cultivar characteristics (Noxious weeds)'))->required();
                    $form->text('other_features', __('Crop cultivar characteristics (Other features)'))->required();
                    $form->text('other_weeds', __('Crop cultivar characteristics (Other weeds)'))->required();
                    $form->text('isolation_distance', __('Enter isolation distance (in Meters)'))->attribute('type', 'float');

                    $form->select('proposed_distance', __('Status of proposed distance'))
                        ->options([
                            'Adequate' => 'Adequate',
                            'Inadequate' => 'Inadequate'
                        ]);


                    $form->textarea('general_conditions_of_crop', __('General conditions of crop'));
                    $form->text('estimated_yield', __('Enter estimated yield (in metric tonnes)'));
                    $form->textarea('futher_remarks', __('Enter any futher remarks'));
                    // $form->radio('status', __('The crop is?'))
                    //     ->options([
                    //         '4' => 'Rejected',
                    //         '7' => 'Provisional'
                    //     ]);
                });






                $form->radio('status', __('Status'))
                    ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be revarsed.")
                    ->options([
                        '4' => 'Rejected',
                        '5' => 'Accepted',
                    ])
                    ->required()
                    ->when('in', [3, 4], function (Form $form) {
                        $form->textarea('status_comment', 'Enter status comment (Remarks)')
                            ->help("Please specify with a comment");
                    });
            } else {
                $form->html('<h3>Initialize inspection</h3>');
                $form->html('<p class="alert alert-info">This inspection form (SR10) has not been inizilized yet. 
                Select initialize below and submit to start inspection process.</p>');

                $form->radio('is_initialized', __('Status'))
                    ->options([
                        '1' => 'Initialize inspection'
                    ])->required();
            }

            $form->tools(function (Form\Tools $tools) {
                $tools->disableList();
                $tools->disableDelete();
            });
            $form->footer(function ($footer) {
                $footer->disableReset();
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });
        } else {
            $form->tools(function (Form\Tools $tools) {
                $tools->disableList();
                $tools->disableDelete();
                $tools->disableView();
            });
            $form->footer(function ($footer) {
                $footer->disableReset();
                $footer->disableSubmit();
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });
        }

        return $form;
    }
}
