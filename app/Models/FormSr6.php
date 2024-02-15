<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\HasPermissions;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use Encore\Admin\Auth\Database\Administrator;
use App\Mail\Notification;


class FormSr6 extends Model implements AuthenticatableContract, JWTSubject
{
    use Authenticatable,
        DefaultDatetimeFormat,
        HasFactory,
        Notifiable;

        
    public function form_sr6_has_crops()
    {
        return $this->hasMany(FormSr6HasCrop::class);
    } 


    protected $fillable = [
        'administrator_id',
        'type',
        'name_of_applicant',
        'phone_number',
        'address',
        'premises_location',
        'years_of_expirience',
        'form_sr6_has_crops',
        'seed_grower_in_past',
        'grower_number',
        'have_adequate_storage',
        'previous_grower_number',
        'cropping_histroy',
        'have_adequate_isolation',
        'have_adequate_labor',
        'aware_of_minimum_standards',
        'signature_of_applicant',
        'status',
        'inspector_id',
        'status_comment', 
        'registration_number', 
        'valid_from',
        'valid_until',
    ];

    public static function boot()
    {
        $user = Auth::user();
        
        parent::boot(); 

        self::creating(function($model)
        {
         
            // code here            
        });

        self::created(function ($model) 
        {    

                MyNotification::send_notification($model, 'FormSr6', request()->segment(count(request()->segments())));
            // code here            
        });
 

        self::updating(function($model)
        {
         
            
        });


        self::updated(function ($m) {
            MyNotification::update_notification($m, 'FormSr6', request()->segment(count(request()->segments())-1));

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
    public function getJWTIdentifier() 
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims() 
    {
        return [];
    }

    //documents relationship
    public function attachments()
    {
        return $this->hasMany(Attachment::class);
    }
   
}
