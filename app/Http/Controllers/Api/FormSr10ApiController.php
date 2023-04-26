<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use App\Models\FormSr10; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
use App\Models\Utils;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class FormSr10ApiController extends AdminController
{    
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function form_sr10_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('form_sr10s')->where('administrator_id', '=', $user->id)->get();
        // $query = FormSr10::all();
        
        
        return $this->successResponse($query, $message="SR10 forms"); 
    } 

    // form_sr10_create
    public function planting_returns_grower_create(Request $request)
    {
        // code here..
    }
    
    
    // delete import permit form
    public function form_sr10_delete(Request $request): \Illuminate\Http\JsonResponse
    {
        $user_id = auth()->user()->id;
        $id = ((int)($request->input('id')));
        $item = FormSr10::find($id);
        if ($item == null) {
            return $this->errorResponse("Failed to delete  because the item was not found.", 200);
        }
        if ($item->administrator_id != $user_id) {
            return $this->errorResponse("You cannot delete an item that does not belong to you.", 200);
        }
        if (!Utils::can_be_deleted_by_user($item->status)) {
            return $this->errorResponse("Item at this stage cannot be deleted.", 200);
        }
        FormSr10::where('id', $id)->delete();
        return $this->successResponse($item, "Item deleted successfully!", 201);
    }
}
