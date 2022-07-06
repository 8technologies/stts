<?php

namespace App\Http\Controllers\Api;

use Encore\Admin\Controllers\AdminController; 
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use App\Traits\ApiResponser;


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
}
