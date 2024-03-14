<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Quotation;
use Illuminate\Http\Request;
use App\Models\PreOrder;
use App\Models\Order;

class QuotationController extends Controller
{
    
    public function index()
    {
        // Retrieve all Quotation instances
        $forms = Quotation::all()->load('crop_variety:id,name');
        
        // Return a collection of Quotation resources
        return response()->json($forms);
    }

      
    public function store(Request $request)
    {
       $data = $request->all();
       $pre_order = PreOrder::find($request->pre_order_id);

       if ($pre_order && ($pre_order->administrator_id == $request->administrator_id)) 
        {
            return response()->json(['message' => 'You cannot create a quotation for your own pre-order'], 404);
        }else{
            return response()->json(['message' => 'Pre-order not found'], 404);
        }

        // Create the main form instance
        $form = Quotation::create($data);
    
        // Return the created main form instance
        return response()->json($form);
    }
    
    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $quotation= Quotation::find($id);
       
        if($quotation->status == 5){
            $order = new Order();

            $order->administrator_id = $quotation->administrator_id;
            $order->order_by = $quotation->pre_order_id;
            $order->crop_variety_id = $quotation->crop_variety_id;
            $order->quantity = $quotation->quantity;
            $order->payment_type = null;
            $order->product_id =  $quotation->crop_variety_id;
            $order->seed_class = $quotation->seed_class;
            $order->receipt = null;
            $order->total_price = $quotation->price * $quotation->quantity;
            $order->status = 1;
            $order->detail = "From pre-order ID: " . $quotation->id;

            $order->save();
        }
        // Update the main form instance
        $quotation->update($data);
     
         // Return the created main form instance
         return response()->json($quotation);
    }
    
    
    public function show($id)
    {
        // Retrieve the form instance with related data
        $form = Quotation::where('administrator_id', $id)
        ->with('crop_variety:id,name')
        ->get();
        

        return response()->json($form);
    }

    public function showQuotationsMadeByMe($id)
    {
        // Retrieve the form instance with related data
        $form = Quotation::where('quotation_by', $id)
        ->with('crop_variety:id,name')
        ->get();
        // Return the JSON response
        return response()->json($form);
    }

    public function destroy($id)
    {
        // Find the form instance to delete
        $form = Quotation::find($id);
    
        // Delete the form instance
        $form->delete();
    
        // Return a JSON response indicating success
        return response()->json(['message' => 'Form and related records deleted successfully']);
    }
    

   //get the inspections assigned to an inspector
   public function getAssignedForms($id)
    {
        // Retrieve the forms assigned to the inspector with related data
        $forms = Quotation::where('inspector_id', $id)
                        ->get();
        
        return response()->json($forms);
    }

}

