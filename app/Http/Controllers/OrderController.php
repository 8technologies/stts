<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\Product;

class OrderController extends Controller
{
    
    public function index()
    {
        // Retrieve all Order instances
        $forms = Order::all()->load('crop_variety:id,name');
        
        // Return a collection of Order resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();

       $product =  Product::find($data['product_id']);
            if (!$product) {
                return response()->json(['message' => 'Product not found.'], 404);
            }

            if ($product->administrator_id == $data['administrator_id']) {
                return response()->json(['message' => 'You cannot order your own product.'], 404);
            }

            if ($product->quantity < 1) {
                return response()->json(['message' => 'Product is out of stock.'], 404);
            }

        // Create the main form instance
        $form = Order::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $order= Order::find($id);

        $product = Product::find($data['product_id']);
        if (!$product) 
        {
            return response()->json(['message' => 'Product not found.'], 404);
        }

        if ($order->quantity > $product->quantity) 
        {
            return response()->json(['message' => 'Ooops', 'You have inadequate stock to complete this product '], 404);
        }


        if ($order->status == 3) 
        {
            //update the available_stock in the products table by getting the quantity entered and subtracting it from the available stock
            //and save it
            $bought_quantity =  $order->quantity;
            $new_quantity = $product->available_stock - $bought_quantity;
            $product->available_stock = $new_quantity;
            $product->update();
            
        }
        // Update the main form instance
        $order->update($data);
     
         // Return the created main form instance
         return response()->json($order);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = Order::where('order_by', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }

    public function showOrdersToMe($id)
    {
        // Retrieve the form instance with related data
        $form = Order::where('administrator_id', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }


    

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = Order::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = Order::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}
