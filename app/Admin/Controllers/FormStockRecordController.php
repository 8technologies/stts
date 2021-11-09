<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\StockRecord;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class FormStockRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Stock Records';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockRecord());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        $grid->column('crop_variety_id', __('Crop variety'))
            ->display(function ($item) {
                $var = CropVariety::find($item);
                return $var->crop->name . ", " . $var->name;
            })->sortable();

        $grid->column('seed_class', __('Seed class'));
        $grid->column('is_deposit', __('Type'))
            ->display(function ($item) {
                if ($item) {
                    return '<span class="badge">Stock in</span>';
                } else {
                    return '<span class="badge">Stock out</span>';
                }
            })->sortable();

        $grid->column('quantity', __('Quantity'));
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
        $show = new Show(StockRecord::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('seed_class', __('Seed class'));
        $show->field('source', __('Source'));
        $show->field('detail', __('Detail'));
        $show->field('quantity', __('Quantity'));
        $show->field('is_deposit', __('Is deposit'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new StockRecord());
        $user = Admin::user();
        $stock = [];
        $stock_ids = [];
        $vars = [];

        foreach ($user->stock_records as $key => $value) {
            $stock[$value->crop_variety_id][] = $value;
            if (!isset($stock_ids[$value->crop_variety_id])) {
                $stock_ids[$value->crop_variety_id]['quantity'] = 0;
                $stock_ids[$value->crop_variety_id]['variety'] = $value->crop_variety;
            }
            $stock_ids[$value->crop_variety_id]['quantity'] += $value->quantity;
        }

        $headers = ['#', 'Variety', 'Quantity (in Metric tonnes)',];
        $rows = [];
        $i = 0;
        foreach ($stock_ids as $key => $value) {

            if ($value['quantity'] > 0) {
                $vars[$value['variety']->id] = "CROP: " . $value['variety']->crop->name .
                    ", VARIETY: " . $value['variety']->name
                    . ", QUANTITY: " . number_format($value['quantity']);
            }
        }


        // // table 2
        // $headers = ['Keys', 'Values'];
        // $rows = [
        //     'name'   => 'Joe',
        //     'age'    => 25,
        //     'gender' => 'Male',
        //     'birth'  => '1989-12-05',
        // ];

        // $table = new Table($headers, $rows);

        // echo $table->render();




        // dd($stock_ids);
        // dd($user->stock_records);
        //Administrator::class
        //dd($recs);



        $recs = StockRecord::where('administrator_id', Admin::user()->id)->get();
        $form->select('crop_variety_id', __('Select crop variety'))
            ->options($vars)
            ->required()
            ->default(1);
        //$form->textarea('seed_class', __('Seed class'));
        //$form->textarea('source', __('Source'));
        $form->hidden('is_deposit', __('Is deposit'));
        $form->text('quantity', __('Quantity'))->attribute('type', 'number')->required();
        $form->radio('is_transfer', __('Stock Record type'))
            ->options([
                '1' => 'Stock transfer',
                '0' => 'Other',
            ])
            ->required()
            ->when(1, function (Form $form) {
                $users = [];
                foreach (Administrator::all() as $key => $value) {
                    if ($value->isRole('basic-user')) {
                        $users[$value->id] = $value->name . ", ID: " . $value->id;
                    }
                }

                $form->select('seed_class', 'Select receiver')
                    ->options($users)
                    ->help("Please specify with a comment");
            })
            ->default(-1)
            ->when(0, function (Form $form) {
                $form->textarea('detail', 'Enter details')
                    ->help("Please specify with a comment");
            });

        return $form;
    }
}
