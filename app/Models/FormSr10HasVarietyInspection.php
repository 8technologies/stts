<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormSr10HasVarietyInspection extends Model
{
    use HasFactory; 


    public function form_sr_10()
    { 
        return $this->belongsTo(FormSr10::class);
    }

    protected $fillable = [
        'form_sr10_id',
        'planting_return_crop_id',
        'planting_return_crop_name',
    ];
}
