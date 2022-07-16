<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController;  
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use App\Models\PlantingReturn;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class PlantingReturnsCompanyApiController extends AdminController
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function planting_returns_company_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('planting_returns')->where('administrator_id', '=', $user->id)->get();
        // $query = PlantingReturn::all();
        
        return $this->successResponse($query, $message="Planting Returns- Company");
    } 


    // create new planting returns company form via api
    public function planting_returns_company_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            'address', 
            'telephone', 
            'amount_enclosed',
            'payment_receipt', 
            'registerd_dealer',
            'sub_growers_file',
        );

        $post_data = Validator::make($data, [
            'address' => 'required', 
            'telephone' => 'required', 
            'amount_enclosed' => 'required',
            'payment_receipt' => 'required', 
            'registerd_dealer',
            'sub_growers_file' => 'required',
        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("Planting returns company submit error", 200); 
        }


        $form = PlantingReturn::create([
            'administrator_id' => $user->id,
            'name' => $user->name,
            'address' => $request->input('address'), 
            'telephone' => $request->input('telephone'), 
            'amount_enclosed' => $request->input('amount_enclosed'),
            'payment_receipt' => $request->input('payment_receipt'), 
            'registerd_dealer' => $request->input('registerd_dealer'),
            'sub_growers_file' => $request->input('sub_growers_file'),
        ]);

        // Form created, return success response
        return $this->successResponse($form, "Planting returns company submit success!", 201); 
    }
}

