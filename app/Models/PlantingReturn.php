<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Auth\Database\Administrator;

use Excel;

class PlantingReturn extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'name',
        'address', 
        'telephone', 
        'amount_enclosed',
        'payment_receipt', 
        'registerd_dealer',
        'sub_growers_file', 
    ];


    public static function import_sub_growers($m)
    {


        $file = null;
        if ($m != null) {
            if (strlen($m->sub_growers_file) > 3) {
                if (file_exists('./public/storage/uploads/' . $m->sub_growers_file)) {
                    $file = './public/storage/uploads/' . $m->sub_growers_file;
                }
            }
        }

        if ($file == null) {
            return;
        }


        if ($file != null) {
            $array = Excel::toArray([], $file);
            $i = 0;
            foreach ($array[0] as $key => $value) {
                $i++;
                if ($i <= 1) {
                    continue;
                }
                if (count($value) > 11) {
                    $sub = new SubGrower();

                    if (isset($value[0]))
                        if ($value[0] != null) {
                            if (strlen($value[0]) > 1) {
                                $sub->field_name = $value[0];
                            }
                        }


                    if ($value[1] != null) {
                        if (strlen($value[1]) > 2) {
                            $sub->name = $value[1];
                        }
                    }


                    if (isset($value[2])) {
                        if ($value[2] != null) {
                            $sub->size = $value[2];
                        }
                    }

                    if (isset($value[3]))
                        if ($value[3] != null) {
                            if (strlen($value[3]) > 2) {
                                $sub->crop = $value[3];
                            }
                        }

                    if (isset($value[4]))
                        if ($value[4] != null) {
                            if (strlen($value[4]) > 2) {
                                $sub->variety = $value[4];
                            }
                        }

                    if (isset($value[5]))
                        if ($value[5] != null) {
                            if (strlen($value[5]) > 2) {
                                $sub->planting_date = $value[5];
                            }
                        }

                    if (isset($value[1]))
                        if ($value[1] != null) {
                            if (strlen($value[1]) > 2) {
                                $sub->quantity_planted = $value[6];
                            }
                        }

                    if (isset($value[7]))
                        if ($value[7] != null) {
                            if (strlen($value[7]) > 2) {
                                $sub->expected_yield = $value[7];
                            }
                        }


                    if (isset($value[8]))
                        if ($value[8] != null) {
                            if (strlen($value[8]) > 3) {
                                $sub->phone_number = $value[8];
                            }
                        }


                    if (isset($value[9]))
                        if ($value[9] != null) {
                            if (strlen($value[9]) > 1) {
                                $sub->gps_latitude = $value[9];
                            }
                        }

                    if (isset($value[10])) {
                        if ($value[10] != null) {
                            if (strlen($value[10]) > 2) {
                                $sub->gps_longitude = $value[10];
                            }
                        }
                    }

                    if (isset($value[11])) {
                        if ($value[11] != null) {
                            if (strlen($value[11]) > 2) {
                                $sub->district = $value[11];
                            }
                        }
                    }

                    if (isset($value[12])) {
                        if ($value[12] != null) {
                            if (strlen($value[12]) > 2) {
                                $sub->subcourty = $value[12];
                            }
                        }
                    }

                    if (isset($value[13])) {
                        if ($value[13] != null) {
                            if (strlen($value[13]) > 2) {
                                $sub->village = $value[13];
                            }
                        }
                    }
                    
                    $sub->administrator_id = $m->administrator_id;
                    $sub->save();
                }
            }


            $m->sub_growers_file = null;
            $m->save();
            unlink($file);
        }
    }

    public static function boot()
    {
        parent::boot();


        self::creating(function ($model) {
            $not = new MyNotification();
            $not->role_id = 2; 
            $not->message = 'New Planting Return form has been added by '.Admin::user()->name.' '; 
            $not->link = admin_url("planting-returns/{$model->id}"); 
            $not->status = 'Unread'; 
            $not->model = 'PlantingReturn';
            $not->model_id = $model->id; 
            $not->group_type = 'Group'; 
            $not->action_status_to_make_done = '[]'; 
            $not->save();  
        });

        self::created(function ($m) {
            $file = null;
            if ($m != null) {
                if (strlen($m->sub_growers_file) > 3) {
                    if (file_exists('./public/storage/uploads/' . $m->sub_growers_file)) {
                        $file = './public/storage/uploads/' . $m->sub_growers_file;
                    } else {
                        $m->sub_growers_file = null;
                        $m->save();
                        return;
                    }
                } else {
                    return $m;
                }
            } else {
                return $m;
            }

            if ($file == null) {
                return $m;
            }
            self::import_sub_growers($m);
            return $m;
            //created
        });

        self::updating(function ($model) { 
        });

        self::updated(function ($m) {
            $notifications = MyNotification::where('model', 'PlantingReturn')
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
                    $not->message = "Dear {$inspector->name}, you have been assigned to inspect Planting Return form #{$m->id}."; 
                    $not->link = admin_url("planting-returns/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'PlantingReturn';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                } 
                $farmer  = Administrator::find($m->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your Planting Return form #{$m->id} is now under inspection."; 
                    $not->link = admin_url("planting-returns/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'PlantingReturn';
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
                    $not->message = "Dear {$farmer->name}, your Planting Return form #{$m->id} has been halted by the inspector."; 
                    $not->link = admin_url("planting-returns/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'PlantingReturn';
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
                    $not->message = "Dear {$farmer->name}, your Planting Return form #{$m->id} has been rejected by the inspector."; 
                    $not->link = admin_url("planting-returns/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'PlantingReturn';
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
                    $not->message = "Dear {$farmer->name}, your Planting Return form #{$m->id}/n has been approved by the inspector."; 
                    $not->link = admin_url("planting-returns/{$m->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'PlantingReturn';
                    $not->model_id = $m->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            $file = null;
            if ($m != null) {
                if (strlen($m->sub_growers_file) > 3) {
                    if (file_exists('./public/storage/uploads/' . $m->sub_growers_file)) {
                        $file = './public/storage/uploads/' . $m->sub_growers_file;
                    } else {
                        $m->sub_growers_file = null;
                        $m->save();
                        return;
                    }
                } else {
                    return $m;
                }
            } else {
                return $m;
            }

            if ($file == null) {
                return $m;
            }
            self::import_sub_growers($m);
            // ... code here
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }

    public function form_sr10s()
    {
        return $this->hasMany(FormSr10::class);
    }

    public function planting_return_crops()
    {
        return $this->hasMany(PlantingReturnCrop::class);
    }

    public function crop()
    {
        return $this->belongsTo(Crop::class);
    }
}