<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Auth\Database\Administrator;
use App\Models\MyNotification;

use Excel;

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

    public static function import_sub_growers($m)
    {
        if ($m === null || strlen($m->sub_growers_file) <= 3) {
            return;
        }
    
        $file = './storage/' . $m->sub_growers_file;
    
        if (!file_exists($file)) {
            return;
        }
    
        $array = Excel::toArray([], $file);
        
        foreach (array_slice($array[0], 1) as $value) {
            if (count($value) <= 11) {
                continue;
            }
    
            $sub = new SubGrower();
    
            $fields = [
                'field_name' => 0,
                'name' => 1,
                'size' => 2,
                'crop' => 3,
                'seed_class' => 4,
                'lot_number' => 5,
                'source_of_seed' => 6,
                'variety' => 7,
                'planting_date' => 8,
                'quantity_planted' => 9,
                'expected_yield' => 10,
                'phone_number' => 11,
                'gps_latitude' => 12,
                'gps_longitude' => 13,
                'district' => 14,
                'subcourty' => 15,
                'village' => 16,
            ];
    
            foreach ($fields as $field => $index) {
                if (isset($value[$index]) && strlen($value[$index]) > 2) {
                    $sub->{$field} = $value[$index];
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
            self::import_sub_growers($m);
            MyNotification::send_notification($m, 'PlantingReturn', request()->segment(count(request()->segments())));
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
                    if (file_exists('./storage/' . $m->sub_growers_file)) {
                        $file = './storage/' . $m->sub_growers_file;
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
        MyNotification::update_notification($m, 'PlantingReturn', request()->segment(count(request()->segments())-1));
            
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

    public function planting_return_crops()
    {
        return $this->hasMany(PlantingReturnCrop::class);
    }

    public function crop()
    {
        return $this->belongsTo(Crop::class);
    }
}