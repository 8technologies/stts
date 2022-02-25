<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MarketableSeed extends Model
{
    use HasFactory;
    
    public function crop_variety(){
        return $this->belongsTo(CropVariety::class);
    }
    
    public function seed_label_package(){
        return $this->belongsTo(SeedLabelPackage::class);
    }
}
