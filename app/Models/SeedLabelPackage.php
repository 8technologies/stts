<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLabelPackage extends Model
{
    public function crop_variety(){
        return $this->belongsTo(CropVariety::class);
    }
    use HasFactory;
}
