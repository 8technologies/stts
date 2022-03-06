<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubGrower extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();

        self::creating(function ($m) {
            $sub = SubGrower::where('field_name', $m->field_name)
                ->where('name', $m->name)->first();
 

            if($sub!=null){
                return false;
            } 
             

            $m->status = 1;
            $m->inspector = 0;
            
            return $m;
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
