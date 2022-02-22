<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormSr6 extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot(); 
        self::creating(function($model){
            
        });
 
        self::updating(function($model){
            if(
                Admin::user()->isRole('basic-user')
            ){
                $model->status = 1;
                return $model;
            } 

        });
 
    }

 
 

  
    public function form_sr6_has_crops()
    {
        return $this->hasMany(FormSr6HasCrop::class, 'form_sr6_id');
    }



}
