<?php

namespace App\Models;

use Encore\Admin\Auth\Database\HasPermissions;
use Encore\Admin\Facades\Admin;
use Carbon\Carbon;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use App\Observers\NotificationObserver;
use App\Notifications\SR4FormAddedNotification;
use DB;
use Encore\Admin\Auth\Database\Administrator;
use App\Mail\Notification;

class FormSr4 extends  Model implements AuthenticatableContract, JWTSubject

{
    use Authenticatable,
        DefaultDatetimeFormat,
        HasFactory,
        Notifiable
        ;

    protected $fillable = [
        'administrator_id',
        'type',
        'name_of_applicant',
        'address',
        'company_initials',
        'premises_location',
        'expirience_in',
        'years_of_expirience',
        'dealers_in',
        'marketing_of',
        'have_adequate_land',
        'have_adequate_storage',
        'have_adequate_equipment',
        'have_contractual_agreement',
        'have_adequate_field_officers',
        'have_conversant_seed_matters',
        'souce_of_seed',
        'have_adequate_land_for_production',
        'have_internal_quality_program',
        'receipt',
        'accept_declaration'
    ];
    
    public static function boot()
    {
        parent::boot();


        self::creating(function($model){
           
        });


 
        self::updating(function($model)
        {
            if( Admin::user()->isRole('basic-user') )
            {
                $model->status = 1;
                $model->inspector = null;
                return $model;
            } 
            
            if(Admin::user()->isRole('inspector'))
            {
                if($model->status == 5)
                {    
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

        self::created(function ($model) 
        {

            Utils::send_notification($model, 'FormSr4', request()->segment(count(request()->segments())));
               
        });
        

        self::updated(function ($m) 
        {

            Utils::update_notification($m, 'FormSr4', request()->segment(count(request()->segments())-1));
  
        });

        self::deleting(function ($model) 
        {
        });

        self::deleted(function ($model) 
        {
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
