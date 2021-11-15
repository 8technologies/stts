<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CropVariety extends Model
{
    use HasFactory;

    public function crop()
    {
        return $this->belongsTo(Crop::class, 'crop_id');
    }
 
    public function seed_label_packages()
    {
        return $this->hasMany(SeedLabelPackage::class);
    }

    protected $fillable = [
        'name',
    ];
}
