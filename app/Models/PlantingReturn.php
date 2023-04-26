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
        // /home/technolo/stts-dev2/storage/app/public/
        //dd(public_path($m->sub_growers_file));
        // './uploads/'
        $file = null;
        if ($m != null) {
            if (strlen($m->sub_growers_file) > 3) {
                if (file_exists('./uploads/'.$m->sub_growers_file)) {
                    $file = './uploads/'.$m->sub_growers_file;
                }else{
    
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

            //dd('done ');
            //$m->sub_growers_file = null;
            //$m->save();
            //unlink($file);
        }
    }

    public static function boot()
    {
        parent::boot();


        self::creating(function ($model) {
              
        });

        self::created(function ($m) {

            Utils::send_notification($m, 'PlantingReturn', request()->segment(count(request()->segments())));
        
            self::import_sub_growers($m);
            return $m;
            //created
        });

        self::updating(function ($model) { 
        });

        self::updated(function ($m) {
            Utils::update_notification($m, 'PlantingReturn', request()->segment(count(request()->segments())-1));
  

            $file = null;
            if ($m != null) {
                if (strlen($m->sub_growers_file) > 3) {
                    if (file_exists('./uploads/' . $m->sub_growers_file)) {
                        $file = './uploads/' . $m->sub_growers_file;
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