<?php

namespace App\Models;

use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Auth\Database\Administrator;

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

        self::created(function ($model) {
            $not = new MyNotification();
            $not->role_id = 2; 
            $not->message = 'New Qds form has been added by '.Admin::user()->name.' '; 
            $not->link = admin_url("form-sr6s/{$model->id}"); 
            $not->status = 'Unread'; 
            $not->model = 'FormQds';
            $not->model_id = $model->id; 
            $not->group_type = 'Group'; 
            $not->action_status_to_make_done = '[]'; 
            $not->save();  
        });

        self::updated(function ($m) {

        
            $notifications = MyNotification::where('model', 'FormQds')
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
                    $not->message = "Dear {$inspector->name}, you have been assigned to inspect Qds form #{$m->id}."; 
                    $not->link = admin_url("form-qds/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormQds';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                } 
                $farmer  = Administrator::find($m->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your Qds form #{$m->id} is now under inspection."; 
                    $not->link = admin_url("form-qds/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormQds';
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
                    $not->message = "Dear {$farmer->name}, your Qds form #{$m->id} has been halted by the inspector."; 
                    $not->link = admin_url("form-qds/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormQds';
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
                    $not->message = "Dear {$farmer->name}, your Qds form #{$m->id} has been rejected by the inspector."; 
                    $not->link = admin_url("form-qds/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormQds';
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
                    $not->message = "Dear {$farmer->name}, your Qds form #{$m->id}/n has been approved by the inspector."; 
                    $not->link = admin_url("form-qds/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'FormQds';
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

 
    