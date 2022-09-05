<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLabelPackage extends Model
{
    public function crop_variety(){
        $var = CropVariety::find($this->crop_variety_id);
        if($var == null){
            Utils::create_default_tables();
            $this->crop_variety_id = 1;
            $this->save();
        } 
        return $this->belongsTo(CropVariety::class);
    }
    use HasFactory;

    protected $appends = [
        'crop_variety_text'
    ];

    public function getCropVarietyTextAttribute()
    {
        return $this->crop_variety->name;
    }
    
}
