<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Auth\Authenticatable;
use Illuminate\Notifications\Notifiable;


class Product extends Model
{
    use Authenticatable, DefaultDatetimeFormat, HasFactory, Notifiable;

    protected $appends = [
        'phone'
    ];

    public function getPhoneAttribute()
    {
        return "0783204665";
        $u = Administrator::find($this->administrator_id);
        return $u;
    }



  
    public static function boot()
    {
        parent::boot();

            self::created(function ($model) 
            {

                Utils::send_notification($model, 'Product', request()->segment(count(request()->segments())));
    
            });


            self::updated(function ($model) 
            {

                Utils::update_notification($model, 'Product', request()->segment(count(request()->segments())-1));

            });

            static::creating(function ($model) 
            {
           
            });
    }
}
