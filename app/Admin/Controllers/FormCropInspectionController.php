<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropInspectionType;
use App\Models\CropVariety;
use App\Models\FormSr10;
use App\Models\FormSr10HasVarietyInspection;
use App\Models\FormCropDeclaration;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FormCropInspectionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'QDS - Crop Inspections'; 

    /**
     * @return Grid
     */
    
    protected function grid()
    {
        $grid = new Grid(new FormSr10());
        //show only records where the qds_declaration_id is not null
        $grid->model()->where('qds_declaration_id', '!=', null);
        $grid->disableFilter();
    

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
        $id = $model->qds_declaration_id;
        $declaration = FormCropDeclaration::findOrFail($id);

        
        $show->field('stage', __('Stage')); 
        $show->field('submited_date', __('Submited date'));

        $show->field('name', __('Applicant\'s Name'))->as(function ($i) use ($declaration){
        //get the name of the adminstrator from the administrator id in $declaration
            $admin = Administrator::find($declaration->administrator_id);
            return $admin->name;
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

        if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            $show->field('id','Action')->unescape()->as(function ($id) {
                return "<a href='/admin/qds-crop-inspection-2/$id/edit' class='btn btn-primary'>Take Action</a>";
            });
        }

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
            if (!Admin::user()->isRole('inspector')) {
                admin_warning("Warning", "Only inspectors can edit an SR10 Form");
                $can_edit = false;
                // return redirect(admin_url('form-sr10s'));
            }
            error_log(json_encode(request()->route()->parameters));
            $id = request()->route()->parameters['qds_crop_inspection_2'];
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

            $form->hidden('is_done', __('is_done'))->value(1);
            $form->hidden('is_active', __('is_done'))->value(0);

            $form->divider();

            $is_final = FormSr10::is_final_sr10($model);

            $form->html('<h3>About this Field inspection report - (QDS)</h3>');
            $crop_var = CropVariety::find($model->crop_variety_id);
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

            $form->divider();

            if ($is_final) {
                $form->radio('status', __('Inspection decision'))
                    ->help("NOTE: Once this  status is changed and submited, it cannot be reversed.")
                    ->options([
                        '4' => 'Rejected',
                        '5' => 'Accepted',
                    ])
                    ->required();
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
                             ->required()
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
