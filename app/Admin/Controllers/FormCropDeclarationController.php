<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\FormCropDeclaration;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
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
    protected $title = 'Crop Declaration Form';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormCropDeclaration());

        $grid->column('id', __('Id'))->sortable();
        
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();

        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if (
                    $status == 5 ||
                    $status == 6
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->disableCreateButton();
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                $actions->disableDelete();
                if (
                    $status != 2
                ) {
                    $actions->disableEdit();
                }
            });
        } else {
            $grid->disableCreateButton();
        }

        $grid->column('administrator_id', __('Created by'))->display(function ($userId) {
            $u = Administrator::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        })->sortable();


        $grid->column('field_size', __('Field size'));
        $grid->column('seed_rate', __('Seed rate'));
        $grid->column('amount', __('Amount'));

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        $grid->column('inspector', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
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
        $show = new Show(FormCropDeclaration::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('planting_return_id', __('Planting return id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('source_of_seed', __('Source of seed'));
        $show->field('field_size', __('Field size'));
        $show->field('seed_rate', __('Seed rate'));
        $show->field('amount', __('Amount'));
        $show->field('payment_receipt', __('Payment receipt'))->file();
        $show->field('status', __('Status'));
        $show->field('inspector', __('Inspector'));
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
        $form = new Form(new FormCropDeclaration());
        $user = Admin::user(); 
        $can_create = false;
        $qds_id = false;
        
        if ($user->qds == null) {
            $can_create = false;
        }

        dd($user->qds);
        
        if(isset($user->qds)){
            foreach ($user->qds as $key => $value) {
                if ($value->status == 5) {
                    $min_date = Carbon::parse($value->valid_until);
                    if (!$min_date->isToday()) {
                        if (!$min_date->isPast()) {
                            $can_create = true;
                            $qds_id = $value->id;
                        }
                    } else {
                        $qds_id = $value->id;
                        $can_create = true;
                    }
                }
            }
        }
        

        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
            // $form->select('administrator_id', __('Applicant'))
            //     ->options(Administrator::all()->pluck('name', 'id'))->disabled();
        }

        $form->setWidth(8, 4);
        if (Admin::user()->isRole('basic-user')) {
            $form->saving(function ($form) {
                $form->status = 1;
            });
            $form->hidden('form_qd_id', __('form_qd_id'))->value($qds_id)->default($qds_id);
            $form->text('source_of_seed', __('Enter source of seed'))->required();
            $form->text('field_size', __('Enter field size (in Acres)'))->required();
            $form->text('seed_rate', __('Enter Seed rate'))->required();


            $form->hasMany('form_crop_declarations_has_crop_varieties', __('Click on "NEW" to add Crop varieties'), function (NestedForm $form) {
                $varieties = [];
                foreach (CropVariety::all() as $key => $value) {
                    $varieties[$value->id] =  $value->name . " of " . $value->crop->name;
                }
                $form->select('crop_variety_id', __('Crop variety id'))->options($varieties);
            });
            $form->divider();
            $form->text('amount', __('Enter the amount enclosed'))->attribute('type', 'number')->required();
            $form->file('payment_receipt', __('Upload Payment receipt'))->required();

            $form->footer(function ($footer) {
                $footer->disableViewCheck();
                $footer->disableReset();
                $footer->disableCreatingCheck();
            });
            $form->hidden('status', __('Status'))->value(1)->attribute('value', 1);
        }

        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        if (Admin::user()->isRole('admin')) {

            $form->display('id', __('Crop Declaration Form ID:'))->required();
            $form->display('field_size', __('Field (in Acres)'))->required();
            $form->display('seed_rate', __('Seed rate'))->required();

            $form->divider();
            $form->radio('status', __('Status'))
                ->options([
                    '1' => 'Pending',
                    '2' => 'Under inspection',
                ])
                ->required()
                ->when('2', function (Form $form) {
                    $items = Administrator::all();
                    $_items = [];
                    foreach ($items as $key => $item) {
                        if (!Utils::has_role($item, "inspector")) {
                            continue;
                        }
                        $_items[$item->id] = $item->name . " - " . $item->id;
                    }
                    $form->select('inspector', __('Inspector'))
                        ->options($_items)
                        ->help('Please select inspector')
                        ->rules('required');
                })
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('in', [5, 6], function (Form $form) {
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });
        }



        if (Admin::user()->isRole('inspector')) {
            $form->display('id', __('Crop Declaration Form ID:'))->disable();
            $form->display('field_size', __('Field (in Acres)'))->disable();
            $form->display('seed_rate', __('Seed rate'))->disable();

            $form->radio('status', __('Status'))
                ->options([
                    '3' => 'Halted',
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()
                ->when('2', function (Form $form) {
                    $items = Administrator::all();
                    $_items = [];
                    foreach ($items as $key => $item) {
                        if (!Utils::has_role($item, "inspector")) {
                            continue;
                        } 
                        $_items[$item->id] = $item->name . " - " . $item->id;
                    }
                })
                ->when('in', [5], function (Form $form) {
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                })
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                });
        }



        // $form->number('inspector', __('Inspector'));
        // $form->textarea('status_comment', __('Status comment'));

        return $form;
    }
}
