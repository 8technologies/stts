<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PreOrder extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id', 
        'crop_variety_id', 
        'quantity', 
        'seed_class', 
        'collection_date', 
        'pickup_location', 
        'detail', 
        'created_at', 
        'updated_at',
    ];
}
