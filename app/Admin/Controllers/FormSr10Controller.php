<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropInspectionType;
use App\Models\CropVariety;
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
    protected $title = 'Sr10 - Field inspection'; 

    /**
     * @return Grid
     */
    
    protected function grid()
    {

        // $sr = FormSr10::find(8);
        // $sr->seed_class = rand(10000,100000000);
        // $sr->save();
        // if(FormSr10::is_final_sr10($sr)){
        //     dd("yes");
        // }else{
        //     dd("no");
        // }
        // dd($sr->stage);
        // $sr->save();
        // dd("here");

        $grid = new Grid(new FormSr10());
        $grid->disableFilter();
        // $grid->disableRowSelector();

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
            
            $grid->disableCreateButton();
        } 
        // else if (Admin::user()->isRole('inspector')) {
        //     $grid->model()->where('administrator_id', '=', Admin::user()->id);
        //     $grid->disableCreateButton();
        //     $grid->disableBatchActions();

        //     $grid->actions(function ($actions) {
        //         if ($actions->row['is_active'] == 0) {
        //             $actions->disableEdit();
        //         }

        //         $status = ((int)(($actions->row['status'])));
        //         $actions->disableDelete();
        //         if (
        //             $status == 1
        //         ) {
        //             //$actions->disableEdit();
        //         }
        //     });

        // } 

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();

        $grid->column('stage', __('Stage'));
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        if (Admin::user()->isRole('inspector')) {
            $grid->column('is_active', __('Attension'))->display(function ($is_active) {
                if ($is_active) {
                    return '<span class="badge badge-danger">Needs your attension</span>';
                } else {
                    return '-';
                }
            })->sortable();
        }
        
        else if(Admin::user()->isRole('basic-user') || Admin::user()->isRole('admin') || !$grid->model()->where('status', '=', 5)){

            $grid->actions(function ($actions) {
                
                    $actions->disableEdit();
                    $actions->disableDelete();
                    
            });
        }

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

        $model = FormSr10::findOrFail($id);

        $show->field('id', __('Id')); 
        $show->field('stage', __('Stage')); 
        $show->field('submited_date', __('Submited date'));

        $show->field('name', __('Applicant\'s Name'))->as(function ($i) {
            return $this->planting_return->name;
        });

        $show->field('address', __('Applicant\'s Address'))->as(function ($i) {

            return $this->planting_return->district . ", " .
            $this->planting_return->subcourty . ", " . $this->planting_return->village;
        });
        
        $show->field('gps', __('GPS'))->as(function ($i) {
            return $this->planting_return->gps_latitude . ", " .
            $this->planting_return->gps_longitude; 
        });
 
        $show->field('seed_class', __('Seed class')); 
        $show->field('size_of_field', __('Size of field')); 
        $show->field('off_types', __('Off types')); 
        $show->field('status_comment', __('Status comment')); 
        $show->field('diseases', __('Diseases')); 
        $show->field('noxious_weeds', __('Noxious weeds')); 
        $show->field('other_features', __('Other features')); 
        $show->field('other_weeds', __('Other weeds')); 
        $show->field('isolation_distance', __('Isolation distance')); 
        $show->field('variety', __('Variety')); 
        $show->field('proposed_distance', __('Proposed distance')); 
        $show->field('general_conditions_of_crop', __('General conditions of crop')); 
        $show->field('estimated_yield', __('Estimated yield')); 
        $show->field('futher_remarks', __('Futher remarks')); 
        $show->field('sr10_number', __('SR10s number')); 
      
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });

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
            /*$form->saving(function (Form $form) {
                $id = request()->route()->parameters['form_sr10'];
                $sr10 = $form->model()->find($id);
                if (isset($_POST['is_initialized'])) {
                    if (count($sr10->form_sr10_has_variety_inspections) < 1) {
                        //count($sr10->form_sr10_has_variety_inspections) < 1
                        if ($sr10->planting_return != null) {
                            if ($sr10->planting_return->planting_return_crops != null) {
                                foreach ($sr10->planting_return->planting_return_crops as $key => $val) {
                                    $d['form_sr10_id']  = $id;
                                    $d['planting_return_crop_id'] = $val->id;
                                    $d['planting_return_crop_name'] = $val->crop_variety->name;
                                    $VarietyInspection = new FormSr10HasVarietyInspection($d);
                                    $VarietyInspection->save();
                                }
                            }
                        }
                    }

                    $sr10->is_initialized = 1;
                    $sr10->is_active = 1;
                    $sr10->save();
                    admin_success("Success", "SR10 initilized.");
                    header("Location: " . $_SERVER['REQUEST_URI'] . "/edit");
                    die();
                } else {

                    $model = $sr10;

                    if (isset($_POST['status'])) {
                        if ($_POST['status'] == "4") {
                            $model->planting_return->status = 4;
                            $model->planting_return->status_comment = $_POST['status_comment'];
                            $model->planting_return->save();

                            foreach ($model->planting_return->form_sr10s as $key => $val) {
                                if ($val->id >= $model->id) {
                                    $val->status = 4;
                                    $val->status_comment = $_POST['status_comment'];
                                    $val->save();
                                }
                            }
                        }
                    }

                    $max_stage = 0;
                    $this_stage = 0;
                    $all_ids = [];
                    if ($model->planting_return != null) {
                        if ($model->planting_return->form_sr10s != null) {
                            foreach ($model->planting_return->form_sr10s as $key => $val) {
                                $all_ids[] = $val->id;
                                if ($val->stage == $model->stage) {
                                    $max_stage = $val->id;
                                    $this_stage = $val->id;
                                }
                            }
                            foreach ($model->planting_return->form_sr10s as $key => $val) {
                                if ($max_stage < $val->id) {
                                    $max_stage = $val->id;
                                    $is_final = false;
                                }
                            }
                        }
                    }
                    $next_id = 0;
                    if ($is_final) {
                        $model->planting_return->status = 5;
                        $model->planting_return->save();
                    } else {
                        asort($all_ids);
                        $this_stage_found = false;
                        foreach ($all_ids as $key => $value) {
                            if ($this_stage_found) {
                                $next_id = $value;
                                break;
                            }
                            if ($this_stage == $value) {
                                $this_stage_found = true;
                            }
                        }

                        if (isset($_POST['status'])) {
                            if ($_POST['status'] == "7") {
                                foreach ($model->planting_return->form_sr10s as $key => $val) {
                                    if ($val->id == $next_id) {
                                        $val->is_active = 1;
                                        $val->save();
                                    }
                                }
                            }
                        }

                        // echo "CURRENT STAGE: " . $this_stage . " NEXT STAGE: " . $next_id . "<br>";
                        // dd($all_ids);
                        // die("Is not final");
                    }

                    $form->is_done = 1;
                    $form->is_active = 0;
                }
            });*/
        }

        if ($form->isEditing()) {
            if (!Admin::user()->isRole('inspector')) {
                admin_warning("Warning", "Only inspectors can edit an SR10 Form");
                $can_edit = false;
                // return redirect(admin_url('form-sr10s'));
            }

            $id = request()->route()->parameters['form_sr10'];
            $model = $form->model()->find($id);

            if (!$model->is_active) {
                admin_error("Warning", "This form is not ative yet. You need to submit the previous stage before this.");
                $can_edit = false;
            }
        }

        if ($can_edit) {

            Admin::script("$('document').ready(function(){
                $('.remove').hide();
                $('.add').hide();
            });");

            $form->html('<h3>About seed-grower</h3>');
            //$form->display('planting_return_id', __('Planting return id'))->readonly();
            $form->hidden('is_done', __('is_done'))->value(1);
            $form->hidden('is_active', __('is_done'))->value(0);



            $form->display('', __('Name'))->default($model->planting_return->name)->readonly();
            $form->display('', __('Address'))->default(
                $model->planting_return->district . ", " .
                    $model->planting_return->subcourty . ", " . $model->planting_return->village

            )->readonly();
            $form->display('', __('GPS'))->default($model->planting_return->gps_latitude . ", " . $model->planting_return->gps_longitude)->readonly();
            $form->display('', __('Telephone'))->default($model->planting_return->phone_number)->readonly();
            $form->divider();

            $is_final = FormSr10::is_final_sr10($model);

            $form->html('<h3>About this Field inspection report - (SR10)</h3>');
            $form->display('', __('Seed class'))->default($model->planting_return->seed_class)->readonly();
            $crop_var = CropVariety::find($model->planting_return->crop);
            $default_var =  CropVariety::find(1);
            if($default_var == null){
                $default_var = new CropVariety();
                $default_var->id = 1;
                $default_var->crop_id = 1;
                $default_var->name = "Default crop vareity";
                $default_var->save();
                $model->planting_return->crop = 1;
                $model->planting_return->save();
                $crop_var = CropVariety::find($model->planting_return->crop);
            }
            if($crop_var == null){
                die("Crop varity was not found in the system.");
            }
 
            
            $crop_name = $crop_var->crop->name.", ".$crop_var->name;

            $form->display('', __('Crop'))->default($crop_name)->readonly();
            $form->text('stage', __('Stage'))->readonly();
            $form->date('min_date', __('To be submited after'))->readonly();
            $form->date('submited_date', __('Date Submited'))->value(Carbon::now()->toDateString())->default(Carbon::now()->toDateString())->readonly();

            $form->divider();
            $form->html('<h3>Crop inspection</h3>');
            $form->select('seed_class', __('seed_class'))
                ->options([
                    'Pre-Basic seed' => 'Pre-Basic seed',
                    'Basic seed' => 'Basic seed',
                    'Certified seed' => 'Certified seed',
                ]);
            $form->text('size_of_field', __('Enter size of field (in Acres)'))->attribute('type', 'number');
            $form->text('off_types', __('Crop cultivar characteristics (Off-types)'));
            $form->text('diseases', __('Crop cultivar characteristics (Diseases)'));
            $form->text('noxious_weeds', __('Crop cultivar characteristics (Noxious weeds)'));
            $form->text('other_features', __('Crop cultivar characteristics (Other features)'));
            $form->text('other_weeds', __('Crop cultivar characteristics (Other weeds)'));


            $form->radio('isolation_distance', __('Enter isolation')) 
            ->options([
                'in time' => 'Time',
                'in distance' => 'Distance',
            ]) 
            ->when('in', ['in time'], function (Form $form) {
                $form->text('isolation_distance', __('Enter isolation (in Hours)'))->attribute('type', 'number');
            })
            ->when('in', ['in distance'], function (Form $form) {
                $form->text('isolation_distance', __('Enter isolation (in Meters)'))->attribute('type', 'number');
            });




            $varieties_all = CropVariety::all();
            $varieties = [];
            foreach ($varieties_all as $key => $var) {
                if ($var->crop_id == $crop_var->id) {
                    $varieties[$var->id] = $var->crop->name . ", " . $var->name;
                }
            }
            $form->select('variety', __('Select Crop variety'))
                ->options($varieties);
 


            $form->select('proposed_distance', __('Status of proposed distance'))
                ->options([
                    'Adequate' => 'Adequate',
                    'Inadequate' => 'Inadequate'
                ]); 

                
            $form->textarea('general_conditions_of_crop', __('General conditions of crop'));
            $form->text('estimated_yield', __('Enter estimated yield (in metric tonnes)'));
            $form->textarea('futher_remarks', __('Enter any futher remarks'));
            // $form->radio('variety_status', __('The crop is?'))

            //     ->options([
            //         '4' => 'Rejected',
            //         '5' => 'Accepted'
            //     ]);

            $form->divider();




            if ($is_final) {
                $form->radio('status', __('Inspection decision'))
                    ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be revarsed.")
                    ->options([
                        '4' => 'Rejected',
                        '5' => 'Accepted',
                    ])
                    ->required();

                    // ->when('in', [3, 4], function (Form $form) {
                    //     $form->textarea('status_comment', 'Enter status comment (Remarks)')
                    //         ->help("Please specify with a comment");
                    // })
                    // ->when('in', [5], function (Form $form) {
                    //     $form->date('valid_from', 'Valid from date?');
                    //     $form->date('valid_until', 'Valid until date?');
                    // });
            } else {
                $form->radio('status', __('Inspection decision'))
                    ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be revarsed.")
                    ->options([
                        '4' => 'Rejected',
                        '7' => 'Provisional',
                        '17' => 'Skip',
                    ])
                    ->required()
                    ->when('in', [3, 4, 17], function (Form $form) {
                        $form->textarea('status_comment', 'Enter status comment (Remarks)')
                            ->help("Please specify with a comment");
                    });
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
