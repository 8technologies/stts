<?php

namespace App\Models;

use App\Imports\SubGrowersImport;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Auth\Database\Administrator;
use App\Models\MyNotification;

use Excel;
use Illuminate\Support\Facades\Log;

class PlantingReturn extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'name',
        'address', 
        'telephone', 
        'amount_enclosed',
        'payment_receipt', 
        'registerd_dealer',
        'sub_growers_file', 
    ];
    // ./storage/'
    public static function import_sub_growers($m)
    {
        Log::info(' import_sub_growers');
        if ($m === null || strlen($m->sub_growers_file) <= 3) {
            Log::info(' sub_growers_file');
            return;
        }
    
        // $file = '/home/technolo/stts/public/storage/' . $m->sub_growers_file;
        $file = public_path('storage/' . $m->sub_growers_file);
        Log::info($file);
    
        if (!file_exists($file)) {
            Log::info(' !file_exists');
            return;
        }
        // $array = Excel::toArray([], $file)[0];
        Log::info('file_exists');
        $import = new SubGrowersImport();
        $allSheets = Excel::toArray($import, $file);
        Log::info('All sheets');

        if (!isset($allSheets[1])) {
            Log::info('no sheet 2 found');
            return; // Or handle error: second sheet not found
        }

        $rows = array_slice($allSheets[1], 1);
        Log::info(' sheet 2 found');

        $fields = [
            'field_name' => 0,
            'name' => 1,
            'size' => 2,
            'crop' => 3,
            'seed_class' => 4,
            'lot_number' => 5,
            'source_of_seed' => 6,
            // 'variety' => 7,
            'planting_date' => 7,
            'quantity_planted' => 8,
            'expected_yield' => 9,
            'phone_number' => 10,
            'gps_latitude' => 11,
            'gps_longitude' => 12,
            'district' => 13,
            'subcourty' => 14,
            'village' => 15,
        ];
    
        foreach ($rows as $value) {
        // foreach (array_slice($array[0], 1) as $value) {
            if (empty(array_filter($value)) || count($value) <= 15) {
                continue;
            }
    
            $sub = new SubGrower();
    
            foreach ($fields as $field => $index) {
                if (isset($value[$index]) && strlen($value[$index]) > 0) 
                {
                    /* if ($field === 'planting_date') {
                        $excelDate = $value[$index];
                        if (is_numeric($excelDate)) {
                            if ($excelDate > 60) {
                                $excelDate -= 2;
                            }
                            date_default_timezone_set('Africa/Kampala');
                            $sub->planting_date = date('Y-m-d', strtotime('1900-01-01 +' . $excelDate . ' days'));
                        }
                    } */
                    if ($field === 'planting_date') {
                        $excelDate = trim($value[$index]);

                        // If it's a numeric Excel date (e.g., 45291)
                        if (is_numeric($excelDate)) {
                            if ($excelDate > 60) {
                                $excelDate -= 2; // Excel leap year bug adjustment
                            }
                            $sub->planting_date = date('Y-m-d', strtotime('1900-01-01 +' . $excelDate . ' days'));
                        }
                        // If it's a date string (e.g., "1/2/2025")
                        else {
                            $timestamp = strtotime(str_replace('/', '-', $excelDate)); // Normalize to "1-2-2025"
                            if ($timestamp) {
                                $sub->planting_date = date('Y-m-d', $timestamp);
                            } else {
                                Log::warning("Invalid date format: " . $excelDate);
                            }
                        }
                    }
                    elseif($field === 'crop'){
                        $rawCropValue = trim($value[$index]);
                        preg_match('/CROP:\s*(.*?),\s*VARIETY:\s*(.*)/i', $rawCropValue, $matches);

                        $cropName = trim($matches[1] ?? '');
                        $varietyName = trim($matches[2] ?? '');

                        // $varietyName = trim($value[$index]);
                        $variety = \App\Models\CropVariety::where('name', $varietyName)->first();
                        $crop = Crop::where('name', $cropName)->first();
                        if ($variety) {
                            $sub->crop = $crop->id;
                            $sub->variety = $variety->id;
                        } else {
                            // Handle missing variety - optional
                            Log::warning("Variety not found: " . $varietyName);
                            continue; // or skip, or create a default variety
                        }
                    } elseif ($field === 'seed_class') {
                        $input = strtolower(trim($value[$index]));

                        // Define acceptable variations mapped to canonical values
                        $seedClassMap = [
                            'pre-basic' => 'Pre-Basic',
                            'pre basic' => 'Pre-Basic',
                            'certified' => 'Certified seed',
                            'certified seed' => 'Certified seed',
                            'basic' => 'Basic seed',
                            'basic seed' => 'Basic seed',
                            'qds' => 'Qds',
                            'quality declared seed' => 'Qds',
                        ];

                        if (isset($seedClassMap[$input])) {
                            $sub->seed_class = $seedClassMap[$input];
                        } else {
                            Log::warning("Unknown seed class: " . $value[$index]);
                            continue 2; // Skip this row if invalid
                        }
                    }

                    else {
                        $sub->{$field} = $value[$index];
                    }
                }
            }
            $sub->planting_return_id = $m->id;
            $sub->administrator_id = $m->administrator_id;
            $sub->save();
        }

        foreach ($rows as $value) {
            // Skip empty rows: all cells empty or just whitespace
            if (empty(array_filter($value, fn($cell) => trim((string)$cell) !== ''))) {
                Log::info('Skipping empty row: ' . json_encode($value));
                continue;
            }

            if (count($value) <= 15) {
                Log::warning('Skipping incomplete row: ' . json_encode($value));
                continue;
            }

            $sub = new SubGrower();

            foreach ($fields as $field => $index) {
                if (isset($value[$index]) && strlen(trim($value[$index])) > 0) {
                    if ($field === 'planting_date') {
                        $excelDate = $value[$index];
                        if (is_numeric($excelDate)) {
                            if ($excelDate > 60) {
                                $excelDate -= 2;
                            }
                            date_default_timezone_set('Africa/Kampala');
                            $sub->planting_date = date('Y-m-d', strtotime('1900-01-01 +' . $excelDate . ' days'));
                        }
                    } elseif ($field === 'variety') {
                        $varietyName = trim($value[$index]);
                        $variety = \App\Models\CropVariety::where('name', $varietyName)->first();
                        if ($variety) {
                            $sub->variety = $variety->id;
                        } else {
                            Log::warning("Variety not found: " . $varietyName);
                            continue 2; // skip entire row if variety is missing
                        }
                    } else {
                        $sub->{$field} = $value[$index];
                    }
                }
            }

            $sub->planting_return_id = $m->id;
            $sub->administrator_id = $m->administrator_id;
            $sub->save();
        }

    }
    
    
    public static function boot()
    {
        parent::boot();


        self::creating(function ($model) {
              
        });

        self::created(function ($m) {
            Log::info(' created');
            self::import_sub_growers($m);
            //MyNotification::send_notification($m, 'PlantingReturn', request()->segment(count(request()->segments())));
            return $m;
            //created
        });

        self::updating(function ($model) { 
        });

        self::updated(function ($m) {
          
  
           //check the role of the user 
            if (Admin::user()->isRole('basic-user')){
            $file = null;
            if ($m != null) {
                if (strlen($m->sub_growers_file) > 3) {
                   
    
                    if (file_exists('/home/technolo/stts/public/storage/'  . $m->sub_growers_file)) {
                        $file = '/home/technolo/stts/public/storage/' . $m->sub_growers_file;
                    } else {
                        $m->sub_growers_file = null;
                        $m->save();
                        return;
                    }
                } else {
                    return $m;
                }
            } else {
                return $m;
            }

            if ($file == null) {
                return $m;
            }
            self::import_sub_growers($m);
        }
        //MyNotification::update_notification($m, 'PlantingReturn', request()->segment(count(request()->segments())-1));
            
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }

    public function form_sr10s()
    {
        return $this->hasMany(FormSr10::class);
    }

    public function subgrowers() {
        return $this->hasMany(Subgrower::class);
    }

    public function planting_return_crops()
    {
        return $this->hasMany(PlantingReturnCrop::class);
    }

    public function crop()
    {
        return $this->belongsTo(Crop::class);
    }
}