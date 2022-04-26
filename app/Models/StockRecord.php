<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockRecord extends Model
{
    use HasFactory; 
    
    public function crop_variety()
    { 
        return $this->belongsTo(CropVariety::class);
    }


    public static function boot()
    {
        parent::boot(); 

        self::updating(function ($model) {
            if(strlen($model->lot_number)<2){
                $model->lot_number = rand(10000000,1000000000);
            }
            return $model;
        });
 
        self::creating(function ($model) {
            if(strlen($model->lot_number)<2){
                $model->lot_number = rand(10000000,1000000000);
            }
            return $model;
        });
 
 
    }


} 
