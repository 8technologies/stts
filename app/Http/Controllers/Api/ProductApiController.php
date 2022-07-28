<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use Encore\Admin\Controllers\AdminController; 
// use Illuminate\Support\Facades\Request; 
use Illuminate\Http\Request;
use App\Models\Utils;
use App\Traits\ApiResponser;


class ProductApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function products_list()
    {
        $user = auth()->user();
        // $query = Product::where('administrator_id', $user->id)->get();
        // $query = DB::table('products')->where('administrator_id', '=', $user->id)->get();
        $query = Product::all();
        
        return $this->successResponse($query, $message="List of Marketplace products"); 
    }   

     
    // delete product
    public function product_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = Product::find($id);
        
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        Product::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
