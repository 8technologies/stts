<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\PreOrder;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use App\Models\Utils;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;

class PreOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'PreOrder';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PreOrder());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))->display(function ($f) 
        {
            return Carbon::parse($f)->toFormattedDateString();
        });
        $grid->column('administrator_id', __('Created by'))->display(function ($id) 
        {
            if ($id == Auth::user()->id) 
            {
                return "You";
            }
            $u = Administrator::find($id);
            if (!$u) {
                return $id;
            }
            return $u->name;
        });

        $grid->column('crop_variety_id', __('Crop variety'))->display(function ($id) 
        {
            $item = CropVariety::find($id);
            if (!$item) {
                return "-";
            }
            return $item->crop->name . " - " . $item->name;
        });

        $grid->column('quantity', __('Quantity'))->display(function ($qty) 
        {
            return number_format($qty) . " Kgs";
        });

        $grid->column('seed_class', __('Seed class'));
    
      
        $grid->column('collection_date', __('Collection date'))->display(function ($f) 
            {
                return Carbon::parse($f)->toFormattedDateString();
            });
        $grid->column('pickup_location', __('Pickup location'));

        $grid->disableBatchActions();

        $grid->actions(function ($actions) 
        {
            $administrator_id = ((int)(($actions->row['administrator_id'])));
            if ($administrator_id != Auth::user()->id) 
            {
                $actions->disableDelete();
                $actions->disableEdit();
            }
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
        $show = new Show(PreOrder::findOrFail($id));

        $show->field('created_at', __('Created at'))->as(function ($f) 
        {
            return Carbon::parse($f)->toFormattedDateString();
        });
        $show->field('administrator_id', __('Client'))->as(function ($id) 
        {
            $u = Administrator::find($id);
            if (!$u) 
            {
                return $id;
            }
            return $u->name;
        });
        $show->field('crop_variety_id', __('Crop variety'))->as(function ($id) 
        {
            $item = CropVariety::find($id);
            if (!$item) 
            {
                return "-";
            }
            return $item->crop->name . " - " . $item->name;
        });
        $show->field('quantity', __('Quantity'))->as(function ($qty) 
        {
            return number_format($qty) . " Kgs";
        });;
        $show->field('seed_class', __('Seed class'));
        $show->field('collection_date', __('Collection date'))->as(function ($f) 
        {
            return Carbon::parse($f)->toFormattedDateString();
        });
        $show->field('pickup_location', __('Pickup location'));
        $show->field('detail', __('Detail'));
        $show->field('status', __('Status'))
        ->unescape()
        ->as(function ($status) 
        {
            return Utils::tell_status($status);
        });
        $show->panel()
            ->tools(function ($tools) 
            {
                $id = request()->route()->parameters['pre_order'];
                $tools->disableEdit();
                $tools->disableList();
                $tools->disableDelete();

                //check if the user is not the owner of this pre-order
                $pre_order = PreOrder::find($id);
                if ($pre_order->administrator_id != Auth::user()->id) 
                {
                    $tools->append("<a href='" . admin_url('quotations/create?pre_order_id='.$id) . "' class='btn btn-primary'>SUBMIT QUOTATION</a>");
                }

               
            });;


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PreOrder());

        //callback after saving form to return to table
        $form->saved(function (Form $form) 
        {

            return redirect(admin_url('pre-orders'));
        });

         //callback before saving form to return to table
         $form->saving(function (Form $form) 
        {
            if ($form->collection_date <= Carbon::now()) 
            {
            
                return  response(' <p class="alert alert-warning"> Please select a later date for collection . <a href="/admin/pre-orders/create"> Go Back </a></p> ');
            }

        });


        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id', __('Administrator id'))
                ->value(Auth::user()->id)
                ->default(Auth::user()->id);

            $_items = [];
            foreach (CropVariety::all() as $key => $item) 
            {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $form->select('crop_variety_id', 'Select crop variety')->options($_items)
                ->required();
            $form->text('quantity', __('Quantity (in Kgs)'))
                ->required()
                ->attribute('min', 0)
                ->attribute('type', 'number');

            $form->radio('seed_class', __('Seed class'))
                ->options
                ([
                    'Pre-basic' => 'Pre-basic',
                    'Basic' => 'Basic',
                    'Certified' => 'Certified',
                    'Quality declaired seed' => 'Quality declaired seed',
                ])
                ->when('Certified', function (Form $form) 
                {
                    $form->select('invetory_status', __('Select invetory status'))
                        ->options
                        ([
                            'Raw' => 'Raw',
                            'Processed' => 'Processed'
                        ]);
                });


            $form->hidden('status', __('Status'))->default(1);
            $form->date('collection_date', __('Collection date'))->required();
            $form->text('pickup_location', __('Pickup location'))->required();
            $form->textarea('detail', __('Detail'));
        }


        $form->disableEditingCheck();
        $form->disableViewCheck();
        $form->disableReset();

        return $form;
    }
}
