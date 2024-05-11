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
        'inspector_id',
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

            MyNotification::send_notification($model, 'FormCropDeclaration', request()->segment(count(request()->segments())));

            
            
        });


        self::updated(function ($model) 
        {

            MyNotification::update_notification($model, 'FormCropDeclaration', request()->segment(count(request()->segments())-1));  
            
            $user = Admin::user() ? Admin::user() : auth('api')->user();

            if ($model->status == 16) {
                // Iterate over crop_varieties associated with the model
                $model->crop_varieties->each(function ($cropVariety) use ($model) {
                    // Check if crop has inspection types
                    if ($cropVariety->crop->crop_inspection_types !== null) {
                        // Iterate over inspection types
                        foreach ($cropVariety->crop->crop_inspection_types as $inspection) {
                            // Check if FormSr10 for this crop variety and stage doesn't exist
                            if (!FormSr10::where('qds_declaration_id', $model->id)
                                         ->where('crop_variety_id', $cropVariety->id)
                                         ->where('stage', $inspection->id)
                                         ->exists()) {
                                // Create a new FormSr10 instance
                                $newFormSr = new FormSr10([
                                    'crop_variety_id' => $cropVariety->id,
                                    'stage' => $inspection->id,
                                    'order_number' => $inspection->order_number,
                                    'farmer_id' => $model->administrator_id,
                                    'status' => '1',
                                    'is_active' => FormSr10::where('qds_declaration_id', $model->id)
                                                            ->where('crop_variety_id', $cropVariety->id)
                                                            ->doesntExist() ? 1 : 0,
                                    'is_done' => 0,
                                    'is_initialized' => false,
                                    'status_comment' => "",
                                    'qds_declaration_id' => $model->id,
                                    'administrator_id' => $model->administrator_id,
                                    'inspector' =>  $model->administrator_id,
                                    'min_date' => Carbon::parse($inspection->date_planted)
                                                         ->addDays($inspection->period_after_planting)
                                                         ->toDateString(),
                                ]);
            
                                // Save the new FormSr10 instance
                                $newFormSr->save();
            
                                // Update the status of the model
                                $model->status = 16;
                                $model->save();
                            }
                        }
                    } else {
                        // Update the status of the model to 5 if crop has no inspection types
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
