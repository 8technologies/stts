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

      

        $grid = new Grid(new FormSr10());
        $grid->disableFilter();
        // $grid->disableRowSelector();
        $grid->model()->where('planting_return_id', '!=', null);

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
            $grid->column('is_active', __('Attention'))->display(function ($is_active) {
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
        if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            $show->field('id','Action')->unescape()->as(function ($id) {
                return "<a href='/admin/form-sr10s/$id/edit' class='btn btn-primary'>Take Action</a>";
            });
        }
      
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
        // callback after save to return to table view controller after saving the form data 
        $form->saved(function (Form $form)
        {
            return redirect(admin_url('form-sr10s'));
        });


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
                    ->when('in', [7, 4, 17], function (Form $form) {
                        $form->textarea('status_comment', 'Enter status comment (Remarks)')
                            ->help("Please specify with a comment")->required();
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
