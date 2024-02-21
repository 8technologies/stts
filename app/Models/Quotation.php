<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quotation extends Model
{
    
    protected $fillable=[
        'administrator_id',
        'pre_order_id',
        'quotation_by',
        'crop_variety_id',
        'seed_class',
        'quantity',
        'price',
        'expected_supply_date',
        'supply_date',
        'status',
        'decline_reason'

    ];
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

    public function crop_variety()
    {
        return $this->belongsTo(CropVariety::class);
    }
}
