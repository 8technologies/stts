<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;
use App\Mail\Notification;
use Encore\Admin\Grid\Tools\Selector;

class MyNotification extends Model
{
    use HasFactory;

    private $entity;
    //create constructor with parameter entity
    public function __construct($entity = null)
    {
        $this->entity = $entity;
    }

    public static function booted()
    {
        //parent::boot();
        static::saved(function($m){
            // if($m->group_type == 'Group'){
            //     $receivers = Utils::get_users_by_role($m->role_id);
            //     $emails = [];
            //     $emails[] = '';
            //     foreach($receivers as $r){
            //         $emails[] = $r->email;
            //     } 
                  
            //     // Mail::send('email_view',['msg' => $m->message,'link' => $m->link], function ($m) use ($emails) {
            //     //     $m->from("info@8technologies.store", 'MAII..');
            //     //     $m->to($emails)->subject('FORM SR4 STATUS UPDATE ');
            //      // }); 
              
            //         Mail::to($emails)
            //             ->queue(new Notification($m->message,$m->link));
                
            // } 
        });

    }
}
