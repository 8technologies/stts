<?php

namespace App\Models;
use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use function PHPUnit\Framework\isEmpty;

class FormCropDeclaration extends Model
{
    use HasFactory;

    protected $fillable = [
        'administrator_id',
        'field_size',
        'source_of_seed',
        'seed_rate',
        'amount',
        'status',
        'payment_receipt',
        'form_qd_id',
    ];

    public static function boot()
    {
        parent::boot(); 

        self::creating(function($model){
            
        });
 
        self::updating(function($model){
        });

        self::created(function ($model) 
        {

            Utils::send_notification($model, 'SeedLab', request()->segment(count(request()->segments())));

            
            
        });


        self::updated(function ($model) 
        {

            Utils::update_notification($model, 'SeedLab', request()->segment(count(request()->segments())-1));  
            
            if (Admin::user()->isRole('inspector')) 
            {
               $model->crop_varieties->each(function ($crop_variety) use ($model) {
                if ($crop_variety->crop->crop_inspection_types != null) 
                {
                    foreach ($crop_variety->crop->crop_inspection_types as $key => $inspection) 
                    {
                        $temp_sr10_1 = FormSr10::where([
                            'qds_declaration_id' => $model->id,
                        ])->get();

                        $temp_sr10 = FormSr10::where([
                            'qds_declaration_id' => $model->id,
                            'stage' => $inspection->inspection_stage,
                        ])->get();

                        if (count($temp_sr10) < 1) 
                        {
                            $d['crop_variety_id'] = $crop_variety->id;
                            $d['stage'] = $inspection->inspection_stage;
                            $d['farmer_id'] = $model->administrator_id;
                            $d['status'] = '1';

                            if (count($temp_sr10_1) < 1) {
                                $d['is_active'] = 1;
                            } else {
                                $d['is_active'] = 0;
                            }
                            $d['is_done'] = 0;
                            $d['is_initialized'] = false;
                            $d['status_comment'] = "";
                            $d['qds_declaration_id'] = $model->id;
                            $d['administrator_id'] = $model->administrator_id;
                            $d['inspector'] =  Admin::user()->id;
                            $date_planted = Carbon::parse($inspection->date_planted);
                            $date_planted->addDays($inspection->period_after_planting);
                            $toDateString = $date_planted->toDateString();
                            $d['min_date'] = $toDateString;       
                            $new_form_sr = new FormSr10($d);
                            $new_form_sr->save();
                        } 
                    }
                }
                else
                {
                    $model->status = 5;
                    $model->save();
                }
               });

            }           

        });
 
    }

    
    public function form_crop_declarations_has_crop_varieties()
    {
        return $this->hasMany(FormCropDeclarationsHasCropVariety::class);
    }

    public function crop_varieties()
    {
        return $this->belongsToMany(CropVariety::class, 'form_crop_declarations_has_crop_varieties');
    }
}
