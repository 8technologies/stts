<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubGrower extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();

        self::creating(function ($m) {
            $sub = SubGrower::where('filed_name', $m->filed_name)
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
        });

        self::updated(function ($sr10) {
            // ... code here

 
            if (Admin::user()->isRole('inspector')) {
                $crop = Crop::find($sr10->crop);
                
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
                                
                                if(count($temp_sr10_1) < 1){
                                    $d['is_active'] = 1;
                                }else{
                                    $d['is_active'] = 0;
                                }
                               

                                $d['is_done'] = 0;
                                $d['is_initialized'] = false;
                                $d['status_comment'] = "";
                                $d['planting_return_id'] = $sr10->id;
                                $d['administrator_id'] = $sr10->inspector;
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
