<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CropInspectionType extends Model
{
    use HasFactory; 
    public function crop()
    {
        return $this->belongsTo(Crop::class, 'crop_id');
    }    

    protected $fillable = [
        'inspection_stage',
        'period_after_planting',
        'crop_id', 
    ];
}
