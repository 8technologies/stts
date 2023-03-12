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
use Illuminate\Support\Facades\Notification;
use App\Notifications\SR4FormAddedNotification;
use DB;
use Encore\Admin\Auth\Database\Administrator;

class FormSr4 extends  Model implements AuthenticatableContract, JWTSubject
// class FormSr4 extends  Model
{
    use Authenticatable,
        // HasPermissions,
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

        self::created(function ($model) {
            $not = new MyNotification();
            $not->role_id = 2; 
            $not->message = 'New SR4 form has been added by '.Admin::user()->name.' '; 
            $not->link = admin_url("form-sr4s/{$model->id}"); 
            $not->status = 'Unread'; 
            $not->model = 'FormSr4';
            $not->model_id = $model->id; 
            $not->group_type = 'Group'; 
            $not->action_status_to_make_done = '[]'; 
            $not->save();  
        });

        self::updated(function ($m) {

        
            $notifications = MyNotification::where('model', 'FormSr4')
            ->where('model_id', $m->id) 
            ->get();
            foreach($notifications as $n){ 
                $n->delete();
            }
 
            //assigned status
            if($m->status == 2){
                $inspector  = Administrator::find($m->inspector);
                if($inspector != null){
                    $not = new MyNotification();
                    $not->receiver_id = $inspector->id; 
                    $not->message = "Dear {$inspector->name}, you have been assigned to inspect SR4 form #{$m->id}."; 
                    $not->link = admin_url("form-sr4s/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormSr4';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                } 
                $farmer  = Administrator::find($m->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your SR4 form #{$m->id} is now under inspection."; 
                    $not->link = admin_url("form-sr4s/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormSr4';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            //halted status for farmer
            if($m->status == 3){
                $farmer  = Administrator::find($m->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your SR4 form #{$m->id} has been halted by the inspector."; 
                    $not->link = admin_url("form-sr4s/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormSr4';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            //rejected status for farmer
            if($m->status == 4){
                $farmer  = Administrator::find($m->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your SR4 form #{$m->id} has been rejected by the inspector."; 
                    $not->link = admin_url("form-sr4s/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormSr4';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            //approved status for farmer
            if($m->status == 5){
                $farmer  = Administrator::find($m->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your SR4 form #{$m->id}/n has been approved by the inspector."; 
                    $not->link = admin_url("form-sr4s/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormSr4';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            

  
  
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
