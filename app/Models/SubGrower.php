<?php

namespace App\Models;

use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubGrower extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();

        self::creating(function ($m) { 
            $sub = SubGrower::where('filed_name', $m->filed_name)
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

        self::updating(function ($sr10) {
         
        });

        self::updated(function ($sr10) {
            // ... code here
            if(!Utils::sr10_inialized($sr10)){
                if (Admin::user()->isRole('inspector')){
                    $crop = Crop::find($sr10->crop);
                    if($crop != null){
                        if($crop->crop_inspection_types !=null){
                            foreach ($crop->crop_inspection_types as $key => $val) {
                                dd($val);
                            }
                        }
                    }
                    dd($sr10);
                }
            }
            die("====>!!<=====");
            //$sr10->planting_return_id  = $sub;
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
