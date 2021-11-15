<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SeedLabelController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'SeedLabel';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SeedLabel());

        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->toFormattedDateString();
            })->sortable();
        $grid->column('administrator_id', __('Crated by'))->display(function ($user) {
            $_user = Administrator::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->name;
        })->sortable();
        $grid->column('seed_lab_id', __('Lab Test Number'))->display(function ($user) {
            return $this->seed_lab->lot_number;
        })->sortable();

        $grid->column('crop_variety_id', __('Crop variety'))->display(function ($user) {
            return $this->crop_variety->crop->name . " - " . $this->crop_variety->name;
        })->sortable();

        $grid->column('seed_label_package_id', __('Label package'))->display(function ($user) {
            $value =  $this->seed_label_package;
            return $value->package_size . " Kgs @ " . $value->package_price . " UGX";
        })->sortable();

        $grid->column('quantity', __('Quantity'))->display(function ($var) {
            return number_format($var);
        });

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
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
        $show = new Show(SeedLabel::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('seed_lab_id', __('Seed lab id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('seed_label_package_id', __('Seed label package id'));
        $show->field('quantity', __('Quantity'));
        $show->field('applicant_remarks', __('Applicant remarks'));
        $show->field('status', __('Status'));
        $show->field('status_comment', __('Status comment'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SeedLabel());
        $user = Admin::user();
        $seed_labs = [];
        if ($form->isCreating()) {
            if (!Admin::user()->isRole('basic-user')) {
                admin_error("Warning", "You don't have previleges to create this form.");
                return redirect(admin_url('seed-labels'));
            }
            $form->hidden('administrator_id', __('Administrator id'))
                ->default($user->id);

            foreach (SeedLab::where([
                'administrator_id' => $user->id,
                'status' => 5
            ])->get() as $key => $sl) {
                if ($sl->quantity < 1) {
                    continue;
                }
                $seed_labs[$sl->id] = "Lab Test Number: " . $sl->lot_number . ", CROP: " . $sl->crop_variety->crop->name . " - " . $sl->crop_variety->name . ", QTY: " . $sl->quantity . " KGs";
            }

            if (count($seed_labs) < 1) {
                admin_error("Warning", "You don't have any  valid LOT NUMBER, apply for seed lap to aquire a lot number.");
                return redirect(admin_url('seed-labels'));
            }
            $form->hidden('administrator_id')->default($user->id);
            $form->saving(function ($form) {
                $seed_lab = SeedLab::find($form->seed_lab_id);
                if (!$seed_lab) {
                    dd("seed_label not found");
                }
                if ($form->quantity > $seed_lab->quantity) {
                    admin_error("Warning", "You have insufitient amount of this variety than what you have requested for..");
                    return redirect(admin_url('seed-labels/create'));
                }
                $form->crop_variety_id = $seed_lab->crop_variety->id;
                $user = Admin::user();
                $form->administrator_id = $user->id;
                $form->status = 1;
            });
        }

        $form->setWidth(8, 4);
        if (Admin::user()->isRole('basic-user')) {
            $form->select('seed_lab_id', __('Select lab test number'))
                ->options($seed_labs)
                ->load('seed_label_package_id', url('/api/seed_label_packages_by_seed_lab'))
                ->required();

            $form->select('seed_label_package_id', __('Select Seed label package'))->required();
            $form->hidden('crop_variety_id')->default(1);
            $form->hidden('status')->default(1);
            $form->text('quantity', __('Quantity'))->attribute('type', 'number')->required();
            $form->textarea('applicant_remarks', __('Remarks'));
            $form->file('receipt', __('Attach receipt'))->required();
        }

        // $form->number('status', __('Status'))->default(1);
        // $form->textarea('status_comment', __('Status comment'));

        return $form;
    }
}
