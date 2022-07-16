<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;
use Illuminate\Support\Facades\Auth;
use App\Models\SubGrower;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;


class PlantingReturnsGrowerApiController extends AdminController
{
    use ApiResponser;
    
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function planting_returns_grower_list()
    {
        /*  ---attributes---
        */
        $user = auth()->user();
        $query = DB::table('sub_growers')->where('administrator_id', '=', $user->id)->get();
        // $query = SubGrower::all();
        
        return $this->successResponse($query, $message="Planting Returns- Grower"); 
    } 

    
    // create new planting returns company form via api
    public function planting_returns_grower_create(Request $request): \Illuminate\Http\JsonResponse
    {
        $user = Auth::user();

        $data = $request->only(
            // 'name',
            'size', 
            'crop',
            'variety',
            'filed_name',
            'district',
            'subcourty',
            'village', 
            'planting_date',
            'quantity_planted',
            'expected_yield', 
            'phone_number', 
            'gps_latitude', 
            'gps_longitude',
            'detail', 
        );

        $post_data = Validator::make($data, [            
            'size' => 'required', 
            'crop' => 'required',
            'variety' => 'required',
            'filed_name' => 'required',
            'district' => 'required',
            'subcourty' => 'required',
            'village' => 'required', 
            'planting_date' => 'required',
            'quantity_planted' => 'required',
            'expected_yield', 
            'phone_number' => 'required', 
            'gps_latitude' => 'required', 
            'gps_longitude' => 'required',
            'detail', 
        ]);

        if ($post_data->fails()) {
            return $this->errorResponse("Planting grower company submit error", 200); 
        }


        $form = SubGrower::create([
            'administrator_id' => $user->id,
            'name' => $user->name,            
            'size' => $request->input('size'), 
            'crop' => $request->input('crop'),
            'variety' => $request->input('variety'),
            'filed_name' => $request->input('filed_name'),
            'district' => $request->input('district'),
            'subcourty' => $request->input('subcourty'),
            'village' => $request->input('village'), 
            'planting_date' => $request->input('planting_date'),
            'quantity_planted' => $request->input('quantity_planted'),
            'expected_yield' => $request->input('expected_yield'), 
            'phone_number' => $request->input('phone_number'), 
            'gps_latitude' => $request->input('gps_latitude'), 
            'gps_longitude' => $request->input('gps_longitude'),
            'detail' => $request->input('detail'), 
        ]);

        // Form created, return success response
        return $this->successResponse($form, "Planting returns grower submit success!", 201); 
    }
}

