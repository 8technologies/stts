<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\FormCropDeclaration;
use App\Models\FormSr10;
use App\Models\FormStockExaminationRequest;
use App\Models\ImportExportPermit;
use App\Models\PlantingReturn;
use App\Models\StockRecord;
use App\Models\SubGrower;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class FormStockExaminationRequestController extends AdminController
{
    /**
     * Title for current resource.
     * 
     * @var string
     */ 
    protected $title = 'Stock examination requests';

    /**
     * Make a grid builder. 
     * 
     * @return Grid
     */
    protected function grid()
    {

        /*$ms = FormStockExaminationRequest::all();
        $m = $ms->first();
        $m->germination = rand(1000000000,100000000000);
        $m->status = 5;
        $m->save();
        dd($m->id."");
        die();*/

        $grid = new Grid(new FormStockExaminationRequest());

        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if (
                    $status == 2 ||
                    $status == 4 ||
                    $status == 5 ||
                    $status == 6 ||
                    $status == 7
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->disableCreateButton();
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                $actions->disableDelete();
                if (
                    $status == 1
                ) {
                    $actions->disableEdit();
                }
            });
        } else {
            $grid->disableCreateButton();
        }


        // $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created On'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();
        $grid->column('administrator_id', __('Created by'))->display(function ($userId) {
            $u = Administrator::find($userId);
            if (!$u)
                return $userId;
            return $u->name;
        })->sortable();

        $grid->column('examination_category', __('Category'))->display(function ($cat) {
            if ($cat == 1) {
                return 'Imported seed';
            } else if ($cat == 2) {
                return 'Grower seed';
            } else if ($cat == 3) {
                return 'QDs';
            }
            return $cat;
        })->sortable();

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        $grid->column('lot_number', __('Lot Number'));

        $grid->column('inspector', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();
        

        if (Admin::user()->isRole('admin')) {
            $grid->filter(function($search_param){
                $search_param->disableIdfilter();

                $search_param->like('examination_category', __("Search by Category"));
                $search_param->like('status', __("Search by Status"));
            });  
        }
        else{
            $grid->disableFilter();
        }

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
        $show = new Show(FormStockExaminationRequest::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        $show->field('lot_number', __('Lot Number'));
        $show->field('import_export_permit_id', __('Import export permit id'));
        $show->field('planting_return_id', __('Planting return id'));
        $show->field('form_qds_id', __('Form qds id'));
        $show->field('field_size', __('Field size'));
        $show->field('yield', __('Yield'));
        $show->field('date', __('Date'));
        $show->field('purity', __('Purity'));
        $show->field('germination', __('Germination'));
        $show->field('moisture_content', __('Moisture content'));
        $show->field('insect_damage', __('Insect damage'));
        $show->field('moldiness', __('Moldiness'));
        $show->field('noxious_weeds', __('Noxious weeds'));
        $show->field('recommendation', __('Recommendation'));
        $show->field('status', __('status'));
        $show->field('inspector', __('Inspector'));
        $show->field('status_comment', __('Status comment'));

        return $show;
    }

    /**
     * Make a form builder.
  
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FormStockExaminationRequest());

        if ($form->isEditing()) {
            $id = request()->route()->parameters['form_stock_examination_request'];
            $model = $form->model()->find($id);
            if ($model->status == 5) {
                admin_warning("Warning", "This form has been accepted already. You cannot reverse the accept decision.");
                $form->tools(function (Form\Tools $tools) {
                    $tools->disableDelete();
                });
                $form->footer(function ($footer) {
                    $footer->disableReset();
                    $footer->disableViewCheck();
                    $footer->disableEditingCheck();
                    $footer->disableCreatingCheck();
                    $footer->disableSubmit();
                });
                return $form;
            }
        }


        $import_permits = [];
        $planting_returnings = [];
        $all_planting_returning = [];
        $my_qds = [];
        $all_qds = [];

        $form->setWidth(8, 4);
        if ($form->isCreating()) {
            if (!Admin::user()->isRole('basic-user')) {
                return  admin_warning("Warning", "You cannot create a new Stock examination requests.");
                return redirect(admin_url('form-stock-examination-requests'));
            }
        }


        if (Admin::user()->isRole('basic-user')) {

            $all_qds =  FormCropDeclaration::where([
                'administrator_id' => Admin::user()->id
            ])->get();
            $_my_qds = [];
            $all_vars = [];

            foreach ($all_qds as $key => $value) {
                if ($value->status == 5) {
                    if (!$value->is_not_used) {
                        $min_date = Carbon::parse($value->valid_until);
                        if (!$min_date->isToday()) {
                            if (!$min_date->isPast()) {
                                $my_qds[$value->id] = "QDS number: " . $value->id;
                                $_my_qds[] =  $value;
                            }
                        } else {
                            $my_qds[$value->id] = "QDS number: " . $value->id;
                            $_my_qds[] =  $value;
                        }
                    }
                }
            }

            foreach ($_my_qds as $key => $value) {
                if ($value->form_crop_declarations_has_crop_varieties != null) {
                    foreach ($value->form_crop_declarations_has_crop_varieties as $key => $val) {
                        $all_vars[$val->crop_variety->id] = "CROP: " . $val->crop_variety->crop->name . ", VARIETY: " . $val->crop_variety->name;
                    }
                }
            }


            $_planting_returnings = [];
            $all_planting_returning =  PlantingReturn::where([
                'administrator_id' => Admin::user()->id
            ])->get();
            foreach ($all_planting_returning as $key => $value) {
                $min_date = Carbon::parse($value->valid_until);
                if (!$min_date->isToday()) {
                    if (!$min_date->isPast()) {
                        $planting_returnings[$value->id] = "SR8 number: " . $value->id;
                        $_planting_returnings[] = $value;
                    }
                } else {
                    $_planting_returnings[] = $value;
                    $planting_returnings[$value->id] = "SR8 number: " . $value->id;
                }
            }


            foreach ($_planting_returnings as $key => $value) {
                if ($value->planting_return_crops != null) {
                    foreach ($value->planting_return_crops as $key => $val) {
                        $all_vars[$val->crop_variety->id] = "CROP: " . $val->crop_variety->crop->name . ", VARIETY: " . $val->crop_variety->name;
                    }
                }
            }

            $all_import_permits =  ImportExportPermit::where([
                'administrator_id' => Admin::user()->id,
                'is_import' => 1
            ])->get();

            $_import_permits = [];
            foreach ($all_import_permits as $key => $value) {
                if ($value->status == 5) {
                    $min_date = Carbon::parse($value->valid_until);
                    if (!$min_date->isToday()) {
                        if (!$min_date->isPast()) {
                            $_import_permits[] = $value;
                            $import_permits[$value->id] = "Permit number: " . $value->permit_number;
                        }
                    } else {
                        $_import_permits[] = $value;
                        $import_permits[$value->id] = $value->id;
                    }
                }
            }

            foreach ($_import_permits as $key => $value) {
                if ($value->import_export_permits_has_crops != null) {
                    foreach ($value->import_export_permits_has_crops as $key => $val) {
                        $all_vars[$val->id] = "CROP: " . $val->name . ", VARIETY: " . $val->name;
                    }
                }
            }

            // if (
            //     (count($all_vars) < 1)
            // ) {
            //     admin_warning("Warning", "You cannot create a new Stock examination requests if don't have
            // either valid Import permit or SR8 or QDS.");
            //     return redirect(admin_url('form-stock-examination-requests'));
            // }


            $form->radio('examination_category', __('Select examination category'))
                ->options([
                    '1' => 'Imported seed',
                    '2' => 'Grower seed',
                    '3' => 'QDs',
                ])
                ->when('1', function (Form $form) {
                    $all_import_permits =  ImportExportPermit::where([
                        'administrator_id' => Admin::user()->id,
                        'is_import' => 1
                    ])->get();
                    
                    if($all_import_permits->isEmpty()){
                         $form->html('<div class="alert alert-danger">You cannot create a new Stock examination request if don\'t have a valid Import permit </div>');
                    }else{
                    $import_permits = [];
                    foreach ($all_import_permits as $key => $value) {
                        if ($value->status == 5) {  // if accepted
                            $min_date = Carbon::parse($value->valid_until);
                            if (!$min_date->isToday()) {  // if expiry date is not today
                                if (!$min_date->isPast()) {  // if expiry date is valid
                                    $import_permits[$value->id] = "Import Permit Number: " . $value->permit_number;
                                }
                            } else {
                                // $import_permits[$value->id] = $value->id;
                                $import_permits[$value->id] = "Import Permit Number: " . $value->permit_number;

                            }
                        }
 
                    // if (count($all_import_permits) >= 1) {
                    //     // $form->select('import_export_permit_id', __('Import permit number'))
                    //     //     ->rules('required')
                    //     //     ->options($import_permits);
                    //     echo "fooooo";
                    // }

                    }
 
                    if (count($all_import_permits) >= 1) {
                        $form->select('import_export_permit_id', __('Select Import Permit'))
                        ->rules('required')
                        ->options($import_permits);
                    }
                
                }

                })    // end when 1

                ->when('2', function (Form $form) {

                    $SubGrowers =  SubGrower::where([
                        'administrator_id' => Admin::user()->id
                    ])->get();
                

                    if($SubGrowers->isEmpty()){
                        $form->html('<div class="alert alert-danger">You cannot create a new Stock examination request if don\'t have an approved SR10 </div>');
                    }else{

                    $sr10s = [];
                    $planting_returnings = [];
                    $verified_isnpections = [];
                    foreach ($SubGrowers as $SubGrower) {
                        $_sr10s = FormSr10::where(['planting_return_id' => $SubGrower->id])->get();
                        foreach ($_sr10s as $_sr10) {
                            $sr10s[] = $_sr10;
                        }
                    }
                    foreach ($sr10s as $key => $sr10) {
                        if ($sr10->is_final) {
                            if ($sr10->status == 5) {
                                $verified_isnpections[] = $sr10;
                            }
                        }
                    }

                    foreach ($verified_isnpections as $key => $value) {
                        if ($value->status == 5) {
                            if (!$value->is_not_used) {
                                $planting_returnings[$value->id] = "SR10 number: " . $value->sr10_number;
                            }
                        }
                    }

                
                $form->select('planting_return_id', __('Select approved SR10'))
                        ->rules('required')
                        ->options($planting_returnings);
                }
                })


                ->when('3', function (Form $form) {
                    $all_qds =  FormCropDeclaration::where([
                        'administrator_id' => Admin::user()->id
                    ])->get();

                    if($all_qds->isEmpty()){
                        $form->html('<div class="alert alert-danger">You cannot create a new Stock examination request if don\'t have a valid QDS </div>');
                    }else{

                    $my_qds = [];

                    foreach ($all_qds as $key => $value) {
                        if ($value->status == 5) {
                            if (!$value->is_not_used) {
                                $my_qds[$value->id] = "QDS Crop Inspection Id: " . $value->id;
                            }
                        }
                    }

                    if (count($my_qds) >= 1) {
                        $form->select('form_qds_id', __('Select Approved QDS Crop Inspection'))
                            ->rules('required')
                            ->options($my_qds);
                    }
                }
                })->required();

            $_items = [];
            foreach (CropVariety::all() as $key => $item) {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }


            $form->textarea('remarks', __('Enter remarks'))->required();

            $user = Auth::user();
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id); 
        }

//Admin form functionalities
        if (Admin::user()->isRole('admin') && $form->isEditing()) {
            $form->setTitle("Assigning an inspector");

            $id = request()->route()->parameters['form_stock_examination_request'];
            $model = $form->model()->find($id);
            $u = Administrator::where('id', $model->administrator_id)->firstOrFail();


            $cat = "";
            if ($model->examination_category == 1) {
                $cat =  'Imported seed';
            } else if ($cat == 2) {
                $cat =  'Grower seed';
            } else if ($cat == 3) {
                $cat =  'QDs';
            }
            $form->display('name', __('Name of applicant'))
                ->default($u->name);
        

            $form->divider();
            $form->radio('status', __('Status'))
                ->options([
                    '1' => 'Pending',
                    '2' => 'Under inspection',
                ])
                ->required()
                ->when('2', function (Form $form) {
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
                })
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('in', [5, 6], function (Form $form) {
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });
        }

    //Inspector form functionalities

        if (Admin::user()->isRole('inspector')) {

            $form->setTitle("Updating examination");

            $_items = [];
            foreach (CropVariety::all() as $key => $item) {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $id = request()->route()->parameters['form_stock_examination_request'];
            $model = $form->model()->find($id);

            foreach (CropVariety::all() as $key => $item) {
                $variety = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $form->display('display', 'Crop Variety')
                ->default($variety)
                ->required();

            $u = Administrator::where('id', $model->administrator_id)->firstOrFail();

            $cat = "";
            if ($model->examination_category == 1) {
                $cat =  'Imported seed';
            } else if ($cat == 2) {
                $cat =  'Grower seed';
            } else if ($cat == 3) {
                $cat =  'QDs';
            }

            $form->display('name', __('Name of applicant'))
                ->default($u->name);
  
            $form->text('yield', __('Enter Yield/Seed quantity (in Metric tonnes)'))
                ->attribute('type', 'number')
                ->required();
            $form->select('seed_class', __('seed_class'))
                ->options([
                    'Pre-Basic seed' => 'Pre-Basic seed',
                    'Basic seed' => 'Basic seed',
                    'Certified seed' => 'Certified seed',
                ])
                ->required();

            

            /**
             * During stock examination the system should automatically 
             * generate the lot number with this format 
             * (company initials/ year/crop variety/ random number)
             * NM/2022/Beans/23232332
            */

            /*
            $lot_number_company = "NM";
            $lot_number_Year = date("Y");
            $lot_number_cropVariety = "Beans";
            $form->text('lot_number', __('Lot Number'))->readonly()
            ->value($lot_number_company . "/" . $lot_number_Year . "/" . $lot_number_cropVariety . "/" . $lot_number_randNum);
            ->value($lot_number_company . $lot_number_Year . $lot_number_cropVariety . $lot_number_randNum);            
*/

            // $form->text('lot_number', __('Lot Number'))->default(rand(1000000, 999999999));

    

            // $form->text('lot_number', __('Lot Number'))
            // ->default("0000")
            // ->value($model->id . rand(1000000, 999999999))
            // ->readonly();
            // dd($model->id . rand(1000000, 999999999));


            // $form->text('lot_number', __('Lot Number'))
            // ->required()
            // ->help("Enter a 9-digit lot number here")
            // ->attribute([
            //     'value' => rand(1000000, 999999999),
            // ])
            // ->help("Enter a 9-digit lot number here");


            $form->text('lot_number', __('Lot Number'))->required()
            ->attribute([
                'value' => $model->id . rand(1000000, 999999999),
            ]);

    

            $form->text('field_size', __('Enter field size (in Acres)'));
            $form->date('date', __('Stock Examination Date'));

            $form->divider();
            $form->html('<h3>Analysis results</h3>');
            $form->text('purity', __('Enter purity'));
            $form->text('germination', __('Enter Germination'));
            $form->text('moisture_content', __('Enter moisture content'));
            $form->text('insect_damage', __('Insect damage'));
            $form->text('moldiness', __('Moldiness'));
            $form->text('noxious_weeds', __('Noxious weeds'));

            $form->radio('status', __('Examination decision'))
                ->help("NOTE: You cannot reverse this decision once submited.")
                ->options([
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                });
        }

        $form->tools(function (Form\Tools $tools) {
            $tools->disableList();
            $tools->disableDelete();
        });
        $form->footer(function ($footer) {
            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });
        return $form;
    }
}
