<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SeedLabel extends Model
{
    use HasFactory; 

    protected $fillable =[
        'administrator_id',
        'seed_lab_id',
        'seed_label_package_id',
        'crop_variety_id',
        'available_stock',
        'image',
        'applicant_remarks',
        'receipt',
        'quantity',
        'status',
        'status_comment',
        
    ];

    public function seed_lab()
    {
        return $this->belongsTo(SeedLab::class);
    }


    public function crop_variety(){
        $var = CropVariety::find($this->crop_variety_id);
        
        if($var == null){
            Utils::create_default_tables();
            $this->crop_variety_id = 1;
            $this->save();
        }
        return $this->belongsTo(CropVariety::class);
    }


    public function seed_label_package()
    {
        return $this->belongsTo(SeedLabelPackage::class);
    }

    protected $appends = [
        'crop_variety_text'
    ];

    public function getCropVarietyTextAttribute()
    {
        return $this->crop_variety->name;
    }

    public static function boot()
    {
        parent::boot();

            self::created(function ($model) 
            {

                MyNotification::send_notification($model, 'SeedLabel', request()->segment(count(request()->segments())));
    
            });


            self::updated(function ($model) 
            {
                //check if the status has changed to label printed and if yes subtract that quantity from the marketable seed quantity
                if($model->status == 'Label Printed'){
                   $marketable_seed = MarketableSeed::where('seed_label_id', $model->seed_label_id)->first();
                     $marketable_seed->quantity = $marketable_seed->quantity - $model->quantity;
                        $marketable_seed->save();
                }

                MyNotification::update_notification($model, 'SeedLabel', request()->segment(count(request()->segments())-1));

            });

            static::creating(function ($model) 
            {
           
            });
    }
}
