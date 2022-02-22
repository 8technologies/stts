<?php

namespace App\Models;

use Encore\Admin\Facades\Admin;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;



class FormSr4 extends Model
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
            if(Admin::user()->isRole('inspector')){
                if($model->status == 5){    
                    if(
                        $model->valid_from == null ||
                        strlen($model->valid_from) < 4 ||
                        strlen($model->valid_until) < 4 
                    ){
                        $model->valid_from =  Carbon::now();
                        $model->valid_until =  Carbon::now()->addYear();   
                        return $model;   
                    }
                }
            }

        });
 
    }

}
