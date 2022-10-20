<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\MarketableSeed;
use App\Models\Utils;

Utils::start_session();

use App\Models\Order;
use App\Models\Product;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;


class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Order';


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {


        //$grid->column('administrator_id', __('Administrator id'));
        $grid = new Grid(new Order());

        if (!Admin::user()->isRole('admin')) {
            $grid->model()
                ->where([
                    'administrator_id' => Admin::user()->id,
                ])
                ->orWhere([
                    'order_by' => Admin::user()->id,
                ]);
        };
        $grid->disableExport();
        $grid->disableBatchActions();
        $grid->disableTools();
        $grid->disableColumnSelector();
        $grid->disableCreateButton();

        $grid->column('id', __('Order ID'));
        $grid->column('created_at', __('Created'))->display(function ($t) {
            return Carbon::parse($t)->toFormattedDateString();
        })->sortable();
        $grid->column('order_by', __('Order by'))
            ->display(function ($id) {
                if ($id == Admin::user()->id) {
                    return "Me";
                }
                $u = Administrator::find($id);
                if (!$u) {
                    return "-";
                }
                return $u->name;
            })->sortable();
        $grid->column('product_id', __('Product'))
            ->display(function ($id) {
                $u = Product::find($id);
                if (!$u) {
                    return "-";
                }
                return $u->name;
            })->sortable();

        $grid->column('quantity', __('Quantity'))
            ->display(function ($id) {
                return number_format($id) . " KGs";
            })->sortable();
        $grid->column('total_price', __('Total price'))
            ->display(function ($id) {
                return "UGX. " . number_format($id);
            })->sortable();

        $grid->column('status', __('Status'))
            ->display(function ($status) {
                return  Utils::tell_order_status($status);
            })->sortable();


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
        $show = new Show(Order::findOrFail($id));
        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('order_by', __('Order by'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('product_id', __('Product id'));
        $show->field('quantity', __('Quantity'));
        $show->field('detail', __('Detail'));
        $show->field('payment_type', __('Payment type'));
        $show->field('receipt', __('Receipt'));
        $show->field('status', __('Status'));

        return $show;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order());

        if ($form->isEditing()) {

            $form->saved(function ($form) {
                return redirect(admin_url('orders'));
            });
            $form->saving(function ($form) {
                $id = request()->route()->parameters['order'];
                $order = $form->model()->find($id);
                if (!$order) {
                    dd("Order not found");
                }

                $pro = Product::find($order->product_id);
                if (!$pro) {
                    die("Product not found");
                }

                if ($order->quantity > $pro->quantity) {
                    admin_error('Ooops', 'You have inadequate amount of product (' . $pro->name . ") to proceed with this 
                    order #" . $order->id);
                    return redirect(admin_url('orders'));
                }


                if ($form->status == 3) {
                    $market = new MarketableSeed();
                    $market->administrator_id = $order->administrator_id;
                    $market->quantity = $order->quantity;
                    $market->crop_variety_id = $order->crop_variety_id;
                    $market->lab_test_number = $pro->lab_test_number;
                    $market->seed_label_id = $pro->seed_label_id;
                    $market->lot_number = $pro->lot_number;
                    $market->seed_label_package_id = $pro->seed_label_package_id;
                    $market->price = $pro->price;
                    $market->is_deposit = 0;
                    $market->is_counted = 1;
                    $market->seed_class = null;
                    $market->source = null;

                    $u = Administrator::find($order->order_by);
                    if (!$u) {
                        return "-";
                    }


                    $market->detail = "Sold crop to " . $u->name . ", ID: " . $u->id;
                    $market->image = null;
                    $market->images = null;
                    if ($market->save()) {
                        admin_success("Success", "Order complted successfully.");
                    }
                }
            });

            $id = request()->route()->parameters['order'];
            $pro = $form->model()->find($id);
            if (!$pro) {
                dd("Order not found.");
            }
            $users = [];
            foreach (Administrator::all() as $key => $value) {
                $users[$value->id] = $value->name . " - " . $value->id;
            }

            $form->select('administrator_id', __('Seller'))
                ->options($users)
                ->value($pro->administrator_id)
                ->readonly()
                ->default($pro->administrator_id);

            $form->select('order_by', __('Buyer'))
                ->options($users)
                ->value(Admin::user()->id)
                ->readonly()
                ->default(Admin::user()->id);
            $product = Product::find($pro->product_id);

            if ($product) {


                $form->select('crop_variety_id', __('Crop'))
                    ->options([
                        $pro->crop_variety_id => $product->name
                    ])
                    ->value($pro->crop_variety_id)
                    ->readonly()
                    ->default($pro->crop_variety_id);
                $form->hidden('product_id', __('Product id'))->default($pro->id);
            }


            $form->display('quantity', __('Available quantity'))->default(
                number_format($pro->quantity) . " KGs"
            );
            $form->display('price', __('Unit price'))->default(
                "UGX. " . number_format($pro->price)
            );
            $form->display('quantity', __('Enter Quantity (in KGs)'));

            $form->divider();

            if (!$product) {
                $id = request()->route()->parameters['order'];
                $order = $form->model()->find($id);
                if (!$order) {
                    dd("Order not found");
                }
                $pros = Product::where([
                    'crop_variety_id' => $order->crop_variety_id,
                    'administrator_id' => Auth::user()->id,
                ])->get();

                $items = array();
                foreach ($pros as $key => $pro) {
                    $items[$pro->id] = $pro->name . ", QTY: " . $pro->quantity;
                }
                if (count($items) < 1) {
                    $var  = CropVariety::find($order->crop_variety_id);
                    admin_warning("Warning", "You have insufitient amount of {$var->name} to supply.");

                    $form->disableEditingCheck();
                    $form->disableCreatingCheck();
                    $form->disableViewCheck();
                    $form->disableSubmit();
                    $form->disableReset();
                    $form->disableEditingCheck();
                    return $form;
                }
                $form->select('product_id', "Select for your products")
                    ->options($items)
                    ->required();
            }

            if ($pro->status == 3) {
                admin_warning("Warning", "This order completed, 
                it's stage cannot be updated anymore.");
            } else {
                if ($pro->order_by != Admin::user()->id) {
                    $form->radio('status', "Update order status")
                        ->options([
                            '1' => 'Pending',
                            '5' => 'Processing',
                            '2' => 'Shipping',
                            '3' => 'Completed',
                            '4' => 'Canceled',
                        ])
                        ->help("Once you mark this ordered as complted, you cannot reverse the process.")
                        ->required();
                } else {
                    admin_warning("Warning", "You cannot update status of your own order.");
                }
            }
        }

        if ($form->isCreating()) {
            $form->saving(function ($new_order) {
                $id = $_SESSION['product_id'];
                $pro =  Product::find($id);
                //$new_order = new Order();
                $new_order->administrator_id = $_POST['administrator_id'];
                $new_order->crop_variety_id = $_POST['crop_variety_id'];
                $new_order->product_id = $_POST['product_id'];
                $new_order->quantity = $_POST['quantity'];
                $new_order->detail = $_POST['detail'];
                $new_order->payment_type = null;
                $new_order->status = 1;
                $new_order->total_price = $new_order->quantity * $pro->price;
                $new_order->order_by = Admin::user()->id;
                unset($_SESSION['product_id']);
                admin_success("Success", "Order submited successfully.");
            });


            $id = 0;
            if (isset($_GET['id'])) {
                $id = (int)($_GET['id']);
                $_SESSION['product_id'] = $id;
                header("Location: " . admin_url('orders/create'));
                die();
            }


            if (isset($_SESSION['product_id'])) {
                $id = $_SESSION['product_id'];
            }


            if ($id < 1) {
                dd("pro not found");
                return ("Product ID not found. You have to create new order from market place.");
            }
            $pro =  Product::find($id);
            if (!$pro) {
                return "Product not found.";
            }

            if ($pro->administrator_id == Admin::user()->id) {
                return "You cannot order for your own product.";
            }

            if ($pro->quantity < 1) {
                return admin_error('Out of sock.', "This product is out of stock.");
            }

            $users = [];
            foreach (Administrator::all() as $key => $value) {
                $users[$value->id] = $value->name . " - " . $value->id;
            }

            $form->select('administrator_id', __('Seller'))
                ->options($users)
                ->value($pro->administrator_id)
                ->readonly()
                ->default($pro->administrator_id);

            $form->select('order_by', __('Buyer'))
                ->options($users)
                ->value(Admin::user()->id)
                ->readonly()
                ->default(Admin::user()->id);
            $form->select('crop_variety_id', __('Crop'))
                ->options([
                    $pro->crop_variety_id => $pro->name
                ])
                ->value($pro->crop_variety_id)
                ->readonly()
                ->default($pro->crop_variety_id);

            $form->hidden('product_id', __('Product id'))->default($pro->id);
            $form->display('quantity', __('Available quantity'))->default(
                number_format($pro->quantity) . " KGs"
            );
            $form->display('price', __('Unit price'))->default(
                "UGX. " . number_format($pro->price)
            );

            $form->divider();


            $form->text('quantity', __('Enter Quantity (in KGs)'))->required()
                ->value($pro->quantity)
                ->default($pro->quantity)
                ->help("MAX: " . number_format($pro->quantity) . " KGs")
                ->attribute('type', 'number');

            // $form->radio('payment_type', __('Payment type'))
            //     ->options([
            //         'Cash on delivery' => 'Cash on delivery',
            //         'Paid' => 'Paid',
            //     ])
            //     ->required()
            //     ->default("Cash on delivery")
            //     ->help("Select payment method")
            //     ->when('Paid', function (Form $form) {
            //         $form->file('receipt', __('Attach Receipt'));
            //     });


            $form->textarea('detail', __('Extra note'))
                ->help("Optional");
            $form->hidden('status', __('Status'))->default(1)->value(1);
            $form->hidden('total_price', __('total_price'))->default(1)->value(1);
        }


        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();
        $form->disableReset();

        return $form;
    }
}
