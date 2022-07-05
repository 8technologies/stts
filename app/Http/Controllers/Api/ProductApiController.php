<?php

namespace App\Admin\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Request;
use App\Admin\Extensions\Tools\GridView;


class ProductApiController extends AdminController
{
    protected function detail($id)
    {
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('seed_label_id', __('Seed label id'));
        $show->field('quantity', __('Quantity'));
        $show->field('lab_test_number', __('Lab test number'));
        $show->field('lot_number', __('Lot number'));
        $show->field('seed_class', __('Seed class'));
        $show->field('price', __('Price'));
        $show->field('wholesale_price', __('Wholesale price'));
        $show->field('image', __('Image'));
        $show->field('images', __('Images'));
        $show->field('source', __('Source'));
        $show->field('detail', __('Detail'));

        return $show;
        return response()->json([
            'success' => true,
            'data' =>  $show
        ], Response::HTTP_OK); 
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());

        $form->number('administrator_id', __('Administrator id'))->default(1);
        $form->number('crop_variety_id', __('Crop variety id'))->default(1);
        $form->number('seed_label_id', __('Seed label id'))->default(1);
        $form->number('quantity', __('Quantity'));
        $form->number('lab_test_number', __('Lab test number'));
        $form->number('lot_number', __('Lot number'));
        $form->number('seed_class', __('Seed class'));
        $form->number('price', __('Price'));
        $form->number('wholesale_price', __('Wholesale price'));
        $form->image('image', __('Image'));
        $form->textarea('images', __('Images'));
        $form->textarea('source', __('Source'));
        $form->textarea('detail', __('Detail'));

        return $form;
    }
}
