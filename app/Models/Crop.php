<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Crop extends Model
{  
    protected $fillable = [
        'name',
    ];

    use HasFactory;

    public function crop_varieties()
    {
        return $this->hasMany(CropVariety::class, 'crop_id');
    }

    public function crop_inspection_types()
    {
        return $this->hasMany(CropInspectionType::class, 'crop_id');
    }  
 
   
}
