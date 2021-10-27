<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Crop extends Model
{
    use HasFactory;
    public function crop_varieties()
    {
        return $this->hasMany(CropVariety::class, 'crop_id');
    }
    protected $fillable = [
        'name',
    ];
}
