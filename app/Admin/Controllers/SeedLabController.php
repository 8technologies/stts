<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\FormStockExaminationRequest;
use App\Models\MarketableSeed;
use App\Models\ImportExportPermitsHasCrops;
use App\Models\SeedLab;
use App\Models\StockRecord;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Facades\Auth;


class SeedLabController extends AdminController
{
    /** 
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Seed sample analysis';

    /**
     * Make a grid builder.
     *
     * @return Grid 
     */
    protected function grid()
    {

  
        $grid = new Grid(new SeedLab());
         //organise the grid in ascending order
         $grid->model()->orderBy('id', 'desc');
         $grid->disableExport();
        //enable filter by name
        $grid->filter(function($search_param)
        {
            $search_param->disableIdfilter();
            $search_param->like('lot_number', __("Search by lot number"));
        });

        //grid options for basic user
        if (Admin::user()->isRole('basic-user')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);

            $grid->actions(function ($actions) 
            {
                $status = ((int)(($actions->row['status'])));
                if ($status != 1 )
                {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            });
        } 
        
        //grid options for inspector 
        elseif (Admin::user()->isRole('inspector')) 
        {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->disableCreateButton();
            $grid->actions(function ($actions)
            {
                $actions->disableDelete();
                $actions->disableEdit();
              
            });  
        }   
        
        
        //grid options for admin
        else if(Admin::user()->isRole('admin')) 
        {
             $grid->disableCreateButton();
             $grid->actions(function ($actions)
            {
                $actions->disableDelete();
            });
        }

        //grid options for receptionist 
        else if (Admin::user()->isRole('lab-reception')) 
        {
            $grid->disableCreateButton();
            $grid->model()->where('status', 9);
            $grid->actions(function ($actions) 
            {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
            });
        } 
        
        else if (Admin::user()->isRole('lab-technician')) 
        {
            $grid->disableCreateButton();
            $grid->model()->where('status', 10)
                ->orWhere('status', 5);
            $grid->actions(function ($actions) 
            {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if ( $status == 5) 
                {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            });
        }
        
       
        $grid->column('created_at', __('Created'))
            ->display(function ($item) 
            {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
            
        $grid->column('crop_variety_id', __('Crop variety'))->display(function ($variety_id) 
        {
            $_variety = CropVariety::find($variety_id);
            if (!$_variety) 
            {
                return "-";
            }
            return $_variety->name;
        })->sortable();
        $grid->column('lot_number', __('Lot number'));
        $grid->column('lab_test_number', __('Lab test number'));
        $grid->column('collection_date', __('Collection date'));
        $grid->column('quantity', __('Quantity'))->display(function ($quantity) 
        {
            return number_format($quantity);
        })->sortable();

        $grid->column('status', __('Status'))->display(function ($status) 
        {
            return Utils::tell_status($status);
        })->sortable();
        
        $grid->column('report_recommendation', __('Recommendation'))->display(function ($status) 
        {
            return Utils::tell_status($status);
        })->sortable();
        //check the status of the report_recommendation column and display the print button
        if (Utils::is_recommendation_updated('SeedLab')) 
        {
            $grid->column('print', __('Lab Certificate'))->display(function ($status) {
                return '<a target="_blank" href="' . url('/print') . '">Print Certificate</a>';
            })->sortable();
        }

        $grid->column('inspector', __('Inspector'))->display(function ($userId) 
        {
            if (Admin::user()->isRole('basic-user'))
            {
                return "-";
            }
            if (!$userId) 
            {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable(); 
        return $grid;
        
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(SeedLab::findOrFail($id));
        $seedlab = SeedLab::findOrFail($id);

        //delete notifications after they have been viewed
        if(Admin::user()->isRole('basic-user') )
        {
            if($seedlab->status == 2 || $seedlab->status == 3 || $seedlab->status == 4 || $seedlab->status == 16 || $seedlab->status == 10)
            {
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'SeedLab'])->delete();
            }
        }

        $show->panel()
            ->tools(function ($tools) 
            {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('created_at', __('Created at'))->as(function ($item) 
        {
            return Carbon::parse($item)->toFormattedDateString();
        })->sortable();

        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Created by'))
        ->as(function ($userId)
        {
            $u = Administrator::find($userId);
            if (!$u)
            {
                return "-";
            }    
            return $u->name;
        });
        $show->field('crop_variety_id', __('Crop variety id'))
        ->as(function ($cropVarietyId) 
        {
            $cropVariety = CropVariety::find($cropVarietyId);
            if (!$cropVariety)
            {
                return "-";
            }     
            return $cropVariety->name;
        });
        $show->field('lot_number', __('Form stock examination lot number'));
        $show->field('collection_date', __('Collection date'));
        $show->field('payment_receipt', __('Payment receipt'))->file();
        $show->field('applicant_remarks', __('Applicant remarks'));
        $show->field('sampling_date', __('Sampling date'));
        $show->field('sample_weight', __('Sample weight'));
        $show->field('packaging', __('Packaging'));
        $show->field('number_of_units', __('Number of units'));
        $show->field('mother_lot', __('Mother lot'));
        $show->field('sample_condition', __('Sample condition'));
        $show->field('inspector_remarks', __('Inspector remarks'));
        $show->field('tests_required', __('Tests required'));
        if(Admin::user()->isRole('admin'))
        {
            $show->field('lab_technician_id', __('Lab technician id'))
            ->as(function ($userId) 
            {
                $u = Administrator::find($userId);
                if (!$u)
                {
                    return "-";
                }     
                return $u->name;
            });
        }
        $show->field('quantity', __('Quantity'));
        $show->field('purity', __('Purity'));
        $show->field('p_x_g', __('PxG'));
        $show->field('germination_capacity', __('Germination capacity'));
        $show->field('abnormal_sprouts', __('Abnormal sprouts'));
        $show->field('broken_germs', __('Broken germs'));
        $show->field('report_recommendation', __('Report recommendation'));
        if(Admin::user()->isRole('admin'))
        {
            $show->field('inspector', __('Inspector'));
        }
    
        $show->field('status', __('Status'))
            ->unescape()
            ->as(function ($status) 
            {
                return Utils::tell_status($status);
            });
        $show->field('status_comment', __('Status comment'));

        if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            //check the status of the form being shown
            if($seedlab->status == 1 || $seedlab->status == 2 || $seedlab->status == null)
            {
            $show->field('id','Action')->unescape()->as(function ($id) 
                {
                return "<a href='/admin/seed-labs/$id/edit' class='btn btn-primary'>Take Action</a>";
            
                });
            }
        }
        
        if (Admin::user()->isRole('lab-reception') || Admin::user()->isRole('lab-technician'))
        {
            //button link to the show-details form
            //check the status of the form being shown
            if($seedlab->status == 9 || $seedlab->status == 10)
            {
            $show->field('id','Action')->unescape()->as(function ($id) 
                {
                return "<a href='/admin/seed-labs/$id/edit' class='btn btn-primary'>Take Action</a>";
            
                });
            }
        }

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        
        $form = new Form(new SeedLab());
        $form->setWidth(8, 4);
        $user = Admin::user();
        // callback after save

        if(!Admin::user()->isRole('lab-reception'))
        {
            $form->saved(function (Form $form) 
            {
            //return to table view controller after saving the form data 
                return redirect(admin_url('seed-labs'));
    
            });
        }
        else
        {
            $form->saved(function (Form $form) 
            {
                $lab_technician_id = $form->lab_technician;
                $lab_technician = Administrator::find($lab_technician_id);

                return  response(' <p class="alert alert-success"> The seed lab form has been successfully assigned to ' . $lab_technician->name . ' . <a href="/admin"> Go Back </a></p> ');
            });
        }
       

        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id', __('Administrator id'))->default($user->id);

            //save the lot numberas per the stock examination form
            $form->saving(function ($form) 
            {
                $exam = FormStockExaminationRequest::find($form->form_stock_examination_request_id);
                    if (!$exam) {

                        die("Exam not found");
                    }
                    else{
                    $form->lot_number = $exam->lot_number;
                
                    }
                    $form->save();
                    
            });
        }

        //basic user forms
        if (Admin::user()->isRole('basic-user')) 
        {

            $items_in_table = FormStockExaminationRequest::where([
                'administrator_id' => $user->id,
                'status' => 5
            ])->get();
        
            
            if (count($items_in_table) < 1) 
            {
                return admin_error("Alert", "You don't have any valid stock examination request. <br>First apply for Stock Examination, wait till your application is accepted, and then return here.");
        
            }
        
            
            $names = [];
            foreach($items_in_table as $stock_exm_rec) 
            {
               $names[$stock_exm_rec->id] = "Lot Number: " . $stock_exm_rec->lot_number;   
            }
            
            //field to capture stock examination form id
            $form->select('form_stock_examination_request_id', __('Select Stock examination form'))
                ->options($names);
            $form->date('collection_date', __('Collection date'))->default(date('Y-m-d'))->required();
            $form->file('payment_receipt', __('Attach Payment receipt'))->required();
            $form->textarea('applicant_remarks', __('Enter remarks'))->required();
            $form->hidden('lot_number', __('lot_number'));
        }

        //administrator forms
        if (Admin::user()->isRole('admin')) 
        {
            if ($form->isEditing()) 
            {
                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) 
                {
                    die("Form not found");
                }
                $form->display('applicant', 'Applicant')->default($model->user->name);
                $form->display('collection_date', 'Collection date')->default($model->user->collection_date);
                
            }

            $form->divider();
            $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute(['value', 0]);
            $form->hidden('crop_variety_id', __('crop_variety_id'));
            $form->radio('status', __('Action'))
                ->options([
                    '2' => 'Assign inspector',
                ])
                ->required()

            ->when('2', function (Form $form) 
            {
                $items = Administrator::all();
                $_items = [];
                foreach ($items as $key => $item) {
                    if (!Utils::has_role($item, "inspector")) {
                        continue;
                    }
                    $_items[$item->id] = $item->name . " - " . $item->id;
                }
                $form->select('inspector', __('Inspector'))
                    ->options($_items)
                    ->help('Please select inspector')
                    ->rules('required');
            });
             
        }

        //inspector forms
        if (Admin::user()->isRole('inspector')) 
        {
            $form->hidden('parent_id');
            $form->hidden('order');
            $form->hidden('title');
            $form->hidden('temp_parent');
           
            if ($form->isEditing()) 
            {

                if ((($form->packaging * $form->number_of_units) > ($form->quantity)) || ($form->sample_weight > $form->quantity)) 
                {
                    return admin_error("Alert", "You're attempting to test a sample that is more than what the applicant has in stock.
                    <br>Please reduce your sample size and the packaging size as well.");
                }

                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);

                if (!$model) 
                {
                    die("Form not found");
                }
                
                //block the inspector from editing the form if the admin has already approved it
                if ($model->inspector_is_done == 1) 
                {
                    admin_error("You cannot inspect this form more than once. Request adminstrator to re-activate this form.");
                    $form->disableEditingCheck();
                    $form->disableCreatingCheck();
                    $form->disableViewCheck();

                    $form->tools(function (Form\Tools $tools)
                    {
                        $tools->disableDelete();
                        $tools->disableView();
                        
                    
                    });
                    $form->footer(function ($footer) 
                    {
                        $footer->disableReset();
                        $footer->disableSubmit();

                    });
                    //return $form;
                }

                //callback saving when inspector is editing the form
                $form->saving(function ($form) 
                {
                    $id = request()->route()->parameters['seed_lab'];
                    $model = $form->model()->find($id);
                    $quantity = (int)($form->quantity);
                    //convert the quantity to a positive number incase a user enters a negative number
                    if ($quantity < 1) 
                    {
                        $quantity = (-1) * $quantity;
                    }
                    $form->quantity = $quantity;

                    //get the available stock of the crop variety
                    $records = StockRecord::where([
                        'administrator_id' => $model->user->id,
                        'lot_number' => $model->lot_number,
                    ])->get();
                
                     $tot = 0; 
                    //get the total stock of that particular crop variety
                    foreach ($records as $key => $value) 
                    {
                        $tot += ((int)($value->quantity));
                    }
                    
                    //check if the quantity entered is more than the available stock
                    if ($quantity > $tot) 
                    {
                      return  response('<p class="alert alert-warning">You are attempting to test a sample that is more than what the applicant has in stock.<a href="/admin/seed-labs"> Go Back </a></p>');
                      
                    }

                    //check that the mother lot entered is valid and save its id as the parent id
                    $mother = SeedLab::where('lot_number', $form->mother_lot)->first();
                    $form->parent_id = 0;

                    if ($mother != null) 
                    {
                        if ($mother->crop_variety_id != $model->crop_variety_id) 
                        {
                            admin_error("Invalid lot number', 'Crop variety of Mother lot number 
                            doesn't match with current crop variety.");
                            return redirect(admin_url('seed-labs/' . $model->id . "/edit"))->withInput();
                        }

                        $form->parent_id = $mother->id;
                        $form->title = $form->lot_number;
                        $form->order = $model->id;
                        $form->temp_parent = 0;
                    }
                    if($form->status == '4'){
                        $form->report_recommendation = 4;
                    }
                    $form->inspector_is_done = 0;
                });

                //form fields for inspector
                $form->setWidth(8, 4);
                $form->display('applicant', 'Applicant')
                    ->default($model->user->name);

                $form->display('collection_date', 'Collection date')
                    ->default($model->user->collection_date);
                $form->divider();
                $form->hidden('report_recommendation', __('Report recommendation'));

                $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute('value', 1)->value(1)->default(1);
                $form->date('sampling_date', __('Sampling date'))->default(date('y-m-d'))->required();

                $form->text('sample_weight', __('Enter weight of Sample (in metric tons)'))
                    ->required()
                    ->attribute('type', 'number')
                    ->help("This is the sample weight you're going to test");
                $total_stock = DB::table('stock_records')->where("administrator_id", $model->administrator_id)
                               ->where('lot_number', $model->lot_number)->sum('quantity');
                $form->text('quantity', __('Enter the quantity represented (in metric tons)'))
                    ->required()
                    ->default($total_stock)
                    ->help("<span style='color: deepskyblue; font-weight: 799;'>
                    This value should not be more than " . $total_stock . " (The applicant's current 'In Stock' Balance).
                    </span>");
                    
                $form->text('packaging', __('Packaging'))->required();
                $form->hidden('number_of_units', __('Number of units'))->default("");
                $form->text('mother_lot', __('Mother lot'));
                $form->display('lot_number', __('Lot Number'));
                $form->select('sample_condition', __('Sample condition'))
                    ->required()
                    ->options([
                        'Raw seed' => 'Raw seed',
                        'Processed seed' => 'Processed seed',
                        'Quality cleared seed' => 'Quality cleared seed',
                        'Unprocessed seed' => 'Unprocessed seed',
                        'Quality awaited seed' => 'Quality awaited seed',
                        'Conditioned seed' => 'Conditioned seed',
                        'Other' => 'Other',
                    ]);

                $form->tags('tests_required', __('Tests required'))
                    ->required()
                    ->options(['Moisture content', 'Purity', 'Germination', 'Seed health']);

                $form->radio('status', __('Decision'))
                    ->required()
                    ->options([
                        '9' => 'Accept',
                        '4' => 'Reject'
                    ])->when(4, function ($form) {
                        $form->textarea('inspector_remarks', __('Additional remarks'));
                    });

                $form->html("<span style='color: deepskyblue; font-weight: 799;'>
                NOTE: You cannot reverse this process once it's done.
                </span>");
            }
        }

        //lab receptionist form
        if (Admin::user()->isRole('lab-reception')) 
        {

            if ($form->isEditing()) 
            {
                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) 
                {
                    die("Form not found");
                }


                $form->saving(function ($form) 
                {  
                    $form->inspector_is_done = 1;
                    $form->receptionist_is_done = 1;
                });

                $records = StockRecord::where([
                    'administrator_id' => $model->user->id,
                    'crop_variety_id' => $model->crop_variety_id
                ])->get();
                $tot = 0;
                foreach ($records as $key => $value) {
                    $tot += ((int)($value->quantity));
                }


                $form->setWidth(8, 4);
                $form->display('applicant', 'Applicant')
                    ->default($model->user->name)
                    ->readonly()
                    ->disable();
                $form->display('collection_date', 'Collection date')
                    ->default($model->user->collection_date);
                $form->divider();

                $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute('value', 1)->value(1)->default(1)
                    ->readonly()
                    ->disable();

                $form->hidden('receptionist_is_done', __('receptionist_is_done'))->attribute('value', 1)->value(1)->default(1)
                    ->readonly()
                    ->disable();

                $form->display('sampling_date', __('Sampling date'))->required()
                    ->readonly()
                    ->disable();

                $form->display('sample_weight', __('Enter weight of Sample (in KGs)'))->attribute('type', 'number')->required()
                    ->readonly()
                    ->disable();

               $form->display('quantity', __('Enter the quantity represented (in Metric Tonnes)'))->attribute([
                    'type' => 'number',
                    'value' => $tot,
                ])
                    ->readonly()
                    ->disable();
                $form->display('packaging', __('Packaging'));
                $form->display('number_of_units', __('Number of units'));
                $form->display('mother_lot', __('Mother lot'))->attribute('type', 'number');
                $form->select('sample_condition', __('Sample condition'))
                    ->options([
                        'Raw seed' => 'Raw seed',
                        'Processed seed' => 'Processed seed',
                        'Quality cleared seed' => 'Quality cleared seed',
                        'Unprocessed seed' => 'Unprocessed seed',
                        'Quality awaited seed' => 'Quality awaited seed',
                        'Conditioned seed' => 'Conditioned seed',
                        'Other' => 'Other',
                    ])
                    ->readonly()
                    ->disable();

                $form->display('tests_required', __('Tests required'))
                    ->options(['Moisture content', 'Purity', 'Germination', 'Seed health']);
                $form->divider();
                $form->radio('status', __('Decision'))
                    ->required()
                    ->options([
                        '10' => 'Accept',
                        '3' => 'Halt'
                    ])
                    ->when(10, function ($form) 
                    {
                        $form->text('lab_test_number', __('Enter lab test number'))
                            ->default("lab_test" ."/". date('Y') ."/". mt_rand(10000000, 99999999))
                            ->help("The number you're seeing here is autogenerated. You can leave it as is, or edit it.")
                            ->required();

                        $items = Administrator::all();
                        $_items = [];
                        foreach ($items as $key => $item) 
                        {
                            if (!Utils::has_role($item, "lab-technician")) {
                                continue;
                            }
                            $_items[$item->id] = $item->name . " - " . $item->id;
                        }
                        $form->select('lab_technician', __('Assign lab technician'))
                            ->options($_items)
                            ->help('Please select lab technician')
                            ->rules('required');
                    })


                    ->when(3, function ($form) 
                    {
                        $form->textarea('receptionist_remarks', __('Additional remarks'));
                    });

                    $form->html("<span style='color: deepskyblue; font-weight: 799;'>
                    NOTE: You cannot reverse this process once it's done.
                    <br>Also, after submiting, you will nolonger see this form in Seed Lab
                    </span>");
            }

        }

        //lab technician form
        if (Admin::user()->isRole('lab-technician')) 
        { 

            if ($form->isEditing()) 
            {

                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) 
                {
                    die("Form not found");
                }

                $form->saving(function ($form) 
                {
                    $id = request()->route()->parameters['seed_lab'];
                    $model = $form->model()->find($id);

                    $quantity = (int)($form->quantity);
                    if ($quantity < 1) 
                    {
                        $quantity = (-1) * $quantity;
                    }
                    $form->quantity = $quantity;

                    $purity = (int)($form->purity);
                    $germination_capacity = (int)($form->germination_capacity);
                    $p_x_g = (($purity * $germination_capacity) / 100);
                    
                    $form->p_x_g = $p_x_g;
                    $form->status = 5;

                    //saving to the stock records
                    $StockRecord = new StockRecord();
                    $StockRecord->administrator_id = $model->administrator_id;
                    $StockRecord->crop_variety_id = $model->crop_variety_id;
                    $StockRecord->seed_lab_id = $model->seed_lab_id;
                    $StockRecord->is_deposit = 0;
                    $StockRecord->lot_number = $model->lot_number;
                    $StockRecord->seed_class = $model->seed_class;
                    $StockRecord->source = $model->source;
                    $StockRecord->is_transfer = 0;
                    $StockRecord->seed_class = null;
                    $StockRecord->source = null;
                    $StockRecord->quantity = $model->quantity;

                    if ($StockRecord->quantity > 0)
                     {
                        $StockRecord->quantity = ((-1) * $StockRecord->quantity);
                    }

                    $StockRecord->detail = "To seed lab. ID " . $model->id;
                    $StockRecord->save();


                    //saving to the marketable seed
                    $stock_out = new MarketableSeed();
                    $stock_out->administrator_id = $StockRecord->administrator_id;
                    $stock_out->crop_variety_id = $model->crop_variety_id;
                    $stock_out->seed_lab_id = $model->id;
                    $stock_out->seed_label_id = $model->seed_label_id;
                    $stock_out->lot_number = $model->lot_number;
                    $stock_out->quantity = $model->quantity;
                    $stock_out->seed_class = $model->seed_class;
                    $stock_out->source = $model->source;
                    $stock_out->detail = $model->detail;
                    $stock_out->is_deposit = 1;
                    $stock_out->seed_label_package_id = $model->seed_label_package_id;
                    $stock_out->lab_test_number = $model->lab_test_number;
                    $stock_out->save();
                
                    
                });



                $form->setWidth(8, 4);
                $form->display('applicant', 'Applicant')
                    ->default($model->user->name)
                    ->readonly()
                    ->disable();


                $form->display('tests_required', __('Tests required'))
                    ->options(['Moisture content', 'Purity', 'Germination', 'Seed health']);
                $form->divider();
                $form->display('lot_number', __('Lot number'));
                $form->display('lab_test_number', __('Lab test number'));
                $form->divider();
                $form->text('purity', __('Enter Purity (in percentage)'))->attribute([
                    'min', 0,
                    'max', 100,
                    'type' => 'number'
                ])
                    ->required();
                $form->text('germination_capacity', __('Enter Germination capacity (in percentage)'))->attribute([
                    'min', 0,
                    'max', 100,
                    'type' => 'number'
                ])
                    ->required();

                $form->hidden('p_x_g', __('PXG'))->attribute([])
                    ->readonly()
                    ->disable();


                $form->text('abnormal_sprouts', __('Enter Abnormal sprouts (in percentage)'))->attribute([
                    'min' => 0,
                    'max' => 100,
                    'type' => 'number'
                ])
                    ->required();

                $form->text('broken_germs', __('Enter percentage of Broken germs'))->attribute([
                    'min' => 0,
                    'max' => 100,
                    'type' => 'number'
                ])
                    ->required();
                
                $form->radio('report_recommendation', __('Report recommendation'))
                    ->options([
                        '11' => 'Marketable',
                        '12' => 'Not Marketable',
                    ])
                    ->required();
                
                $form->hidden('status', __('Status'))->attribute(['value' => 5]);
                $form->html("<small>NOTE: You cannot reverse this process once it's done.</small>");
            }
        }

        $form->footer(function ($footer) 
        {

            // disable reset btn
            $footer->disableReset();

            // disable `View` checkbox
            $footer->disableViewCheck();

            // disable `Continue editing` checkbox
            $footer->disableEditingCheck();

            // disable `Continue Creating` checkbox
            $footer->disableCreatingCheck();

        });
                $form->tools(function (Form\Tools $tools) 
                {
                    $tools->disableDelete();
                    $tools->disableView();
                
                });
        return $form;
    }
}
