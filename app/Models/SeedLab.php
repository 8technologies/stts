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
        'form_stock_examination_request_id',
        'collection_date',
        'payment_receipt',
        'applicant_remarks'
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
        $c = CropVariety::find($this->crop_variety_id);
        if ($c == null) {
            $this->crop_variety_id = 1;
            $this->save();
        }
        return $this->belongsTo(CropVariety::class);
    }



    use HasFactory;
}
