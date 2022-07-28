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


class FormSr6 extends Model implements AuthenticatableContract, JWTSubject
{
    use Authenticatable,
        HasPermissions,
        DefaultDatetimeFormat,
        HasFactory,
        Notifiable;

        

    protected $fillable = [
        'administrator_id',
        'dealers_in',
        'type',
        'name_of_applicant',
        'address',
        'premises_location',
        'years_of_expirience',
        'form_sr6_has_crops',
        'seed_grower_in_past',
        'cropping_histroy',
        'have_adequate_isolation',
        'have_adequate_labor',
        'aware_of_minimum_standards',
        'signature_of_applicant',
    ];

    public static function boot()
    {
        $user = Auth::user();
        
        parent::boot(); 

        self::creating(function($model){
            // code here            
        });

        self::created(function ($model) {
            // $user = Auth::user();
            // Mail::to($user)->send(new \App\Mail\SR6FormAdded($user));
        });
 
        self::updating(function($model){
            if(Admin::user()->isRole('basic-user') ){
                $model->status = 1;
                return $model;
            }
        });

        self::updated(function ($model) {
            // $user = Auth::user();
            // Mail::to($user)->send(new \App\Mail\SR6FormUpdated($user));
        });

        self::deleting(function ($model) {
            // $user = Auth::user();
            // Mail::to($user)->send(new \App\Mail\SR6FormDeleted($user));
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }

 
    public function form_sr6_has_crops()
    {
        return $this->hasMany(FormSr6HasCrop::class, 'form_sr6_id');
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
