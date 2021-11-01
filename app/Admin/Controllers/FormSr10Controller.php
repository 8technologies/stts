<?php

namespace App\Admin\Controllers;

use App\Models\FormSr10;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FormSr10Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FormSr10';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormSr10());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('planting_return_id', __('Planting return id'));
        $grid->column('stage', __('Stage'));
        $grid->column('status', __('Status'));
        $grid->column('status_comment', __('Status comment'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('submited_date', __('Submited date'));
        $grid->column('min_date', __('Min date'));
        $grid->column('max_date', __('Max date'));

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

        $form->number('planting_return_id', __('Planting return id'));
        $form->textarea('stage', __('Stage'));
        $form->textarea('status', __('Status'));
        $form->textarea('status_comment', __('Status comment'));
        $form->number('administrator_id', __('Administrator id'));
        $form->textarea('submited_date', __('Submited date'));
        $form->textarea('min_date', __('Min date'));
        $form->textarea('max_date', __('Max date'));

        return $form;
    }
}
