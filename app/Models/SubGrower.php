<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Support\Facades\Mail;
use App\Mail\Notification;
use App\Models\PlantingReturn;


class SubGrower extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'planting_return_id',
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

     // Define the relationship with PlantingReturn
     public function plantingReturn() {
        return $this->belongsTo(PlantingReturn::class);
    }
       
    // Define the relationship with SR10s
    public function sr10s() {
        return $this->hasMany(FormSr10::class);
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
           
            $sub = SubGrower::where('field_name', $m->field_name)
                ->where('name', $m->name)->first();

            if ($sub != null) {
                return false;
            }

            $m->status = 1;
        

            return $m;
        });

        self::created(function ($model) {

            MyNotification::send_notification($model, 'SubGrower', request()->segment(count(request()->segments())));
               
        });
        


        self::updating(function ($sr10) {
         
        });

        self::updated(function ($sr10) {

            // ... code here
            MyNotification::update_notification($sr10, 'SubGrower', request()->segment(count(request()->segments())-1));

               //check if all the subgrowers with the same planting return id have been assigned to an inspector
            //check user role
            if (Admin::user()->isRole('admin')) {
                $subgrowers = SubGrower::where('planting_return_id', $sr10->planting_return_id)->get();
                $all_assigned = true;
                foreach ($subgrowers as $sub) {
                    if ($sub->inspector_id == null) {
                        $all_assigned = false;
                    }
                }
                //if all the subgrowers have been assigned to an inspector, change the status of the planting return to 2
                if ($all_assigned) {
                    $planting_return = PlantingReturn::find($sr10->planting_return_id);
                    $planting_return->status = 2;
                    $planting_return->save();
                }
            }


            if (Admin::user()->isRole('inspector')) 
            {

                $crop_var = CropVariety::find($sr10->crop);
                $crop = null;
                if ($crop_var != null) 
                {
                    if ($crop_var->crop != null) 
                    {
                        $crop = $crop_var->crop;
                    }
                }


                if ($crop != null) 
                {
                    if ($crop->crop_inspection_types != null) 
                    {
                        foreach ($crop->crop_inspection_types as $inspe) 
                        {
                            $temp_sr10_1 = FormSr10::where([
                                'planting_return_id' => $sr10->id,
                            ])->get();

                            $temp_sr10 = FormSr10::where([
                                'planting_return_id' => $sr10->id,
                                'stage' => $inspe->id,
                            ])->get();

                            if (count($temp_sr10) < 1) 
                            {
                                $d['crop_id'] = $crop->id;
                                $d['stage'] = $inspe->id;
                                $d['order_number'] = $inspe->order_number;
                                $d['farmer_id'] = $sr10->administrator_id;
                                $d['crop_variety_id'] = $sr10->crop;
                                $d['status'] = '1';

                                if (count($temp_sr10_1) < 1) {
                                    $d['is_active'] = 1;
                                } else {
                                    $d['is_active'] = 0;
                                }
                                $d['is_done'] = 0;
                                $d['is_initialized'] = false;
                                $d['status_comment'] = "";
                                $d['sub_grower_id'] = $sr10->id;
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
                } 
                else 
                {

                    $temp_sr10_1 = FormSr10::where([
                        'planting_return_id' => $sr10->id,
                    ])->get();

                    $temp_sr10 = FormSr10::where([
                        'planting_return_id' => $sr10->id,
                    ])->get();

                    if (count($temp_sr10) < 1) 
                    {
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
