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
        'inventory_status', // 'raw', 'processed'
        'detail',
        'created_at',
        'updated_at',
        'response',
        'supply_date',
        'decline_reason',
        'status'
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

                MyNotification::send_notification($model, 'PreOrder', request()->segment(count(request()->segments())));
    
            });


            self::updated(function ($model) 
            {

                MyNotification::update_notification($model, 'PreOrder', request()->segment(count(request()->segments())-1));

            });

            static::creating(function ($model) 
            {
           
            });
    }
}
