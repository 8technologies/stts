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
        'seed_class',
        'lot_number',
        'source_of_seed',
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
        'status',
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

        self::creating(function ($m) 
        {
           
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
        


        self::updating(function ($model) {
         
        });

        self::updated(function ($model) 
        {

           MyNotification::update_notification($model, 'SubGrower', request()->segment(count(request()->segments())));

            //check if all the subgrowers with the same planting return id have been assigned to an inspector
            //check user role
            if ($model->status == 2) 
            {
                $subgrowers = SubGrower::where('planting_return_id', $model->planting_return_id)->get();
                $all_assigned = true;
                foreach ($subgrowers as $subgrower) {
                    if ($subgrower->inspector_id == null) {
                        $all_assigned = false;
                    }
                }
                //if all the subgrowers have been assigned to an inspector, change the status of the planting return to 2
                if ($all_assigned) {
                    $planting_return = PlantingReturn::find($model->planting_return_id);
                    //check if the planting return exists
                    if ($planting_return == null) {
                        return;
                    }
                    $planting_return->status = 2;
                    $planting_return->save();
                }
            }

            if ($model->status == 16) 
            {
                // Find the CropVariety based on the $sr10->variety
                $cropVariety = CropVariety::find($model->variety);
                $crop = null;

                // If CropVariety exists and it has a related Crop
                if ($cropVariety !== null && $cropVariety->crop !== null) {
                    $crop = $cropVariety->crop;
                }

                // Check if $crop is not null and has inspection types
                if ($crop !== null && $crop->crop_inspection_types !== null) 
                {
    
                    foreach ($crop->crop_inspection_types as $inspectionType) {
                        // Check if FormSr10 doesn't exist for the current stage
                        if (FormSr10::where('planting_return_id', $model->id)
                                    ->where('stage', $inspectionType->id)
                                    ->doesntExist()) {
                            $newFormSr = new FormSr10([
                                'stage' => $inspectionType->id,
                                'order_number' => $inspectionType->order_number,
                                'farmer_id' => $model->administrator_id,
                                'crop_variety_id' => $model->variety,
                                'status' => '1',
                                'is_active' => FormSr10::where('planting_return_id', $model->id)->doesntExist() ? 1 : 0,
                                'is_done' => 0,
                                'is_initialized' => false,
                                'status_comment' => '',
                                'planting_return_id' => $model->id,
                                'administrator_id' => $model->administrator_id,
                                'inspector' => Admin::user()->id,
                                'min_date' => Carbon::parse($inspectionType->date_planted)
                                                    ->addDays($inspectionType->period_after_planting)
                                                    ->toDateString(),
                            ]);

                            $newFormSr->save();
                            $model->status = 16;
                            $model->variety = $model->variety;
                            $model->save();
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
