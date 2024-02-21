<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\SeedLabelPackage;

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

    public function getSeedLabelPackages()
    {
        $seed_label_packages = SeedLabelPackage::all();
    
        return response()->json($seed_label_packages);
    }
    

}
