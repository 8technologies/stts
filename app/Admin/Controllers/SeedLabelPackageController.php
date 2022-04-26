<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\SeedLabelPackage;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SeedLabelPackageController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'SeedLabelPackage';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SeedLabelPackage());
        $grid->filter(function ($filter) {
            $filter->equal('crop_variety_id', "Filter by crop variety")->select(CropVariety::all()->pluck('name', 'id'));
        });


        $grid->column('crop_variety_id', __('Crop variety'))->display(function ($id) {
            return $this->crop_variety->name ;
        });
        $grid->column('package_size', __('Package size'));
        $grid->column('package_price', __('Package price'));

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
        $show = new Show(SeedLabelPackage::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('package_size', __('Package size'));
        $show->field('package_price', __('Package price'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SeedLabelPackage());
        $varieties_all = CropVariety::all(); 
        $varieties = [];
        foreach ($varieties_all as $key => $var) {
            $varieties[$var->id] = $var->crop->name . ", " . $var->name;
        }
        $form->select('crop_variety_id', __('Select Crop variety'))
            ->options($varieties)
            ->required();
        $form->text('package_size', __('Package size (in Metric Tones)'))
            ->attribute('type', 'number')
            ->required();
        $form->text('package_price', __('Package price (in UGX)'))
            ->attribute('type', 'number')
            ->required();

        return $form;
    }
}
