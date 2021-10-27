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
    protected $fillable = [
        'name',
    ];
}
