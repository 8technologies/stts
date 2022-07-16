<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class PlantingReturnCrop extends Model
{
    use HasFactory; 

    public function crop_variety()
    { 
        return $this->belongsTo(CropVariety::class);
    }

    public function planting_return()
    { 
        return $this->belongsTo(PlantingReturn::class);
    }

    protected $fillable = [
        'lot_number',
        'size_of_land',
        'date_planted',
        'date_harvest', 
        'previous_crops', 
        'crop_variety_id', 
        'planting_return_id', 
    ];
}
