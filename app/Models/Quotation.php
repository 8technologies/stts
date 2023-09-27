<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quotation extends Model
{
    
    public static function boot()
    {
        parent::boot();

            self::created(function ($model) 
            {

                MyNotification::send_notification($model, 'Quotation', request()->segment(count(request()->segments())));
    
            });


            self::updated(function ($model) 
            {

                MyNotification::update_notification($model, 'Quotation', request()->segment(count(request()->segments())-1));

            });

            static::creating(function ($model) 
            {
           
            });
    }
    use HasFactory;
}
