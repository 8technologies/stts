<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController;  
use Symfony\Component\HttpFoundation\Response;
use App\Models\PreOrder;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponser;


class PreOrderApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function pre_order_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = DB::table('pre_orders')->where('administrator_id', '=', $user->id)->get();
        // $query = PreOrder::all();
        
        return $this->successResponse($query, $message="List of Pre Orders");
    }    


    // create a new preorder form
    public function pre_order_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = auth()->user();

        $data = $request->only(
            // 'administrator_id', 
            'crop_variety_id', 
            'quantity',  
            'seed_class',    
            'collection_date', 
            'pickup_location',
            'detail', 
        );

        $post_data = Validator::make($data, [
            'crop_variety_id' => 'required|integer',
            'quantity' => 'required|integer',
            'seed_class' => 'required|nullable',
            'collection_date' => 'date_format:mm-dd-yyyy|after:created_at',
            'pickup_location' => 'required|string',
            'detail' => 'required|string|nullable',
        ]);

        $form = PreOrder::create([
            'administrator_id' => auth()->user()->id,
            'crop_variety_id' => $request->input('crop_variety_id'),
            'quantity' => $request->input('quantity'),
            'seed_class' => $request->input('seed_class'),
            'collection_date' => $request->input('collection_date'),
            'pickup_location' => $request->input('pickup_location'),
            'detail' => $request->input('detail'),
            'created_at' => date('m-d-y'),
            'updated_at' => date('m-d-y'), 
        ]);

        // Form created, return success response
        return $this->successResponse($form, $message="Pre Order form submit success!");
    }
}
