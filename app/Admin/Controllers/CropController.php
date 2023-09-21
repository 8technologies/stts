<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropVariety;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CropController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Crop';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Crop());

        $grid->column('name', __('Name'))->sortable();
     
        $grid->column('number_of_days_before_submision', __('Number of days before submision'));

        $grid->disableTools();
        $grid->disableExport();

     

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
        $show = new Show(Crop::findOrFail($id));
        $model = Crop::findOrFail($id);
        
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableDelete();
            });;

        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('qds', __('Is QDS?'))->using(['1' => 'Yes', '0' => 'No']);
        $show->field('number_of_days_before_submision', __('Number of days before submision'));


        $show->field('',__('Crop varieties'))->unescape()->as(function () use ($model) {
          
            $vars = "";
            foreach ($model->crop_varieties as $key => $value) {
                $vars .= $value->name . ", ";
            }
            return '<p>' . $vars . "</p>";
        });

        $show->field('id', __('Crop inspection types'))->unescape()->as(function ($id) use ($model) {
            $types = [];
            foreach ($model->crop_inspection_types as $key => $value) {
                $types[] = $value->inspection_stage . "(". $value->is_required . ")";
            }
        
            $list = '<ul>';
            foreach ($types as $type) {
                $list .= '<li>' . $type . '</li>';
            }
            $list .= '</ul>';
        
            return $list;
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
        $form = new Form(new Crop());

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        $form->setWidth(8, 4);
        $form->text('name', __('Name'))->required();
        $form->radio('qds', __('Is QDS?'))->options(['1' => 'Yes', '0' => 'No'])->default('1')->required();

        $form->text('number_of_days_before_submision', __('Enter Number of days before submision'))
            ->attribute(['type' => 'number'])
            ->required();


        $form->hasMany('crop_inspection_types', function (NestedForm $form) {
            $form->setWidth(8, 4);
            $form->text('inspection_stage', __('Inspection stage name'))->required();
            $form->radio('is_required', __('Is required'))->options(['Mandatory' => 'Mandatory', 'Optional' => 'Optional'])->default('1')->required();
            $form->text('period_after_planting', __('Period after planting (in days)'))
                ->attribute(['type' => 'number'])
                ->required();
        });


        $form->hasMany('crop_varieties', function (NestedForm $form) {
            $form->text('name', __('Crop Variety Name'))->required();
        });

        return $form;
    }
}
