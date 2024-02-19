<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Crop;
use App\Models\CropVariety;

class CropController extends Controller
{
    public function index()
    {
        // Retrieve all Crop instances
        $crops = Crop::all();
       
        return response()->json($crops);
    }

    public function getCropVarieties()
    {
        $crop_varieties = CropVariety::with('crop')->get();
    
        return response()->json($crop_varieties);
    }
    

}
