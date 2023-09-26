<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Auth\Database\Administrator;
use App\Mail\Notification;

class MyNotification extends Model
{
    use HasFactory;

    protected $fillable = 
    [
        'receiver_id',
        'role_id',
        'message',
        'form_link',
        'link',
        'status',
        'model',
        'model_id',
    ];

//relationship between notification and user
    public function receiver()
    {
        return $this->belongsTo(Administrator::class, 'receiver_id');
    }


//function to get notification and send it to the front end
public static function get_notifications($user)
    {
        if ($user == null) {
            return [];
        }

        $done_ids = [];
        $notifications = MyNotification::where('receiver_id', $user->id)
            ->orderBy('id', 'desc')
            ->get()
            ->unique('id')
            ->values();

        foreach ($notifications as $notification) {
            $done_ids[] = $notification->id;
        }

        foreach ($user->roles as $role) {
            $roleNotifications = MyNotification::where('role_id', $role->id)
                ->orderBy('id', 'desc')
                ->get()
                ->unique('id')
                ->values();

            foreach ($roleNotifications as $notification) {
                if (in_array($notification->id, $done_ids)) {
                    continue;
                }
                $done_ids[] = $notification->id;
                $notifications->push($notification);
            }
        }

        return $notifications;
    }
    
//function to send notifications after creation
    public static function send_notification($model, $model_name, $entity)
    {
        //check if $entity is a string
        if(is_string($entity))
        {
            $notification = new MyNotification();
            $notification->role_id = 2;
            $notification->message =  "New {$entity} has been submitted by ".Admin::user()->name.' ';
            $notification->link = admin_url("auth/login"); 
            $notification->form_link = admin_url("{$entity}/{$model->id}/edit");
            $notification->status = 'Unread'; 
            $notification->model = $model_name;
            $notification->model_id = $model->id; 
            $notification->save();

            //self::sendMail($notification); 
        }

    }

//function to send notifications after an update
public static function update_notification($model, $model_name, $entity)
{
    $notifications = MyNotification::where('model', $model_name)
        ->where('model_id', $model->id)
        ->get();
    
    $name = Administrator::find($model->administrator_id)->name;

    $notificationData = [
        '2' => [
            'message_inspector' => "You have been assigned to inspect {$entity}.",
            'message' => "Dear {$name}, your {$entity} has been assigned to an inspector.",
            'receiver_inspector_id' => $model->inspector_id,
            'receiver_id' => $model->administrator_id,
            'form_link' => admin_url("{$entity}/{$model->id}"),
        ],
        '1' => [
            'message' =>  "{$name} 's form has been edited for renewal.",
            'role_id' => 2,
            'receiver_id' => null,
            'form_link' => admin_url("{$entity}/{$model->id}/edit"),
        ],
        '3' => [
            'message' => "Dear {$name}, your {$entity} has been halted by the commissioner.",
            'receiver_id' =>$model->administrator_id,
            'form_link' => admin_url("{$entity}/{$model->id}/edit"),
        ],
        '4' => [
            'message' => "Dear {$name}, your {$entity} has been rejected by the inspector.",
            'receiver_id' => $model->administrator_id,
            'form_link' => admin_url("{$entity}/{$model->id}"),
        ],
        '5' => [
            'message' => "Dear {$name}, your {$entity} has been accepted by the commissioner.",
            'receiver_id' => $model->administrator_id,
            'form_link' => admin_url("{$entity}/{$model->id}"),
        ],
    
        '18' => [
            'message' => "{$name} 's form has been recommended by the inspector.",
            'role_id' => 2,
            'receiver_id' => null,
            'form_link' => admin_url("{$entity}/{$model->id}"),
        ],
        ];

    foreach ($notifications as $notification) {
        $notification->delete();
    }

    foreach ($notificationData as $status => $data) {
        if ($model->status == $status) {

            if ($status == '2') {
              
                $receiver_inspector = Administrator::find($data['receiver_inspector_id']);
                $message_inspector = str_replace('{name}', $receiver_inspector->name, $data['message_inspector']);

                $notification_inspector = new MyNotification();
                $notification_inspector->receiver_id = $receiver_inspector->id;
                $notification_inspector->message = $message_inspector;
                $notification_inspector->link = admin_url("auth/login");
                $notification_inspector->form_link = $data['form_link'];
                $notification_inspector->status = 'Unread';
                $notification_inspector->model = $model_name;
                $notification_inspector->model_id = $model->id;
                $notification_inspector->save();

              //  self::sendMail($notification_inspector);
            }
            
            if($data['receiver_id'] != null){
            $receiver = Administrator::find($data['receiver_id']);
            $message = str_replace('{name}', $receiver->name, $data['message']);
            } else {
                $receiver = null;
                $message = $data['message'];
            }
            $link = $data['form_link'];

            $notification = new MyNotification();
            $notification->receiver_id = $receiver->id ?? null;
            $notification->role_id = $data['role_id'] ?? null;
            $notification->message = $message;
            $notification->link = admin_url("auth/login");
            $notification->form_link = $link;
            $notification->status = 'Unread';
            $notification->model = $model_name;
            $notification->model_id = $model->id;

            $notification->save();

          //  self::sendMail($notification);
        }
    }
}

    
//get notification receipients by either role or id
    public static function get_users_by_role($role_id)
    {
        $admin= Administrator::whereHas('roles', function ($query) use ($role_id) {
            $query->where('admin_role_users.role_id', $role_id);
        })->get();

        return $admin;
    }

    public static function get_users_by_id($receiver_id)
    {
        $users= Administrator::with('notifications')
            ->where('id', $receiver_id)
            ->get();

            return $users;
    }
    
 //send an email notification
    public static function sendMail($notification)
    {
        if($notification->receiver_id != null)
        { 
            $receivers = self::get_users_by_id($notification->receiver_id);
                
        } else
        {
            $receivers = self::get_users_by_role($notification->role_id);
        error_log($receivers);
        }

        if ($receivers->isEmpty()) {
            return "No receivers found."; // Return an error message
        }

        $emails = $receivers->pluck('email')->toArray();
        error_log(json_encode($emails));

     

        try 
        {
           Mail::to($emails)->send(new Notification($notification->message, $notification->link));
        } catch (\Exception $e) {
            // Handle the exception 
            return "Email sending failed: " . $e->getMessage();
        }
        return "Email sent successfully.";
        

    }



}