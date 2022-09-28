<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\MarketableSeed;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
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



        if (Admin::user()->isRole('usta')) {
            $grid->disableCreateButton();
            $grid->disableExport();
            //$grid->model()->where('status', '=', 13);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if ($status == 0) {
                    $status = 1;
                }
                if (
                    $status != 13
                ) {
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('basic-user')) {

            $grid->model()->where('administrator_id', '=', Admin::user()->id);

            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if ($status == 0) {
                    $status = 1;
                }
                if (
                    $status != 1 &&
                    $status != 3
                ) {
                    //$actions->disableEdit();
                    $actions->disableDelete();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->disableCreateButton();
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if (
                    $status != 2
                ) {
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('lab-reception')) {
            $grid->disableCreateButton();
            $grid->model()->where('status', 9);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
            });
        } else if (Admin::user()->isRole('lab-technician')) {
            $grid->disableCreateButton();
            $grid->disableExport();
            $grid->model()->where('status', 10);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
            });
        }


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
        // $grid->column('seed_lab_id', __('Lab Test Number'))->display(function ($user) {

        //     return $this->seed_lab->lot_number;
        // })->sortable();

        $grid->column('crop_variety_id', __('Crop variety'))->display(function () {
            return $this->crop_variety->name;
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
     *=======USTA========
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {

        $show = new Show(SeedLabel::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

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

            $res = SeedLab::where([
                'administrator_id' => $user->id,
                'status' => 5
            ])->get();
            foreach ($res as $key => $sl) { 
                if ($sl->quantity < 1) {
                    continue;
                } 
                $seed_labs[$sl->id] = "Lab Test Number: " . $sl->lot_number . ", CROP: " . $sl->crop_variety->name . " - " . $sl->crop_variety->name . ", QTY: " . $sl->quantity . " KGs";
            }

  
            if (count($seed_labs) < 1) {
                admin_error("Warning", "You don't have any  valid LAB TEST NUMBER. Apply for seed lap to aquire a LAB TEST NUMBER.");
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
        } else {

            $id = request()->route()->parameters['seed_label'];
            $model = $form->model()->find($id);

            foreach (SeedLab::where([
                'administrator_id' => $model->administrator_id,
                'status' => 5
            ])->get() as $key => $sl) {
                if ($sl->quantity < 1) {
                    continue;
                }
                $seed_labs[$sl->id] = "Lab Test Number: " . $sl->lot_number . ", CROP: " . $sl->crop_variety->name.", QTY: " . $sl->quantity . " KGs";
            }
        }

        $form->setWidth(8, 4);
        if (Admin::user()->isRole('basic-user')) {
            
            $form->saving(function ($form) {
                $form->status = 1;
            });
            $form->select('seed_lab_id', __('Select lab test number'))
                ->options($seed_labs)
                ->required();
                //->load('seed_label_package_id', url('/api/seed_label_packages_by_seed_lab'))

            $_lables = SeedLabelPackage::all();
            $lables = [];
            foreach ($_lables as $key => $val) {
                $lables[$val->id] = "Package Size: {$val->package_size} Kgs @ : {$val->package_price} UGX";
            }
            $form->select('seed_label_package_id', __('Select Seed label package'))
            ->options($lables)
            ->required();
            $form->hidden('crop_variety_id')->default(1);
            $form->hidden('images')->default("[]");
            $form->hidden('status')->default(1)->attribute('value', '1');
            $form->text('quantity', __('Quantity'))->attribute('type', 'number')->required();
            $form->text('price', __('Enter your selling unit price (Price per KG)'))->attribute('type', 'number')->required();
            $form->image('image', __('Thumbnail Image'));
            //$form->multipleImage('images', __('Crop gallary'));
            $form->textarea('applicant_remarks', __('Remarks'));
            $form->file('receipt', __('Attach receipt'))->required();
        }

        if (Admin::user()->isRole('admin')) {


            $form->display('quantity', __('Quantity'))->attribute('type', 'number');
            $form->display('applicant_remarks', __('Remarks'));

            $form->radio('status', __('Inspection decision'))
                ->options([
                    '3' => 'Halt',
                    '13' => 'Accepted',
                ])
                ->required()
                ->when('in', [3], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                });
        }

        if (
            Admin::user()->isRole('usta')
        ) {
            $form->saving(function ($form) {
                $id = request()->route()->parameters['seed_label'];
                $model = $form->model()->find($id);
                if ($model->is_processed) {
                    dd("This form is already processed.");
                }
                if (!$model->seed_lab) {
                    dd("Seed lab not found");
                }
                if ($model->quantity > $model->seed_lab->quantity) {
                    admin_error("Warning", "There is insufitient amount of this variety in seedlab for this applicant.");
                    return redirect(admin_url('seed-labels'));
                }

                $new_rec = new MarketableSeed();
                $new_rec->administrator_id = $model->administrator_id;
                $new_rec->crop_variety_id = $model->crop_variety_id;
                $new_rec->seed_label_package_id = $model->seed_label_package_id;
                $new_rec->is_deposit = 1;
                $new_rec->lab_test_number = $model->seed_lab->lab_test_number;
                $new_rec->lot_number = $model->seed_lab->lot_number;
                $new_rec->quantity = $model->quantity;
                $new_rec->seed_label_id = $model->id;
                $new_rec->source = "From seedlab test number: " . $model->seed_lab->lab_test_number;
                $new_rec->detail = "From seedlab ID: " . $model->seed_lab->id;

                if ($new_rec->save()) {
                    $model->seed_lab->quantity = $model->seed_lab->quantity - $new_rec->quantity;
                    if ($model->seed_lab->save()) {
                        $model->is_processed = 1;
                        $model->status = 14;
                        if ($model->save()) {
                            admin_success("Success!", "Label priting was successfully processed.");
                            return redirect(admin_url('seed-labels'));
                        }
                    }
                }

                dd($new_rec);
                dd("Usta saving here....");
            });

            $form->radio('status', __('Set as printed'))
                ->options([
                    '14' => 'Prinited',
                ])
                ->required();
        }


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

        // $form->number('status', __('Status'))->default(1);
        // $form->textarea('status_comment', __('Status comment'));

        return $form;
    }
}