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

        $market_records = MarketableSeed::where('is_counted', 0)->get();

        foreach ($market_records as $key => $market_rec) {
            $pro = null;
            $pro = Product::where('lab_test_number', $market_rec->lab_test_number)->first();

            if ($pro == null) {
                $new_pro = new Product();
                $new_pro->administrator_id = $market_rec->administrator_id;
                $new_pro->crop_variety_id = $market_rec->crop_variety_id;
                $new_pro->seed_label_id = $market_rec->seed_label_id;
                $new_pro->quantity = (int) ($market_rec->quantity);
                $new_pro->lab_test_number = $market_rec->lab_test_number;
                $new_pro->lot_number = $market_rec->lot_number;
                $new_pro->seed_class = $market_rec->seed_class;
                $new_pro->price = $market_rec->price;
                $new_pro->wholesale_price = $market_rec->price;
                $new_pro->image = $market_rec->image;
                $new_pro->images = $market_rec->images;
                $new_pro->source = $market_rec->source;
                $new_pro->detail = $market_rec->detail;
                $new_pro->name = $market_rec->crop_variety->name;

                $saved = false;
                if ($new_pro->save()) {
                    $market_rec->is_counted = 1;
                    if ($market_rec->save()) {
                        $saved = true;
                    }
                }

                if (!$saved) {
                    dd("Something went wrong while saving data");
                }
            } else {
                try {
                    $pro->name = $market_rec->crop_variety->name;
                } catch (\Throwable $th) {
                    $pro->name = "No name";
                }
                $pro->administrator_id = $market_rec->administrator_id;
                $pro->crop_variety_id = $market_rec->crop_variety_id;
                $pro->seed_label_id = $market_rec->seed_label_id;
                $pro->quantity = ((int)($pro->quantity)) + ((int) ($market_rec->quantity));
                $pro->lab_test_number = $market_rec->lab_test_number;
                $pro->lot_number = $market_rec->lot_number;
                $pro->seed_class = $market_rec->seed_class;
                $pro->source = $market_rec->source;
                $pro->detail = $market_rec->detail;
                if (!$pro->save()) {
                    dd("failed to save");
                }
                $market_rec->is_counted = 1;
                $market_rec->save();
            }
        }

        $grid = new Grid(new Product());
        // $grid->column('id', __('Id'))->sortable();
        
        

        $grid->disableFilter();
        $grid->disableCreateButton();
        $grid->disableColumnSelector();
        // $grid->disableExport();

        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();

        // $grid->column('updated_at', __('Updated at'));
        // $grid->column("administrator_id"->name, __('Owner'))->sortable();
        // $grid->column('administrator_id', __('Administrator id'))->sortable();
        $grid->column('crop_variety_id', __('Crop variety id'));
        $grid->column('seed_label_id', __('Seed label id'));
        $grid->column('quantity', __('Quantity'));
        // $grid->column('lab_test_number', __('Lab test number'));
        // $grid->column('lot_number', __('Lot number'));
        $grid->column('seed_class', __('Seed class'));
        $grid->column('price', __('Price'))->sortable();
        $grid->column('wholesale_price', __('Wholesale price'));
        $grid->column("image_url", __("Image"));


        // $grid->column("image_url", __("Image"))->display(function ($image_url) {
        //     $image = Image::make($image_url)->resize(200, 200);
        //     return '<img src="'. $image->encode('data-url') .'"/>';
        // });;


        $grid->column('images', __('Images'));
        $grid->column('source', __('Source'));
        $grid->column('detail', __('Detail'));

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
