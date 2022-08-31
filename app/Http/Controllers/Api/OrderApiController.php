<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use App\Models\Product;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;


class OrderApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        // $this->middleware('auth');
        $this->middleware('auth');
    }

    public function order_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = Order::where('administrator_id', $user->id)
            ->get();
        $query_1 = Order::where('order_by', $user->id)
            ->get();
        foreach ($query_1 as $key => $value) {
            $query[] = $value;
        } 
        return $this->successResponse($query, $message = "List of Orders");
    }


    // creating order
    public function order_create(Request $request): \Illuminate\Http\JsonResponse
    {

        $user_id = auth()->user()->id;
        $product_id = ((int)($request->input('product_id')));
        $pro = Product::find($product_id);

        if ($pro == null) {
            return $this->errorResponse("Failed to create order  because the product was not found.", 200);
        }


        $new_order = new Order();
        $new_order->administrator_id = $pro->administrator_id;
        $new_order->crop_variety_id = $pro->crop_variety_id;
        $new_order->product_id = $pro->id;
        $new_order->quantity = $request->input('quantity');
        $new_order->detail = $_POST['note'];
        $new_order->payment_type = null;
        $new_order->status = 1;
        $new_order->total_price = $new_order->quantity * $pro->price;
        $new_order->order_by = $user_id;
        $new_order->save();


        /* seed_label_id	
quantity	
lab_test_number	
lot_number	
seed_class	
price	
wholesale_price	
image	
images	
source	
detail	
name	
total_price	  */



        return $this->successResponse($new_order, "Order was created successfully!", 201);
    }

    // delete order
    public function order_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = Order::find($id);

        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }

        if ($item->order_by != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }

        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        Order::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
