<?php

namespace App\Admin\Controllers;

use App\Imports\UsersImport;
use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\FormSr10;
use App\Models\FormSr6;
use App\Models\PlantingReturn;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Hamcrest\Util;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\ToModel;


class PlantingReturnController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */  
    protected $title = 'Planting Return - Company/ Breeders';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PlantingReturn());
        // $sr = PlantingReturn::all()->first();
        // $sr = PlantingReturn::find("13");
        // $sr->sub_growers_file ="test_1.xlsx";
        // $sr->valid_from = rand(10000,10000000)."";
        // $sr->save();
        // //$sr->import_sub_growers($sr); 
        // die("done");

        /*
        $sr = PlantingReturn::all()->first();
        $sr->name = "Joan Doe";
        $sr->status_comment .= rand(10000,1000000);
        $sr->save();
        
        die();
        
        $file = null;
        if(file_exists('./public/storage/'.$sr->sub_growers_file)){
            $file = './public/storage/'.$sr->sub_growers_file;
        }


        

        if($file!=null){
  

            $row = 1;
            if (($handle = fopen($file, "r")) !== FALSE) {
                while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
                    $num = count($data);
                    echo "<p> $num fields in line $row: <br /></p>\n";
                    $row++;
                    for ($c=0; $c < $num; $c++) {
                        echo $data[$c] . "<br />\n";
                    }
                }
                fclose($handle);
            }else{
                die("failed to open");
            }
        }

        die($file);*/
  //check if the role is an inspector and has been assigned that form
  if (Admin::user()->isRole('inspector')) {
    $grid->model()->where('inspector', '=', Admin::user()->id);
    //return an empty table if the inspector has not been assigned any forms
    if (PlantingReturn::where('inspector', '=', Admin::user()->id)->count() == 0) { 
        //return an empty table if the inspector has not been assigned an
        $grid->model(0);
           
}
}


        // $grid->disableExport();
        $grid->disableFilter();
        // $grid->disableRowSelector();


        if (Admin::user()->isRole('basic-user')) {
            $grid->disableBatchActions();
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if($status == 4){
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
                if (
                    $status != 1
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        }  else if (Admin::user()->isRole('inspector')|| Admin::user()->isRole('admin') ) { 
            // $grid->model()->where('inspector', '=', Admin::user()->id);
             $grid->disableCreateButton();
 
             $grid->actions(function ($actions) {
                 $status = ((int)(($actions->row['status'])));
                 $actions->disableDelete();
                 $actions->disableEdit();
                 // if (
                 //     $status != 2
                 // ) {
                 //     $actions->disableEdit();
                 // }
             });
         } 
         else if (Admin::user()->isRole('basic-user'))  {
            $grid->actions(function ($actions) {

                $status = ((int)(($actions->row['status'])));
                if($status == 4){
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
                if (
                    $status != 1
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        }

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();

        $grid->column('name', __('Company Name'));
        $grid->column('address', __('Address'));
        // $grid->column('sub_growers_file', __('Sub growers file'))
        //     ->display(function ($item) {
        //         if (!$item) {
        //             return "-";
        //         }
        //         return "<a href='/uploads/$item' target='_blank'>Download</a>";
        //     });
        $grid->column('amount_enclosed', __('Amount enclosed'));
        $grid->column('registerd_dealer', __('Registered dealer'));
    
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * 
     * 
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(PlantingReturn::findOrFail($id));

        //deleting notifications once they are viewed
        $planting_return = PlantingReturn::findOrFail($id);
        if(Admin::user()->isRole('basic-user') ){
            if($planting_return->status == 2 || $planting_return->status == 3 || $planting_return->status == 4 || $planting_return->status == 16){
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => ''])->delete();
            }
        }
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created'))
            ->as(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Created by'))
            ->as(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('telephone', __('Telephone'));
        $show->field('seed_rate', __('Seed rate'));
        $show->field('registerd_dealer', __('Registered dealer'));
        // $show->field('longitude', __('Longitude'));
        // $show->field('latitude', __('Latitude'));

        $show->field('Location of the land')->latlong('latitude', 'longitude', $height = 400, $zoom = 16);
        if (!Admin::user()->isRole('basic-user')){
            //button link to the show-details form
            $show->field('id','Action')->unescape()->as(function ($id) {
                return "<a href='/admin/planting-returns/$id/edit' class='btn btn-primary'>Take Action</a>";
            });
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
        // $now Carbon::parse($item)->diffForHumans();
        $form = new Form(new PlantingReturn());

        $sr4 = Utils::has_valid_sr6();
        if ($form->isCreating()) {
            if (!$sr4) {
                return admin_error("Alert", "You need to be a registered and approved seed grower to apply for field inspection.");
                // return redirect(admin_url('planting-returns'));
            }
        }

        //callback after save to return to the table
        $form->saved(function (Form $form) {
            return redirect(admin_url('planting-returns'));
        });
        
        $form->saving(function (Form $form) {
            $is_active_made = false;
            if (Admin::user()->isRole('admin')) {
                $id = request()->route()->parameters['planting_return'];
                $model = $form->model()->find($id);
                if ($model != null) {
                    if (count($model->form_sr10s) < 1) {
                        if ($model->crop != null) {
                            if ($model->crop->crop_inspection_types != null) {
                                if (count($model->crop->crop_inspection_types) > 0) {
                                    foreach ($model->crop->crop_inspection_types as $key => $inspe) {
                                        $d['stage'] = $inspe->inspection_stage;
                                        $d['status'] = '1';
                                        if (!$is_active_made) {
                                            $d['is_active'] = 1;
                                            $is_active_made = true;
                                        } else {
                                            $d['is_active'] = 0;
                                        }
                                        $d['is_done'] = 0;
                                        $d['status_comment'] = "";
                                        $d['planting_return_id'] = $model->id;

                                        $d['administrator_id'] = $_POST['inspector'];
                                        $date_planted = Carbon::parse($model->date_planted);
                                        $date_planted->addDays($inspe->period_after_planting);
                                        $toDateString = $date_planted->toDateString();
                                        $d['min_date'] = $toDateString;
                                        $new_form_sr = new FormSr10($d);
                                        $new_form_sr->save();
                                    }
                                } else {
                                    dd("No stages found found for this crop type.");
                                }
                            }
                        }
                    }
                }
            }
        });

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        $user = Auth::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
            $form->hidden('status', __('status'))->value(1);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }
        $form->setWidth(8, 4);

        $form->hidden('seed_rate', __('seed_rate'))->value(rand(10000,1000000))
        ->default((rand(10000,1000000)));

        $name_of_applicant = "";
        $address = "";
        if (Admin::user()->isRole('basic-user')) {

            if($user != null){
                $sr = FormSr6::find($user->id);
                if($sr!=null){
                    $address = $sr->address;
                    $name_of_applicant = $sr->name_of_applicant;
                }
            } 


            $sr6 = Utils::has_valid_sr6();
            // dd($sr6);
            $form->text('name', __('Company Name'))->default($sr6->name_of_applicant)->readonly();

            // // if basic-user has an active sr6 form (if their sr6 form application has been accepted)
            // if ($sr6 != null) {
            //     if ($sr6->name_of_applicant != null) {
            //             $name_of_applicant = $sr6->name_of_applicant;
            //             $form->text("name_of_applicant", __('Company Name'))
            //             ->default($name_of_applicant)
            //             ->readonly();
            //     }
            //     if ($sr6->address != null) {
            //             $address = $sr6->address;
            //             $form->text("address", __('Company Address'))
            //             ->default($address)
            //             ->readonly();
            //     }
            //     if ($sr6->telephone != null) {
            //             $telephone = $sr6->telephone;
            //             $form->text("telephone", __('Company Telephone'))
            //             ->default($sr6->telephone)
            //             ->readonly();
            //     }
            // }

            $form->text('address', __('Company Address'))->default($sr6->address)
            ->help("Provided during Form SR6 Seed Grower Application")
            ->readonly();
            // $telephone_of_applying_basic_user = Administrator::where(Admin::user()->isRole('admin'), 'basic-user')->phone_number;
            // $form->text('telephone', __('Company Telephone'))->default($telephone_of_applying_basic_user)->readonly();


            $form->text('amount_enclosed', __('Amount enclosed for application'))->attribute('type', 'number')->required();
            $form->file('payment_receipt', __('Payment receipt'))->required();
            $form->text('registerd_dealer', __('Registerd seed merchant/dealer to whome the entire seed stock will be sold'));

            $link = url('/assets/files/sub-growsers-template.xlsx');
            $form->html('<h3>Download sub-growers template file (Excel) ... <a href="'.$link.'" clast="btn btn-primary"
            style="border: solid green 2px;"
            target="_blank"
            >DOWNLOAD TEMPLATE</a></h3>');
            $form->file('sub_growers_file', __('Sub-growers excel file'))
            ->help("To upload many planting_returns, attach an Excel file of multiple Sub-growers here.")
            ->required();
            
 
        }


        if (Admin::user()->isRole('admin')) {
            Admin::script("$('document').ready(function(){
                $('.remove').hide();
                $('.add').hide();
            });");

            $initialized = false;
            if ($form->isEditing()) {
                $id = request()->route()->parameters['planting_return'];
                $model = $form->model()->find($id);
                if ($model != null) {
                    if ($model->inspector != null) {
                        $inspector = ((int)($model->inspector));
                        if ($inspector > 1) {
                            $initialized = true;

                            // if (count($model->planting_return_crops) > 0) {
                            //     if ($model->status != null || $model->status != 1) {
                            //     }
                            // }
                        }
                    }
                }
            }

            $form->display('name', __('Name'))->readonly();
            $form->display('address', __('Address'))->readonly();
            $form->select('crop_id', 'Crop')->options(Crop::all()->pluck('name', 'id'))
                ->readonly();



            if ($initialized) {
                $form->hasMany('form_sr10s', __("SR 10 - Inspections schedules"), function (NestedForm $form) {
                    $form->select('administrator_id', 'Inspector')->options(Administrator::all()->pluck('name', 'id'));
                    $form->text('stage', __('State name'))->readonly();
                    $form->text('status', __('Status name'))->readonly();
                    $form->text('status_comment', __('Status comment'))->readonly();
                    $form->date('min_date', __('Min date'));
                });
            } else {

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
                    });
                    // ->when('in', [5, 6], function (Form $form) {
                    //     $form->date('valid_from', 'Valid from date?');
                    //     $form->date('valid_until', 'Valid until date?');
                    // });
            }
        }

        return $form;
    }
}
