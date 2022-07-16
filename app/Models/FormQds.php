<?php

namespace App\Models;

use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormQds extends Model
{ 
    use HasFactory; 

    public function qds_has_crops()
    {
        return $this->hasMany(QdsHasCrop::class);
    } 

    

    protected $fillable = [
        'administrator_id',
        'name_of_applicant',
        'address',
        'premises_location', 
        'years_of_expirience',
        'have_been_qds',
        'have_adequate_storage_facility',
        'cropping_histroy',
        'have_adequate_isolation',
        'have_adequate_labor',
        'aware_of_minimum_standards',
        'signature_of_applicant',
    ];


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

}
