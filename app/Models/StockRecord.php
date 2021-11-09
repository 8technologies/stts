<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockRecord extends Model
{
    use HasFactory;
    
    public function crop_variety()
    { 
        return $this->belongsTo(CropVariety::class);
    }
} 
