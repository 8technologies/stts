<?php

namespace App\Http\Controllers\Api;

use App\Models\MarketableSeed;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;

class MarketableSeedApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        // $this->middleware('auth');
        $this->middleware('auth');
    }

    public function marktable_seed_list()
    {
        /*  ---attributes---
        
        */
        $user = auth()->user();
        $query = DB::table('marketable_seeds')->where('administrator_id', '=', $user->id)->get();
        // $query = MarketableSeed::all();
        
        
        return $this->successResponse($query, $message="Marketable seeds list."); 
    }   


    // delete MarketableSeed
    public function marktable_seed_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = MarketableSeed::find($id);
        
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        MarketableSeed::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
