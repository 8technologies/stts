<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\FormSr10;
use App\Models\PlantingReturn;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Hamcrest\Util;
use Illuminate\Support\Facades\Auth;

class PlantingReturnController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Planting Return';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PlantingReturn());
        $grid->disableExport();
        $grid->disableFilter();
        $grid->disableRowSelector();


        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {

                $status = ((int)(($actions->row['status'])));
                if (
                    $status != 1
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
        } else {
        }


        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $grid->column('name', __('Name'));
        $grid->column('address', __('Address'));
        $grid->column('seed_rate', __('Seed rate'));
        $grid->column('registerd_dealer', __('Registerd dealer'));

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * 
     * 
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(PlantingReturn::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created'))
            ->as(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Created by'))
            ->as(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('telephone', __('Telephone'));
        $show->field('seed_rate', __('Seed rate'));
        $show->field('registerd_dealer', __('Registerd dealer'));
        // $show->field('longitude', __('Longitude'));
        // $show->field('latitude', __('Latitude'));

        $show->field('Location of the land')->latlong('latitude', 'longitude', $height = 400, $zoom = 16);



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {

        // $now Carbon::parse($item)->diffForHumans();

        $form = new Form(new PlantingReturn());
        $sr4 = Utils::has_valid_sr6();
        if ($form->isCreating()) {
            if (!$sr4) {
                admin_error("Alert", "You need to be a registred and approved seed grower to apply for field inspection.");
                return redirect(admin_url('planting-returns'));
            }
        }


        $form->saving(function (Form $form) {
            $is_active_made = false;
            if (Admin::user()->isRole('admin')) {
                $id = request()->route()->parameters['planting_return'];
                $model = $form->model()->find($id);
                if ($model != null) {
                    if (count($model->form_sr10s) == 0) {
                        if ($model->crop != null) {
                            if ($model->crop->crop_inspection_types != null) {
                                if (count($model->crop->crop_inspection_types) > 0) {
                                    foreach ($model->crop->crop_inspection_types as $key => $inspe) {
                                        $d['stage'] = $inspe->inspection_stage;
                                        $d['status'] = '1';
                                        if (!$is_active_made) {
                                            $d['is_active'] = 1;
                                            $is_active_made = true;
                                        } else {
                                            $d['is_active'] = 0;
                                        }
                                        $d['is_done'] = 0;
                                        $d['status_comment'] = ""; 
                                        $d['planting_return_id'] = $model->id;
                                        $d['administrator_id'] = $_POST['inspector'];
                                        $date_planted = Carbon::parse($model->date_planted);
                                        $date_planted->addDays($inspe->period_after_planting);
                                        $toDateString = $date_planted->toDateString();
                                        $d['min_date'] = $toDateString;
                                        $new_form_sr = new FormSr10($d);
                                        $new_form_sr->save();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });


        $user = Auth::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
            $form->hidden('status', __('status'))->value(1);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }
        $form->setWidth(8, 4);

        if (Admin::user()->isRole('basic-user')) {

            $form->text('name', __('Name'))->default($user->name)->required();
            $form->text('address', __('Address'))->required();
            $form->text('telephone', __('Telephone'))->required();
            $form->select('crop_id', 'Crop')->options(Crop::all()->pluck('name', 'id'))
                ->required();
            $form->text('lot_number', __('Lot number of seed used'))->required();
            $form->text('size_of_land', __('Land size (in Acres)'))->attribute('type', 'number')->required();
            $form->date('date_planted', __('Date planted'))->required();
            $form->date('date_harvest', __('Appoximate date of harvest'))->required();
            $form->text('previous_crops', 'Previous cropping for 3 seasons')
                ->required();


            $form->hasMany('planting_return_crops', __('Click on "New" crop varieties'), function (NestedForm $form) {
                $_items = [];
                foreach (CropVariety::all() as $key => $item) {
                    $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
                }
                $form->select('crop_variety_id', 'Add Crop Variety')->options($_items)
                    ->required();
            });
            $form->divider();

            $form->text('seed_rate', __('Seed rate per hectare (in KGs)'))->attribute('type', 'float')->required();
            $form->text('amount_enclosed', __('Amount enclosed for application'))->attribute('type', 'number')->required();
            $form->file('payment_receipt', __('Payment receipt'))->required();
            $form->text('registerd_dealer', __('Registerd seed merchant/dealer to whome the entire seed stock will be sold'));
            $form->latlong('latitude', 'longitude', 'Location of the land')->default(['lat' => 0.3130291, 'lng' => 32.5290854])->required();
        }


        if (Admin::user()->isRole('admin')) {


            $initialized = false;
            if ($form->isEditing()) {
                $id = request()->route()->parameters['planting_return'];
                $model = $form->model()->find($id);
                if ($model != null) {
                    if ($model->planting_return_crops != null) {
                        if (count($model->planting_return_crops) > 0) {
                            $initialized = true;
                            if ($model->status != null || $model->status != 1) {
                            }
                        }
                    }
                }
            }

            $form->display('name', __('Name'))->readonly();
            $form->display('address', __('Address'))->readonly();
            $form->select('crop_id', 'Crop')->options(Crop::all()->pluck('name', 'id'))
                ->readonly();



            if ($initialized) {
                $form->hasMany('form_sr10s', __("SR 10 - Inspections schedules"), function (NestedForm $form) {
                    $form->select('administrator_id', 'Inspector')->options(Administrator::all()->pluck('name', 'id'));
                    $form->text('stage', __('State name'))->readonly();
                    $form->text('status', __('Status name'))->readonly();
                    $form->text('status_comment', __('Status comment'))->readonly();
                    $form->date('min_date', __('Min date'));
                });
            } else {

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
        }



        return $form;
    }
}
