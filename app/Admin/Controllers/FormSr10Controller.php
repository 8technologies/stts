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
use App\Models\SubGrower;

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

        $grid->model()->orderBy('created_at', 'desc');
   
        $grid->model()->where('planting_return_id', '!=', null);

        if (Admin::user()->isRole('basic-user')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $actions->disableEdit();
                $actions->disableDelete();
                
            });
            
           
        } 
     
        //disable the creation of new form
        $grid->disableCreateButton();

        if(Admin::user()->isRole('admin'))
        {
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $actions->disableEdit();
                
            });
        }

        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();

        $grid->column('stage', __('Stage'))->display(function ($stage) {
            return CropInspectionType::find($stage)->inspection_stage;
        })->sortable();
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        if (Admin::user()->isRole('inspector')) 
        {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                //check if the status is not 1
                if ($actions->row->status != 1) {
                    $actions->disableEdit();
                }
                $actions->disableDelete();

                
            });
            $grid->column('is_active', __('Attention'))->display(function ($is_active) {
                if ($is_active) {
                    return '<span class="badge badge-danger">Needs your attension</span>';
                } else {
                    return '-';
                }
            })->sortable();
        }
        
        $grid->column('min_date', __('To be submited before'));

            
                 $grid->column('id', __('Inspection Report'))->display(function ($id)  {
                    $sr10s = FormSr10::find($id);
                 
                     if ($sr10s->status != '1' && $sr10s->status != '17') {
                         $link = url('inspection?id=' . $id);
                         return '<b><a target="_blank" href="' . $link . '">Print Report</a></b>';
                     } else {
                        
                         return '<b>Unavailable</b>';
                     }
                 });
             
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

        $show->field('stage', __('Stage')); 


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
        $show->field('crop', __('Crop'))->as(function ($i) {
            return Crop::find($this->planting_return->crop)->name;
        });
        $show->field('variety', __('Variety'))->as(function ($i) {
            return $this->planting_return->variety;
        });
 
        $show->field('seed_class', __('Seed class'))->as(function ($i) use($model) {
            return $model->planting_return->seed_class;
        });
        $show->field('size_of_field', __('Size of field'))->as(function ($i) use($model) {
            return $model->planting_return->size;
        });
        $show->field('off_types', __('Off types'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('diseases', __('Diseases'))->as(function ($i){
            return $i ?? 'Not assigned';
        }); 
        $show->field('noxious_weeds', __('Noxious weeds'))->as(function ($i){
            return $i ?? 'Not assigned';
        }); 
        $show->field('other_features', __('Other features'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('other_weeds', __('Other weeds'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('isolation_distance', __('Isolation distance'))->as(function ($i){
            return $i ?? 'Not assigned';
        }); 
        $show->field('proposed_distance', __('Proposed distance'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('general_conditions_of_crop', __('General conditions of crop'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('estimated_yield', __('Estimated yield'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('futher_remarks', __('Futher remarks'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
        $show->field('sr10_number', __('SR10s number'))->as(function ($i){
            return $i ?? 'Not assigned';
        });
      
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

        //onsaved return to the list page
        $form->saved(function (Form $form) 
        {
            admin_toastr(__('admin.form.Form submitted successfully'), 'success');
            return redirect(admin_url('form-sr10s'));
        });
       


        if ($form->isEditing()) 
        {
            
            if (!Admin::user()->isRole('inspector')) {
                admin_warning("Warning", "Only inspectors can edit an SR10 Form");
                $can_edit = false;
            }

            $id = request()->route()->parameters['form_sr10'];
            $model = $form->model()->find($id);

            if (!$model->is_active) {
                admin_error("Warning", "This form is not active. Please consult the commissioner");
                $can_edit = false;
            }
        }

        if ($can_edit) 
        {
            //get the inspection stage
            $stage = $model->stage;
            //check in the inspection type table if the stage is there
            $inspection_type = CropInspectionType::find($stage);

            $form->html('<h3>About seed-grower</h3>');
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

            

            $form->html('<h3>About this Field inspection report - (SR10)</h3>');
            $form->display('', __('Seed class'))->default($model->planting_return->seed_class)->readonly();
            $crop_var = CropVariety::find($model->planting_return->crop);
            $crop_name = $crop_var->crop->name.", ".$crop_var->name;
            $stage = CropInspectionType::find($model->stage)->inspection_stage;

            $form->display('', __('Crop'))->default($crop_name)->readonly();
            $form->display('', __('Stage'))->default($stage)->readonly();
            $form->date('min_date', __('To be submited after'))->readonly();
            $form->date('submited_date', __('Date Submited'))->value(Carbon::now()->toDateString())->default(Carbon::now()->toDateString())->readonly();

            $form->divider();
            $form->html('<h3>Crop inspection</h3>');
            $form->select('seed_class', __('seed_class'))
                ->options([
                    'Pre-Basic seed' => 'Pre-Basic seed',
                    'Basic seed' => 'Basic seed',
                    'Certified seed' => 'Certified seed',
                    'QDS seed' => 'QDS seed',
                ]);
            $form->text('size_of_field', __('Enter size of field (in Acres)'))->attribute('type', 'number');
            $form->text('off_types', __('Off-types'));
            $form->text('diseases', __('Diseases'));
            $form->text('noxious_weeds', __('Noxious weeds'));
            $form->text('other_features', __('Other features'));
            $form->text('other_weeds', __('Other weeds'));
            if($inspection_type->inspection_stage == 'Flowering'){
                $form->text('female_shedding', __('Female shedding tassels%'));
                $form->text('female_receptive', __('Female receptive silks%'));
                $form->text('female_off_types', __('Female off-type%'));
                $form->text('male_off_types', __('Male off-type%'));
            }


            $form->radio('isolation_distance', __('Enter isolation')) 
            ->options([
                'in time' => 'Time',
                'in distance' => 'Distance',
            ]) 
            ->when('in', ['in time'], function (Form $form) {
                $form->text('isolation_distance', __('Enter isolation (in days)'))->attribute('type', 'number');
            })
            ->when('in', ['in distance'], function (Form $form) {
                $form->text('isolation_distance', __('Enter isolation (in Meters)'))->attribute('type', 'number');
            });

            $form->text('', __('Crop variety'))->default($crop_var->name);
                
 
            $form->select('proposed_distance', __('Status of proposed isolation'))
                ->options([
                    'Adequate' => 'Adequate',
                    'Inadequate' => 'Inadequate'
                ]); 

                
            $form->textarea('general_conditions_of_crop', __('General conditions of crop'));
            $form->text('estimated_yield', __('Enter estimated yield (Kgs)'));
             
            $form->textarea('futher_remarks', __('Enter any futher remarks'))->rules(
                $inspection_type->is_required == 1 ? 'required' : ''
            );
            $form->divider();

                if($inspection_type->is_required == 1){
                    $form->radio('status', __('Inspection decision'))
                    ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be reversed.")
                    ->options([
                        '4' => 'Rejected',
                        '5' => 'Accepted',
                    ])
                    ->required();
                }else{
                $form->radio('status', __('Inspection decision'))
                    ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be reversed.")
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