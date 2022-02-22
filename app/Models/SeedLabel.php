<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLabel extends Model
{
    use HasFactory; 
    public function seed_lab()
    {
        return $this->belongsTo(SeedLab::class);
    }

    public function crop_variety()
    {
        return $this->belongsTo(CropVariety::class);
    }

    public function seed_label_package()
    {
        return $this->belongsTo(SeedLabelPackage::class);
    }
}
