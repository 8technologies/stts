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
        //disable create button
        $grid->disableCreateButton();
        
        //organise in descending order
        $grid->model()->orderBy('id', 'desc');
    

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

        $grid->column('stage', __('Stage'))->display(function ($stage) {
            return CropInspectionType::find($stage)->inspection_stage;
        })->sortable();
        
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        if (Admin::user()->isRole('inspector')) {
            $grid->actions(function ($actions) {
                
                
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
        
        else if(Admin::user()->isRole('basic-user') || Admin::user()->isRole('admin') || !$grid->model()->where('status', '=', 5)){

            $grid->actions(function ($actions) {
                
                    $actions->disableEdit();
                    $actions->disableDelete();
                    
            });
        }

        $grid->column('min_date', __('To be submited before'));
        //confirm inspection button

        $grid->column('', __('Confirm Inspection'))->display(function () 
        {
            $id = $this->id;
            
            $formSr10 = FormSr10::find($id);
            $confirmedClass = $formSr10 ->confirm == 1 ? 'btn-primary' : 'btn-blue';
            $confirmedText = $formSr10 ->confirm == 1 ? 'Confirmed' : 'Confirm';
            if($formSr10 ->confirm == 1) 
            {
                return "<a class='btn btn-xs $confirmedClass' disabled>$confirmedText</a>";
            }
            elseif($formSr10 ->status != 1){
                if(Admin::user()->isRole('basic-user')){
                return "<a id='confirm-order-{$id}' href='" . route('orders.confirm', ['id' => $id]) . "' class='btn btn-xs $confirmedClass confirm-order' data-id='{$id}'>Confirm</a>";
                }
                //else{
                //     return "<a class='btn btn-xs $confirmedClass' disabled>$confirmedText</a>";
                    
                // }
            }
            
        })->sortable();
            // css styling the button to blue initially
                Admin::style('.btn-blue {color: #fff; background-color: #0000FF; border-color: #0000FF;}');
                
                //Script to edit the form status field to 2 on click of the confirm order button
                Admin::script
                ('
                    $(".confirm-order").click(function(e) 
                    {
                        $(this).removeClass("btn-blue");
                        $(this).addClass("btn-primary");
                        $(this).text("Processing...");

                        e.preventDefault();
                        var id = $(this).data("id");
                        var url = "' . route('inspections.confirm', ['id' => ':id']) . '";
                        url = url.replace(":id", id);
                        var button = $("#confirm-order-" + id);
                        $.ajax(
                            {
                                url: url,
                                type: "PUT",
                                data: 
                                {
                                    _method: "PUT",
                                    _token: LA.token,
                                    status: 21,
                                },
                                success: function (data) 
                                {
                                    $.pjax.reload("#pjax-container");
                                    toastr.success("Inspection confirmed successfully");
                    
                                }
                            });
                    });
                ');
                        
                       
                  return $grid;
              }
          
              public function confirm($id)
              {
                  $sr10 = FormSr10::findOrFail($id);
                  $sr10->confirm = 1; 
                  $sr10->save();
                  return response()->json(['status' => 'success']);
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

        
        $show->field('stage', __('Stage'))->as(function ($stage) {
            return CropInspectionType::find($stage)->inspection_stage;
        });
   

        $show->field('name', __('Applicant\'s Name'))->as(function ($i) use ($declaration){
        //get the name of the adminstrator from the administrator id in $declaration
            $admin = Administrator::find($declaration->administrator_id);
            return $admin->name;
        });
        

        $show->field('seed_class', __('Seed class'))->as(function ($i){
            return $i ?? 'Not assigned';
        });  
        $show->field('size_of_field', __('Size of field'))->as(function ($i){
            return $i ?? 'Not assigned';
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
        $show->field('variety', __('Variety'))->as(function ($i){
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
        $show->field('sr10_number', __('SR10s number'))->as(function ($i){
            return $i ?? 'Not assigned';
        }); 
      
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
            $nextInspection = Utils::getNextInspection($model);
             //get the inspection stage
             $stage = $model->stage;
             //check in the inspection type table if the stage is there
             $inspection_type = CropInspectionType::find($stage);

            Admin::script("$('document').ready(function(){
                $('.remove').hide();
                $('.add').hide();
            });");

            $form->hidden('is_done', __('is_done'))->value(1);
            $form->hidden('is_active', __('is_done'))->value(0);

            $form->divider();

            // $is_final = FormSr10::is_final_sr10($model);

            $form->html('<h3>About this Field inspection report - (QDS)</h3>');
            $crop_var = CropVariety::find($model->crop_variety_id);
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
            $form->text('plant_count', __('Plant Count'))->attribute('type', 'number');

                
            $form->textarea('general_conditions_of_crop', __('General conditions of crop'));
            $form->text('estimated_yield', __('Enter estimated yield (Kgs)'));
             
            $form->textarea('futher_remarks', __('Enter any futher remarks'));
            $form->divider();

              
            if($nextInspection == null){
                $form->radio('status', __('Inspection decision'))
                ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be reversed.")
                ->options([
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()
                ->when('in', [4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment")->rules('required');
                });
            
        }else{
            $form->radio('status', __('Inspection decision'))
                ->help("NOTE: Once this SR1O's status is changed and submited, it cannot be reversed.")
                ->options([
                    '4' => 'Rejected',
                    '7' => 'Provisional',
                    '17' => 'Skip',
                    '5' => 'Accepted',
                ])
                ->required()
                ->when('in', [7, 4, 17], function (Form $form) {
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
