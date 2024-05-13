<?php

namespace App\Models;

use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use phpDocumentor\Reflection\Types\This;
use Encore\Admin\Form;


class SeedLab extends Model
{

    use ModelTree, AdminBuilder;

    protected $table = 'seed_labs';

    protected $appends = [
        'crop_variety_text'
    ];

    protected $fillable = [
        'administrator_id',
        'crop_variety_id',
        'form_stock_examination_request_id',
        'collection_date',
        'payment_receipt',
        'applicant_remarks',
        'sampling_date',
        'sample_weight',
        'packaging',
        'number_of_units',
        'mother_lot',
        'sample_condition',
        'inspector_remarks',
        'tests_required',
        'lab_technician_id', 
        'purity',
        'germination_capacity',
        'abnormal_sprouts',
        'broken_germs',
        'report_recommendation',
        'inspector_id',
        'inspector_is_done',
        'status',
        'lot_number',
        'receptionist_is_done',
        'receptionist_remarks',
        'lab_test_number',
        'lab_technician',
        'p_x_g',
        'parent_id',
        'order',
        'title',
        'temp_parent',
        'inert_matter',
        'other_crop_seeds',
        'weed_seed',
        'first_count',
        'final_count',
        'hard',
        'fresh',
        'dead',
        'moisture'

    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        //        $this->setParentColumn('mother_lot');
        //        $this->setOrderColumn('id');
        $this->setTitleColumn('mother_lot');
    }


    public function getCropVarietyTextAttribute()
    {
        if ($this->crop_variety == null) 
        {
            return "";
        }
        return $this->crop_variety->name;
    }

    
    public function user()
    {
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }


    public static function boot()
    {
        parent::boot();

        /*
        static::updated(function ($m) {
            $u = Admin::user();

            $form = new Form(new SeedLab());

            if ($u != null) {
                if ($u->isRole('lab-technician')) {
                    if ($m->status == 11) {

                      $stock_out = new MarketableSeed();
                        $stock_out->administrator_id = $m->administrator_id;
                        $stock_out->crop_variety_id = $m->crop_variety_id;
                        $stock_out->seed_label_id = $m->seed_label_id;
                        $stock_out->lot_number = $m->lot_number;
                        $stock_out->quantity = (-1) * ($form->quantity);
                        $stock_out->seed_class = $m->seed_class;
                        $stock_out->source = $m->source;
                        $stock_out->detail = $form->detail;
                        $stock_out->is_deposit = 0;
                        $stock_out->seed_label_package_id = $m->seed_label_package_id;
                        $stock_out->lab_test_number = $form->lab_test_number; 
    
                        $stock_out->save();

                        
                        // die("jhvghfvjbkl;");
                    }
                }
            }
            // die("simple tezt");
        });
*/
            self::created(function ($model) 
            {

                MyNotification::send_notification($model, 'SeedLab', request()->segment(count(request()->segments())));

                $stock_examination = FormStockExaminationRequest::find($model->form_stock_examination_request_id);
                if ($stock_examination != null) {
                    $model->quantity = $stock_examination->yield;
                    $model->crop_variety_id = $stock_examination->crop_variety_id;
                    $model->save();
                }

                
                
            });


            self::updated(function ($model) {
                 

                MyNotification::update_notification($model, 'SeedLab', request()->segment(count(request()->segments())-1));

                

            });

        static::creating(function ($m) {
            $crop_variety_id = 1;
            $form = FormStockExaminationRequest::find($m->form_stock_examination_request_id);
            if ($form != null) {
                $crop_variety_id = $form->crop_variety_id;
            }
            $m->crop_variety_id = $crop_variety_id;
            return $m;
        });
    }

    public function crop_variety()
    {
        // $c = CropVariety::find($this->crop_variety_id);
        // if ($c == null) {
        //     $this->crop_variety_id = 1;
        //     $this->save();
        // }
        return $this->belongsTo(CropVariety::class);
    }



    use HasFactory;
}
