<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    use HasFactory;
    public function category()
    {
        return $this->belongsTo(category::class);
    }

    public static function boot()
    {
        parent::boot();

        self::creating(function ($model) {
             
        });

        self::created(function ($model) {
            //created
        });

        self::updating(function ($model) {
            // ... code here
            
        });

        self::updated(function ($model) {
            // ... code here
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
