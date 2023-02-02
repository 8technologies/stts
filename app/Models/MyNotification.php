<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;

class MyNotification extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot(); 
        self::created(function($m){
            if($m->group_type == 'Group'){
                $receivers = Utils::get_users_by_role($m->role_id);
                $emails = [];
                $emails[] = 'amokolpriscilla@gmail.com';
                foreach($receivers as $r){
                    $emails[] = $r->email;
                } 
                  
                Mail::send('email_view',['msg' => $m->message,'link' => $m->link], function ($m) use ($emails) {
                    $m->from("info@8technologies.store", 'MAII..');
                    $m->to($emails)->subject('STTS ...');
                }); 
            } 
        });

    }
//mark as unread notifications
    public function markAsUnread()
    {
        $this->action_status_to_make_done = null;
        $this->save();
    }
    public function markAsRead()
    {
        $this->action_status_to_make_done = now();
        $this->save();
    }

    public function receiver(){
        $this->belongsTo(AdminModel::class);
    }
}
