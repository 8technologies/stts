<?php

namespace App\Models;

use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Support\Facades\Mail;
use App\Mail\Notification;

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
        'phone_number',
        'farm_location',
        'premises_location', 
        'years_of_expirience',
        'qds_has_crops',
        'have_been_qds',
        'previous_grower_number',
        'have_adequate_storage_facility',
        'cropping_histroy',
        'have_adequate_isolation',
        'isolation_distance',
        'have_adequate_labor',
        'number_of_labors',
        'aware_of_minimum_standards',
        'signature_of_applicant',
        'recommendation',
        'certification',
        'status',
        'valid_from',
        'valid_until',
        'inspector_id',
        'grower_number',
        'registration_number',
       
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
                $model->inspector_id = null;
                $model->valid_until = null;
                $model->valid_from = null;
                return $model;
            } 
        });

        self::created(function ($model) {
            MyNotification::send_notification($model, 'FormQds', request()->segment(count(request()->segments()))); 
            
            
        });

        self::updated(function ($m) {

            MyNotification::update_notification($m, 'FormQds', request()->segment(count(request()->segments())-1));
  
        });

        self::deleting(function ($model) {
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }


    // the jwt auth to map this model to the jwt rest api token authentication
    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier() {
        return $this->getKey();
    }


    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims() {
        return [];
    }
    
   
}

 
    