<?php

namespace App\Admin\Controllers;

use App\Models\MarketableSeed;
use Encore\Admin\Controllers\AdminController;
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
    protected $title = 'MarketableSeed';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new MarketableSeed());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('crop_variety_id', __('Crop variety id'));
        $grid->column('seed_label_id', __('Seed label id'));
        $grid->column('lot_number', __('Lot number'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('seed_class', __('Seed class'));
        $grid->column('source', __('Source'));
        $grid->column('detail', __('Detail'));
        $grid->column('is_deposit', __('Is deposit'));
        $grid->column('seed_label_package_id', __('Seed label package id'));
        $grid->column('lab_test_number', __('Lab test number'));

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

        $form->number('administrator_id', __('Administrator id'))->default(1);
        $form->number('crop_variety_id', __('Crop variety id'))->default(1);
        $form->number('seed_label_id', __('Seed label id'))->default(1);
        $form->number('lot_number', __('Lot number'));
        $form->number('quantity', __('Quantity'));
        $form->number('seed_class', __('Seed class'));
        $form->textarea('source', __('Source'));
        $form->textarea('detail', __('Detail'));
        $form->switch('is_deposit', __('Is deposit'));
        $form->number('seed_label_package_id', __('Seed label package id'));
        $form->textarea('lab_test_number', __('Lab test number'));

        return $form;
    }
}
