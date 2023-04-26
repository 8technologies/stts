<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\Order;
use App\Models\PreOrder;
use App\Models\Utils;

Utils::start_session();

use App\Models\Quotation;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class QuotationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Quotations';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Quotation());

        //organise table in descending order 
        $grid->model()->orderBy('id', 'desc');

        $grid->disableFilter();
        $grid->disableColumnSelector();
        
        $grid->model()
            ->where([
                'administrator_id' => Admin::user()->id,
            ])
            ->orWhere([
                'quotation_by' => Admin::user()->id,
            ]);

        //disable the edit and delete action buttons if the user is not the one who has submitted the form
        $grid->actions(function ($actions) 
        {
            if ($actions->row->administrator_id != Auth::user()->id) 
            {
                $actions->disableDelete();
            }
            //check the status of the order
            if ($actions->row->status == 5) 
            {
                $actions->disableDelete();
                $actions->disableEdit();
            }

        });

        $grid->column('created_at', __('Created'))
            ->display(function ($f) 
            {
                return Carbon::parse($f)->toFormattedDateString();
            });
        $grid->column('administrator_id', __('Created by'))
            ->display(function ($id) 
            {
                if ($id == Auth::user()->id) 
                {
                    return "Me";
                }
                $u = Administrator::find($id);
                if (!$u) 
                {
                    return $id;
                }
                return $u->name;
            });

        $grid->column('crop_variety_id', __('Crop variety'))->display(function ($id) 
        {
            $item = CropVariety::find($id);
            if (!$item) 
            {
                return "-";
            }
            return $item->crop->name . " - " . $item->name;
        });

        $grid->column('quantity', __('Quantity'))->display(function ($qty) 
        {
            return number_format($qty) . " KGs";
        });

        $grid->column('pre_order_id', __('Pre-order ID'));
        $grid->column('supply_date', __('Supply date'))
            ->display(function ($f) 
            {
                return Carbon::parse($f)->toFormattedDateString();
            });
        $grid->column('seed_class', __('Seed class'));
        $grid->column('status', __('Status'))
            ->display(function ($status) 
            {
                return Utils::tell_status($status);
            })->sortable();

        $grid->disableCreateButton();

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
        $show = new Show(Quotation::findOrFail($id));
        $quotation = Quotation::findOrFail($id);
        $show->panel()
        ->tools(function ($tools) 
        {
            $tools->disableEdit();
            $tools->disableDelete();
        });;

        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'))->as(function ($id) 
        {
            $u = Administrator::find($id);
            if (!$u) 
            {
                return $id;
            }
            return $u->name;
        });
        $show->field('crop_variety_id', __('Crop variety id'))->as(function ($id) 
        {
            $item = CropVariety::find($id);
            if (!$item) 
            {
                return "-";
            }
            return $item->crop->name . " - " . $item->name;
        });
        $show->field('pre_order_id', __('Pre order id'));
        $show->field('quantity', __('Quantity'));
        $show->field('supply_date', __('Supply date'));
        $show->field('seed_class', __('Seed class'));
        $show->field('detail', __('Detail'));
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {
            return  Utils::tell_status($status);
        })->sortable();

        //check the that the user is not the one that is requesting the quotation
        if (Admin::user()->id != $quotation->administrator_id) 
        {
            //check the status of the quotation
            if ($quotation->status == null) 
            {
                $show->field('id','Action')->unescape()->as(function ($id)
                {
                    return "<a href='/admin/quotations/$id/edit' class='btn btn-primary'>Take Action</a>";
                });
            } 
           
        } 

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {

        $form = new Form(new Quotation());
        $form->setWidth(8, 4);
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            $tools->disableView();
        });

        if ($form->isEditing()) 
        {
            $id = request()->route()->parameters['quotation'];
            $quote = $form->model()->find($id);

            //prevent a user from editing the form once it has been approved
            if($quote->status == 5)
            {
               $form->html('<div class="alert alert-danger">Sorry! You cannot edit this form. </div>');
               $form->footer(function ($footer) 
               {

                   // disable reset btn
                   $footer->disableReset();

                   // disable submit btn
                   $footer->disableSubmit();

                   // disable `View` checkbox
                   $footer->disableViewCheck();

                   // disable `Continue editing` checkbox
                   $footer->disableEditingCheck();

                   // disable `Continue Creating` checkbox
                   $footer->disableCreatingCheck();

               });
            }

            //callback to return to table after saving
            $form->saved(function (Form $form) 
            {
                return redirect('/admin/quotations');
            });

            if ($form->saving(function ($f) 
            {

                $id = request()->route()->parameters['quotation'];
                $quote = $f->model()->find($id);

                //create a new order once a quotation has been approved
                if ($f->status == 5) 
                {
                    $order = new Order();

                    $order->administrator_id = $quote->administrator_id;
                    $order->order_by = $quote->pre_order_id;
                    $order->crop_variety_id = $quote->crop_variety_id;
                    $order->quantity = $quote->quantity;
                    $order->payment_type = null;
                    $order->product_id =  $quote->crop_variety_id;
                    $order->seed_class = $quote->seed_class;
                    $order->receipt = null;
                    $order->total_price = $quote->price * $quote->quantity;
                    $order->status = 1;
                    $order->detail = "From pre-order ID: " . $quote->id;

                    $order->save();
                }
            }));


            $form->text('pre_order_id', __('Pre order id'))
                ->readonly()
                ->default($id);

            $form->hidden('quotation_by', __('Quotation by'))
                ->readonly();
           
                
            $_items = [];
            foreach (CropVariety::all() as $key => $item) 
            {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $form->select('crop_variety_id', 'Crop variety')->options($_items)
                ->readonly();

            $form->text('seed_class', __('Seed class'))->readonly();

            $form->text('quantity', __('Quantity you intend to supply (in KGs)'))
                ->attribute('type', 'number')->readonly();

            $form->text('price', __('Unti selling price. (in UGX)'))
                ->attribute('type', 'number')->readonly();

            $form->date('supply_date', __('Supply date'))->readonly();


            $form->divider();

            //if the user is not the one who created the quotation, then show the edit field
            if ($quote->administrator_id != Auth::user()->id) 
            {
                $form->radio('status', __('Make action on this quotation'))
                    ->required()
                    ->options
                    ([
                        '5' => 'Accept',
                        '15' => 'Declined',
                    ])
                    ->help("NOTE: Once you accept this quotation, the decision cannot be reversed.")
                    ->when('15', function (Form $form) 
                    {
                        $form->textarea('decline_reason', __('Reason why declined'))
                            ->help("Optional");
                    });
            }
        }

        if ($form->isCreating()) 
        {

            if (isset($_GET['pre_order_id']) && (!isset($_SESSION['pre_order_id']))) 
            {
                $id = ((int)($_GET['pre_order_id']));
                if ($id > 0) 
                {
                    $_SESSION['pre_order_id'] = $id;
                    return redirect(admin_url('quotations/create'));
                }
            }
            $id = 0;
            if (isset($_SESSION['pre_order_id'])) 
            {
                $id = $_SESSION['pre_order_id'];
            }

            if ($id < 1) 
            {
                return admin_error('Warning', "Pre-order ID not found.");
            }

            $preOrder = PreOrder::find($id);
            if (!$preOrder) 
            {
                return admin_error('Warning', "Pre-order not found.");
            }


            if ($preOrder->administrator_id == Auth::user()->id) 
            {
                return admin_error('Warning', "You cannot creata a quotation to your own pre-order.");
            }

            if ($form->saved(function ($d) 
            {
                if (isset($_SESSION['pre_order_id'])) 
                {
                    unset($_SESSION['pre_order_id']);
                }

                return redirect(admin_url('quotations'));
            }));

            $form->hidden('administrator_id', __('Administrator id'))
                ->value(Auth::user()->id)
                ->default(Auth::user()->id);

            $form->text('pre_order_id', __('Pre order id'))
                ->readonly()
                ->default($id);

            $form->hidden('quotation_by', __('Quotation by'))
                ->readonly()
                ->default($preOrder->administrator_id);
            $_items = [];
            foreach (CropVariety::all() as $key => $item) 
            {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $form->select('crop_variety_id', 'Crop variety')->options($_items)
                ->default($preOrder->crop_variety_id)
                ->readonly();

            $form->text('seed_class', __('Seed class'))->default($preOrder->seed_class)
                ->readonly();

            $form->display('quantity_requested', __('Quantity requested (in Kgs)'))
                ->attribute('type', 'number')->default($preOrder->quantity)
                ->readonly();

            $form->text('quantity', __('Enter Quantity you intend to supply (in Kgs)'))
                ->attribute('type', 'number')->required();

            $form->text('price', __('Enter Price your unti selling price. (in UGX)'))
                ->attribute('type', 'number')->required();

            $form->display('expected_supply_date', __('Expected supply date'))
                ->attribute('type', 'date')->default($preOrder->collection_date)
                ->readonly();

            $form->date('supply_date', __('Supply date'))->required();
            $form->textarea('detail', __('Detail'));
        }

        $form->disableEditingCheck();
        $form->disableViewCheck();
    
            return $form;
    }
}
