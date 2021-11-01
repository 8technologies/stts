<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlantingReturn extends Model
{
    use HasFactory;
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
