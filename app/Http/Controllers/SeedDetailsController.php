<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\SeedLab;
use Illuminate\Http\Request;

class SeedDetailsController extends Controller
{
    public function index()
    {
        return view('track_and_trace.track_trace_form');
      }
  
      public function trace(Request $request)
      {
        if($request->lot_number){
          $seed_details = SeedLab::where('lot_number', $request->lot_number)->first();
        };
       
        return response()->json($seed_details);
        
      }

      public function track(Request $request)
      {
          if ($request->lot_number) {
              $seed_details = SeedLab::where('mother_lot', $request->lot_number)
                  ->get(['id', 'lot_number']);
          }
          
          return response()->json($seed_details);
      }
      
}



