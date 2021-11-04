<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\FormCropDeclaration;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class FormCropDeclarationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FormCropDeclaration';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormCropDeclaration());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('planting_return_id', __('Planting return id'));
        $grid->column('crop_id', __('Crop id'));
        $grid->column('source_of_seed', __('Source of seed'));
        $grid->column('field_size', __('Field size'));
        $grid->column('seed_rate', __('Seed rate'));
        $grid->column('amount', __('Amount'));
        $grid->column('payment_receipt', __('Payment receipt'));

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
        $show = new Show(FormCropDeclaration::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('planting_return_id', __('Planting return id'));
        $show->field('crop_id', __('Crop id'));
        $show->field('source_of_seed', __('Source of seed'));
        $show->field('field_size', __('Field size'));
        $show->field('seed_rate', __('Seed rate'));
        $show->field('amount', __('Amount'));
        $show->field('payment_receipt', __('Payment receipt'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FormCropDeclaration());
        //$planting_returns = [];
        $has_valid_sr8 = false;

        if (Admin::user()->isRole('basic-user')) {
            if (Admin::user()->qds != null) {
                foreach (Admin::user()->qds as $key => $data) {
                    if ($data->status == 5) {
                        $has_valid_sr8 = true;
                        //$planting_returns[$data->id] = $data->crop->name . ", SR8 ID: " . $data->id;
                    }
                }
            }
        }




        if ($form->isCreating()) {
            if (!$has_valid_sr8) {
                admin_error("Alert", "You need to be a registred and approved seed QDS producer to submit a 
                QDS crop declaration form.");
                return redirect(admin_url('planting-returns'));
            }
        }

        $form->setWidth(8, 4);


        // Adminn
        // planting_returns

        $user = Auth::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
            $form->hidden('status', __('status'))->value(1);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }

        // $form->select('planting_return_id', __('Select valid Planting Return - SR8'))
        //     ->options($planting_returns)
        //     ->required();
        $form->select('crop_id', __('Crop'))->options(Crop::all()->pluck('name', 'id'))->required();
        $form->text('source_of_seed', __('Source of seed'))->required();
        $form->text('field_size', __('Field size'))->attribute('type','number')->required();
        $form->text('seed_rate', __('Seed rate'))->required();
        $form->text('amount', __('Amount'))->attribute('type','number')->required();
        $form->file('payment_receipt', __('Payment receipt'));

        return $form;
    }
}
