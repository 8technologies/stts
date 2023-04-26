<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormCropDeclarationsHasCropVariety extends Model
{
    use HasFactory;
    public function form_crop_declaration(){
        return $this->belongsTo(FormCropDeclaration::class);
    }
    
    public function crop_variety(){
        return $this->belongsTo(CropVariety::class);
    }


    protected $fillable = [
        'form_crop_declaration_id',
        'crop_variety_id',
    ];
}
