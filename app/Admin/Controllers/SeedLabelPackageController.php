<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\Crop;
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
            $filter->equal('crop_variety_id', "Filter by crop ")->select(Crop::all()->pluck('name', 'id'));
        });


        $grid->column('crop_variety_id', __('Crop'))->display(function ($id) {
            return Crop::find($id)->name;
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
        $show->field('crop_variety_id', __('Crop'))->as(function ($id) {
            return Crop::find($id)->name;
        });
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
        
        $form->select('crop_variety_id', __('Select Crop'))->options(Crop::all()->pluck('name', 'id'))->required();
        $form->text('package_size', __('Package size (in Kgs)'))
            ->attribute('type', 'number')
            ->required();
        $form->text('package_price', __('Package price (in UGX)'))
            ->attribute('type', 'number')
            ->required();

        return $form;
    }
}
