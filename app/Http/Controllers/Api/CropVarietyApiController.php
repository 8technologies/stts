<?php

namespace App\Http\Controllers\Api;

use App\Models\CropVariety;
use Encore\Admin\Controllers\AdminController; 
use App\Traits\ApiResponser;


class CropVarietyApiController extends AdminController 
{
    use ApiResponser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function crop_varities_list()
    {
        $user = auth()->user();
        $query = CropVariety::all();

        return $this->successResponse($query, $message="Crop Varieties list"); 
    } 
}
