<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SeedLab;
use App\Models\CropVariety;
use App\Models\Crop;
use App\Models\FormStockExaminationRequest;

class TrackAndTraceController extends Controller
{

    public function index()
    {
        return view('track_and_trace.track_trace_form');
    }

    public function trace(Request $request)
      {
       
        if($request-> lot_number){
          
            $seedLab = SeedLab::where('lot_number', $request->lot_number)->first();
            
        
            if (!$seedLab) {
                return response()->json(null);
            }

            $seed_class = FormStockExaminationRequest::where('id', $seedLab->form_stock_examination_request_id)
                ->value('seed_class');
        
         
            $crop_variety = CropVariety::where('id', $seedLab->crop_variety_id)
                ->first();
        
            if (!$crop_variety) {
                return response()->json(null);
            }
        
            $crop = Crop::where('id', $crop_variety->crop_id)
                ->value('name');
        
            if (!$crop) {
                return response()->json(null);
            }

            $data = [
                'crop' => $crop,
                'crop_variety' => $crop_variety->crop_variety_name,
                'seed_class' => $seed_class,
                'lab_test_number'=> $seedLab->seed_lab_test_number,
                'germination_capacity' => $seedLab->germination_capacity,
                'purity' => $seedLab->purity,
                'testing_methods' => $seedLab->tests_required,
                'test_decision'=> $seedLab->report_recommendation,
                'lot_number' => $seedLab->lot_number,
                'mother_lot' => $seedLab->mother_lot,
                'moisture' => $seedLab->moisture,
                'test_date' => $seedLab->updated_at,
                
                
            ];
        }
          return response()->json($data);
      }
      


      public function track(Request $request)
      {
          $seed_details = [];
      
          // Check if the lot number is provided in the request
          if ($request->has('lot_number')) {
           
              // Retrieve all records with the given mother lot number
              $lot_numbers = SeedLab::where('mother_lot', $request->lot_number)->get();
              return response()->json($lot_numbers);
              // Check if there are any records found
              if (!$lot_numbers->isEmpty()) {
               
                  foreach ($lot_numbers as $lot_number) {
                      // Retrieve crop variety information
                      $crop_variety = CropVariety::where('id', $lot_number->crop_variety_id)->first();
                      // Retrieve crop information based on crop variety
                      $crop = Crop::where('id', $crop_variety->crop_id)->value('crop_name');
                      // Retrieve seed class information
                      $seed_class = FormStockExaminationRequest::where('id', $lot_number->form_stock_examination_request_id)->value('seed_class');
      
                      // Construct seed details array
                      $seed_details[] = [
                          'crop' => $crop,
                          'crop_variety' => $crop_variety->crop_variety_name,
                          'mother_lot' => $lot_number->mother_lot,
                          'lot_number' => $lot_number->lot_number,
                          'seed_class' => $seed_class,
                          'lab_test_number' => $lot_number->seed_lab_test_number,
                          'germination_capacity' => $lot_number->germination_capacity,
                          'purity' => $lot_number->purity,
                          'testing_methods' => $lot_number->tests_required,
                          'test_decision' => $lot_number->report_recommendation,
                          'moisture' => $lot_number->moisture,
                          'test_date' => $lot_number->updated_at,
                      ];
                  }
              }
          }
      
          // Return JSON response with seed details
          return response()->json(['seed_details' => $seed_details]);
      }
      
      
}
