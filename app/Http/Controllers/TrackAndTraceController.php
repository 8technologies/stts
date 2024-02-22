<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SeedLab;
use App\Models\FormCropDeclaration;

use App\Models\StockRecord;

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
        
            $loadStock = StockRecord::where('id', $seedLab->load_stock_id)
                ->where('user_id', $seedLab->user_id)
                ->first();
            
            if (!$loadStock) {
                return response()->json(null);
            }
        
            $crop_declaration = $loadStock->crop_declaration_id;
        
            if (!$crop_declaration) {
                return response()->json(null);
            }
        
            $crop_declaration = FormCropDeclaration::where('id', $crop_declaration)
                ->first();
        
            if (!$crop_declaration) {
                return response()->json(null);
            }
        
            $crop_variety = CropVariety::where('id', $crop_declaration->crop_variety_id)
                ->first();
        
            if (!$crop_variety) {
                return response()->json(null);
            }
        
            $crop = Crop::where('id', $crop_variety->crop_id)
                ->value('crop_name');
        
            if (!$crop) {
                return response()->json(null);
            }

            $generation = SeedClass::where('id', $loadStock->seed_class)
                ->value('class_name');
            
            if (!$generation) {
                return response()->json(null);
            }
        
            $data = [
                'crop' => $crop,
                'crop_variety' => $crop_variety->crop_variety_name,
                'generation' =>  $generation,
                'seed_class' => $seedLab->seed_class,
                'lab_test_number'=> $seedLab->seed_lab_test_report_number,
                'germination' => $seedLab->germination_test_results,
                'purity' => $seedLab->purity_test_results,
                'testing_methods' => $seedLab->testing_methods,
                'test_decision'=> $seedLab->test_decision,
                'lot_number' => $seedLab->lot_number,
                'mother_lot' => $crop_declaration->source_lot_number,
                'moisture' => $seedLab->moisture_content_test_results,
                'test_date' => $seedLab->updated_at,
                
                
            ];
        }
          return response()->json($data);
      }
      


    public function track(Request $request)
    {
        $seed_details_web = [];

        if ($request->lot_number) {
            $seed_details_web = SeedLab::where('mother_lot', $request->lot_number)
                ->get(['id', 'lot_number']);
        }

        $seed_details = [];

        if ($request->lot_number) {
            $lot_numbers = SeedLab::where('mother_lot', $request->lot_number)->get();

            if (!$lot_numbers->isEmpty()) {
                foreach ($lot_numbers as $lot_number) {
                    $crop_variety = CropVariety::where('id', $lot_number->crop_variety_id)
                    ->first();
                $crop = Crop::where('id', $crop_variety->crop_id)->value('crop_name');
                $loadStock = LoadStock::where('id',  $lot_number->load_stock_id)
                ->first();
                $generation = SeedClass::where('id',$loadStock->seed_class)
                ->value('class_name');

                $seed_details[] = [
                    'crop' => $crop,
                    'crop_variety' => $crop_variety->crop_variety_name,
                    'mother_lot' => $lot_number->mother_lot,
                    'lot_number' => $lot_number->lot_number,
                    'generation' =>  $generation,
                    'seed_class' => $lot_number->seed_class,
                    'lab_test_number'=> $lot_number->seed_lab_test_report_number,
                    'germination' => $lot_number->germination_test_results,
                    'purity' => $lot_number->purity_test_results,
                    'testing_methods' => $lot_number->testing_methods,
                    'test_decision'=> $lot_number->test_decision,
                    'moisture' => $lot_number->moisture_content_test_results,
                    'test_date' => $lot_number->updated_at,
                ];
                }
            }
        }

        return response()->json(['seed_details' => $seed_details, 'seed_details_web' => $seed_details_web]);
    }

      
}
