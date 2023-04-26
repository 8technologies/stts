<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\FormStockExaminationRequest;
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

        $grid->disableFilter();
        $grid->filter(function ($filter) 
        {

            if (Admin::user()->isRole('admin')) 
            {
                $filter->equal('administrator_id', "Filter by user")->select(Administrator::all()->pluck('name', 'id'));
            }
            $filter->equal('crop_variety_id', "Filter by crop variety")->select(CropVariety::all()->pluck('name', 'id'));
            $filter->equal('is_deposit', "Filter by stock record type")->select([
                '1' => "Stock in",
                '0' => "Stock out",
            ]);
        });


        if (!Admin::user()->isRole('admin')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
        } else {
            $grid->disableCreateButton();
        }

        $grid->disableCreateButton();

        $grid->column('administrator_id', __('Owner'))->display(function ($item) 
        {
            return Administrator::find($item)->name;
        })->sortable();
        $grid->column('created_at', __('Created at'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        $grid->column('lot_number', __('Lot number'));
        $grid->column('detail', __('Reason'));
        $grid->column('is_deposit', __('Type'))->display(function ($item)
            {
                if ($item) {
                    return '<span class="badge">Stock in</span>';
                } else {
                    return '<span class="badge">Stock out</span>';
                }
            })->sortable();
        $grid->column('quantity', __('Quantity (M. Tonnes)'))->display(function ($q) 
        {
            return number_format($q);
        })->sortable();
    
            // ->totalRow(function ($amount) 
            // {
            //     return number_format($amount);
            // });

        $grid->disableActions();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();
        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableView();
            $actions->disableEdit();
            $actions->disableDelete();
        });


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

        $form->saving(function ($form) {
            $receiver_id = 0;
            $varity_id = ((int)($form->crop_variety_id));
            $quantity = ((int)($form->quantity));
            if ($quantity < 0) {
                $quantity = (-1) * $quantity;
            }
            $varity = Crop::find($varity_id);
            $detail_2 = $form->detail;

            $records = StockRecord::where([
                'administrator_id' => Admin::user()->id,
                'crop_variety_id' => $varity_id
            ])->get();
            $tot = 0;
            foreach ($records as $key => $value) {
                $tot += ((int)($value->quantity));
            }

            if ($quantity > $tot) {
                admin_error("Warning", "You have insufitient quantity stock of crop vareity {$varity->name}. You tried to 
                transfer " . number_format($quantity) . " from " . number_format($tot) . " (Metric Tonnes).");
                return redirect(admin_url('stock-records/create'));
            }

            if ($form->is_transfer) {
                $receiver_id = ((int)($form->seed_class));

                if ($receiver_id < 0) {
                    admin_error("Warning", "You did not select Receiver.");
                    return redirect(admin_url('stock-records/create'));
                }
                

                $receiver_record = new StockRecord();
                $receiver_record->administrator_id = $receiver_id;
                $receiver_record->crop_variety_id = $varity_id;
                $receiver_record->detail = "Stock transfer from " . Admin::user()->name . ", ID: " . Admin::user()->id;
                $receiver_record->source = "Stock transfer from " . Admin::user()->name . ", ID: " . Admin::user()->id;
                $detail_2 = "Stock transfer to " . Administrator::find($receiver_id)->name . ", ID: " . Administrator::find($receiver_id)->id;
                $receiver_record->is_deposit = 1;
                $receiver_record->is_transfer = 1;
                $receiver_record->seed_class = "-";
                $receiver_record->quantity = $quantity;
                if (!$receiver_record->save()) {
                    dd("failed to transfer.");
                }
            }

            $receiver_record_2 = new StockRecord();
            $receiver_record_2->administrator_id = Admin::user()->id;
            $receiver_record_2->crop_variety_id = $varity_id;
            $receiver_record_2->detail = $detail_2;
            $receiver_record_2->source = $detail_2;
            $receiver_record_2->is_deposit = 0;
            $receiver_record_2->is_transfer = 1;
            $receiver_record_2->seed_class = "-";
            $receiver_record_2->quantity = (-1) * ($quantity);
            if (!$receiver_record_2->save()) {
                dd("Failed to save transfer record.");
            }
            admin_success("Success!", "Stock record was created successfully!");
            return redirect(admin_url('stock-records'));


            
        });

        $user = Admin::user();
        $stock = [];
        $stock_ids = [];
        $vars = [];
        $recs = StockRecord::where('administrator_id', Admin::user()->id)->get();
        foreach ($recs as $key => $value) {
            $stock[$value->crop_variety_id][] = $value;
            if (!isset($stock_ids[$value->crop_variety_id])) {
                $stock_ids[$value->crop_variety_id]['quantity'] = 0;
                $stock_ids[$value->crop_variety_id]['variety'] = $value->crop_variety();
            }
            $stock_ids[$value->crop_variety_id]['quantity'] += $value->quantity;
        }


        foreach ($stock_ids as $key => $value) {

            if (!isset($value['variety']->id)) {
                continue;
            }

            if ($value['quantity'] > 0) {
                $vars[$value['variety']->id] = $value['variety']->name
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
            ->required();
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
                        if ($value->id == Admin::user()->id) {
                            continue;
                        }
                        $users[$value->id] = $value->name . ", ID: " . $value->id;
                    }
                }

                $form->select('seed_class', 'Select receiver')
                    ->options($users)
                    ->help("Please specify with a comment");
            })
            ->when(0, function (Form $form) {
                $form->textarea('detail', 'Enter details')
                    ->help("Please specify with a comment");
            });

        return $form;
    }
}
