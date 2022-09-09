<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropInspectionType;
use App\Models\CropVariety;
use App\Models\FormQds;
use App\Models\FormQdsHasVarietyInspection;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FormQDSInspectionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'QDS - Field Inspection'; 

    /**
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormQds());
        // if (Admin::user()->isRole('basic-user')) {
        //     $grid->model()->where('administrator_id', '=', Admin::user()->id);
        //     $grid->actions(function ($actions) {
        //         $status = ((int)(($actions->row['status'])));
        //         if (
        //             $status == 1 ||
        //             $status == 5 ||
        //             $status == 6
        //         ) {
        //             $actions->disableDelete();
        //             $actions->disableEdit();
        //         }
        //     });
        // } 
        
        // else {
        //     $grid->disableCreateButton();
        // }

        $grid->column('id', __('Id'));
        $grid->column('stage', __('Stage'));
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        if (!Admin::user()->isRole('basic-user')) {
            $grid->column('stfatus', __('Attension'))->display(function ($is_active) {
                if ($is_active) {
                    return '<span class="badge badge-danger">Needs your attension</span>';
                } else {
                    return '-';
                }
            })->sortable();
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
        $show = new Show(FormQds::findOrFail($id));
        $model = FormQds::findOrFail($id);

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
        $show->field('qds_number', __('QDS number')); 
      
        return $show;
    }
}
