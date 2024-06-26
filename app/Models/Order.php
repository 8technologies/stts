<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory; 

    protected $fillable = [
        'administrator_id',
        'order_by',
        'crop_variety_id',
        'seed_class',
        'product_id',
        'price',
        'quantity',
        'detail',
        'payment_type',
        'total_price',
        'status',

    ];

    protected $appends = [
        'crop_variety_text'
    ];

    public function getCropVarietyTextAttribute()
    {
        return $this->crop_variety->name;
    }

    public function crop_variety()
    {
        $c = CropVariety::find($this->crop_variety_id);
        if ($c == null) {
            $this->crop_variety_id = 1;
            $this->save();
        }
        return $this->belongsTo(CropVariety::class);
    }

    public static function boot()
    {
        parent::boot();

            self::created(function ($model) 
            {

               // MyNotification::send_notification($model, 'Order', request()->segment(count(request()->segments())-1));
    
            });


            self::updated(function ($model) 
            {

               // MyNotification::update_notification($model, 'Order', request()->segment(count(request()->segments())-1));

            });

            static::creating(function ($model) 
            {
           
            });
    }
    
    
}
