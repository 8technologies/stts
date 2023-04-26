<?php

namespace App\Admin\Controllers;

use App\Models\MarketableSeed;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Request;
use App\Admin\Extensions\Tools\GridView;
use Carbon\Carbon;
use Intervention\Image\Facades\Image;


class ProductController extends AdminController
{


    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Marketplace';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        $grid = new Grid(new Product());

         $grid->disableFilter();
        $grid->disableCreateButton();
         $grid->disableColumnSelector();
         $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->disableDelete();
        });
        $grid->disableBatchActions();
        $grid->disableCreateButton();
        $grid->disableExport();


        if (Request::get('view') !== 'table') {
            $grid->setView('admin.grid.card');
        }


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
        $show->field('image_url', __('Image'));
        $show->field('images', __('Images'));
        $show->field('source', __('Source'));
        $show->field('detail', __('Detail'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());

        //$form->hidden('administrator_id', __('Administrator id'))->default(1);

        $form->text('crop_variety_id', __('Crop variety ID'))->readonly();
        $form->text('seed_label_id', __('Seed label ID'))->readonly();
        $form->text('quantity', __('Quantity'))->readonly();
        $form->text('lab_test_number', __('Lab test number'))->readonly();
        $form->text('lot_number', __('Lot number'))->readonly();
        $form->text('price', __('Price'))->required()->attribute([
            'type' => 'number'
        ]);
        $form->text('wholesale_price', __('Wholesale price'))->required()->attribute([
            'type' => 'number'
        ]);
        $form->textarea('detail', __('Detail'))->required();
        // $form->image('image_url', __('Thumbnail Image'));

        $form->image('image_url', __('ThumbnailImage'))->rules('required')->thumbnail(function ($image) {
            $image->resize(200, 200);
        })->move('images/')->uniqueName()->removable();
        
        //$form->multipleImage('images', __('Gallery photos'));
     
        
        return $form;
    }
}
