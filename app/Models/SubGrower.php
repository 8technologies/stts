<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Auth\Database\Administrator;


class SubGrower extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'name',
        'size',
        'crop',
        'variety',
        'field_name', 
        'district',
        'subcourty',
        'village',
        'planting_date',
        'quantity_planted',
        'expected_yield',
        'phone_number',
        'gps_latitude',
        'gps_longitude',
        'detail',
    ];

    public function get_crop_name()
    {
        $id = (int)($this->crop);

        if ($id > 0) {
            $c = CropVariety::find($id);
            if ($c != null) {
                return $c->crop->name . ", " . $c->name;
            }
        }

        return $this->crop;
    }

    public function get_crop()
    {
        $id = (int)($this->crop);
        $c = Crop::find(1);
        if ($id > 0) {
            $c = Crop::find($id);
            if ($c != null) {
                return $c->name;
            } else {
                $c = Crop::find(1);
            }
        }

        return $c;
    }

    public static function boot()
    {
        parent::boot();

        self::creating(function ($m) {
            $not = new MyNotification();
            $not->role_id = 2; 
            $not->message = 'New Sub-grower form has been added by '.Admin::user()->name.' '; 
            $not->link = admin_url("sub-growers/{$m->id}"); 
            $not->status = 'Unread'; 
            $not->model = 'SubGrower';
            $not->model_id = $m->id; 
            $not->group_type = 'Group'; 
            $not->action_status_to_make_done = '[]'; 
            $not->save();

            $sub = SubGrower::where('field_name', $m->field_name)
                ->where('name', $m->name)->first();

            if ($sub != null) {
                return false;
            }

            $m->status = 1;
            $m->inspector = 0;

            return $m;
        });

        self::created(function ($model) {
            //created
        });

        self::updating(function ($sr10) {
            //$sr10->status = 16;
        });

        self::updated(function ($sr10) {

            // ... code here
            $notifications = MyNotification::where('model', 'SubGrower')
            ->where('model_id', $sr10->id) 
            ->get();
            foreach($notifications as $n){ 
                $n->delete();
            }
 
            //assigned status
            if($sr10->status == 2){
                $inspector  = Administrator::find($sr10->inspector);
                if($inspector != null){
                    $not = new MyNotification();
                    $not->receiver_id = $inspector->id; 
                    $not->message = "Dear {$inspector->name}, you have been assigned to inspect Sub-grower form #{$sr10->id}."; 
                    $not->link = admin_url("sub-growers/{$sr10->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'SubGrower';
                    $not->model_id = $sr10->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                } 
                $farmer  = Administrator::find($sr10->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your Sub-grower form #{$sr10->id} is now under inspection."; 
                    $not->link = admin_url("sub-growers/{$sr10->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'SubGrower';
                    $not->model_id = $sr10->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            //halted status for farmer
            if($sr10->status == 3){
                $farmer  = Administrator::find($sr10->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your Sub-grower form #{$sr10->id} has been halted by the inspector."; 
                    $not->link = admin_url("sub-growers/{$sr10->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'SubGrower';
                    $not->model_id = $sr10->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            //rejected status for farmer
            if($sr10->status == 4){
                $farmer  = Administrator::find($sr10->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your Sub-grower form #{$sr10->id} has been rejected by the inspector."; 
                    $not->link = admin_url("sub-growers/{$sr10->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'SubGrower';
                    $not->model_id = $sr10->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }

            //approved status for farmer
            if($sr10->status == 5){
                $farmer  = Administrator::find($sr10->administrator_id);
                if($farmer != null){
                    $not = new MyNotification();
                    $not->receiver_id = $farmer->id; 
                    $not->message = "Dear {$farmer->name}, your Sub-grower form #{$sr10->id}/n has been approved by the inspector."; 
                    $not->link = admin_url("sub-growers/{$sr10->id}"); 
                    $not->status = 'Unread'; 
                    $not->model = 'SubGrower';
                    $not->model_id = $sr10->id; 
                    $not->group_type = 'Individual'; 
                    $not->action_status_to_make_done = '[]'; 
                    $not->save();  
                }
            }


            if (Admin::user()->isRole('inspector')) {
                $id = (int)($sr10->crop);

                $crop_var = CropVariety::find($sr10->crop);
                $crop = null;
                if ($crop_var != null) {
                    if ($crop_var->crop != null) {
                        $crop = $crop_var->crop;
                    }
                }


                if ($crop != null) {
                    if ($crop->crop_inspection_types != null) {
                        foreach ($crop->crop_inspection_types as $key => $inspe) {

                            $temp_sr10_1 = FormSr10::where([
                                'planting_return_id' => $sr10->id,
                            ])->get();

                            $temp_sr10 = FormSr10::where([
                                'planting_return_id' => $sr10->id,
                                'stage' => $inspe->inspection_stage,
                            ])->get();

                            if (count($temp_sr10) < 1) {
                                $d['stage'] = $inspe->inspection_stage;
                                $d['farmer_id'] = $sr10->administrator_id;
                                $d['status'] = '1';

                                if (count($temp_sr10_1) < 1) {
                                    $d['is_active'] = 1;
                                } else {
                                    $d['is_active'] = 0;
                                }


                                $d['is_done'] = 0;
                                $d['is_initialized'] = false;
                                $d['status_comment'] = "";
                                $d['planting_return_id'] = $sr10->id;
                                $d['administrator_id'] = $sr10->administrator_id;
                                $d['inspector'] =  Admin::user()->id;
                                $date_planted = Carbon::parse($inspe->date_planted);
                                $date_planted->addDays($inspe->period_after_planting);
                                $toDateString = $date_planted->toDateString();
                                $d['min_date'] = $toDateString;
                                $new_form_sr = new FormSr10($d);
                                $new_form_sr->save();
                                $sr10->status = 16;
                                $sr10->save();
                            }
                        }
                    }
                } else {

                    $temp_sr10_1 = FormSr10::where([
                        'planting_return_id' => $sr10->id,
                    ])->get();

                    $temp_sr10 = FormSr10::where([
                        'planting_return_id' => $sr10->id,
                    ])->get();

                    if (count($temp_sr10) < 1) {
                        $d['stage'] = 'Default inspection';
                        $d['is_active'] = 1;
                        $d['farmer_id'] = $sr10->administrator_id;
                        $d['status'] = '1';
                        $d['is_done'] = 0;
                        $d['is_initialized'] = false;
                        $d['status_comment'] = "";
                        $d['planting_return_id'] = $sr10->id;
                        $d['administrator_id'] = $sr10->administrator_id;
                        $d['inspector'] =  Admin::user()->id;
                        $date_planted = Carbon::parse(time());
                        $date_planted->addDays(1);
                        $toDateString = $date_planted->toDateString();
                        $d['min_date'] = $toDateString;
                        $new_form_sr = new FormSr10($d);
                        $new_form_sr->save();
                        $sr10->status = 16;
                        $sr10->save();
                    }
                }
            }
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
