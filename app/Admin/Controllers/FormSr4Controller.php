<?php

namespace App\Admin\Controllers;

use App\Models\FormSr4;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Encore\Admin\Actions\RowAction;
use App\Admin\Actions\Post\Renew;


class FormSr4Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Form SR4'; 

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormSr4());
    
/*
        $m = FormSr4::find(201);
        $m->premises_location .=  rand(200,200000);
        $m->status = 3; 
        $m->save(); 
        dd("done");
  

        s = FormSr4::all()->first();
        $s->status_comment .= rand(100,1000000);
        $s->save();*/

        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);


            if (!Utils::can_create_sr4()) {
                $grid->disableCreateButton();
            }
            
            

            $grid->actions(function ($actions) {

                $status = ((int)(($actions->row['status'])));
                if (
                    $status == 2 ||
                    $status == 5 ||
                    $status == 6
                ) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
                //get last parameter from url
                
                    if(Utils::check_expiration_date('FormSr4',$this->getKey())){
                        
                        $actions->add(new Renew(request()->segment(count(request()->segments()))));
                    
                };
             });
        } 
        
        else if (Admin::user()->isRole('inspector')) { 
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->disableCreateButton();

            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                $actions->disableDelete();
                // if (
                //     $status != 2
                // ) {
                //     $actions->disableEdit();
                // }
            });
        } 
        
        else {
            $grid->disableCreateButton();
        }

        $grid->column('id', __('Id'))->sortable();
        
        $grid->column('name_of_applicant', __("Search by Name of Applicant"))->sortable();

        $grid->column('created_at', __('Created'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('status', __('Status'))->display(function ($status) {
           // check expiration date
            if (Utils::check_expiration_date('FormSr4',$this->getKey())) {
                return Utils::tell_status(6);
            } else{
                return Utils::tell_status($status);
            }
        })->sortable();
        
        if(Utils::is_form_accepted('FormSr4')){
        $grid->column('valid_from', __("Starts"))->sortable();
        $grid->column('valid_until', __("Expires"))->sortable();
        };
       

        // $grid->column('valid_from', __('Starts'))->display(function ($item) {
        //     // return Carbon::parse($item)->diffForHumans();
        // })
        // ->sortable();
        // $grid->column('valid_until', __('Expires'))->display(function ($item) {
        //     return Carbon::parse($item)->diffForHumans();
        // })->sortable();

        $grid->column('administrator_id', __('Created by'))->display(function ($userId) {
            $u = Administrator::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        })->sortable();

        $grid->column('address', __('Address'))->sortable();


        $grid->column('inspector', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();

        $grid->filter(function($search_param){
            $search_param->disableIdfilter();
            $search_param->like('name_of_applicant', __("Search by Name of Applicant"));
        });

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
        $form = new Form(new FormSr4());
        $form_sr4 = FormSr4::findOrFail($id);
        if(Admin::user()->isRole('basic-user') ){
            if($form_sr4->status == 3 || $form_sr4->status == 4 || $form_sr4->status == 5){
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'FormSr4'])->delete();
            }
        }
        $show = new Show($form_sr4);
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('type', __('Application Category'));
        $show->field('created_at', __('Created on'));
        $show->field('seed_board_registration_number', __('Seed board registration number'));
        $show->field('administrator_id', __('Created by'))->as(function ($userId) {
            $u = Administrator::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        });
        $show->field('name_of_applicant', __('Name of applicant'));
        $show->field('address', __('Address'));
        $show->field('company_initials', __('Company initials'));
        $show->field('premises_location', __('Premises location'));
        $show->field('years_of_expirience', __('Experience in'));
        $show->field('expirience_in', __('Years of experience'))->as(function ($item) {
            return $item . " Years";
        });
        $show->field('dealers_in', __('Dealers in'));
        $show->field('processing_of', __('Processing of'));
        $show->field('marketing_of', __('Marketing of'))->as(function ($item) {
            if ($item == "Other") {
                return $this->marketing_of_other . " (Other)";
            }
            return $item;
        });
        $show->field('have_adequate_land', __('Have adequate land'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('land_size', __('Land size (In Acres)'));
        $show->field('eqipment', __('Equipment'));
        $show->field('have_adequate_equipment', __('Have adequate equipment'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('have_contractual_agreement', __('Have contractual agreement'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('have_adequate_field_officers', __('Have adequate field officers'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('have_conversant_seed_matters', __('Have conversant seed matters'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('souce_of_seed', __('Souce of seed'))->as(function ($userId) {
            $u = Administrator::find($userId);
            if (!$u)
                return $userId;
            return $u->name . " - ID: " . $u->id;
        });
        $show->field('have_adequate_land_for_production', __('Have adequate land for production'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('have_internal_quality_program', __('Have internal quality program'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('receipt', __('Receipt'))->file();

        $show->field('accept_declaration', __('Accepted declaration'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
        });
        $show->field('valid_from', __('Valid from'));
        $show->field('valid_until', __('Valid until'));
        $show->field('status', __('Status'))->unescape()->as(function ($status) {
            return Utils::tell_status($status);
        });
        $show->field('status_comment', __('Status comment'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FormSr4());

        //check the id of the user before editing the form
        if ($form->isEditing()) {
            if (Admin::user()->isRole('basic-user')){
            //checking the user before accessing the form
                //get request id
                $id = request()->route()->parameters()['form_sr4'];
                //get the form
                $formSr4 = FormSr4::find($id);
                //get the user
                $user = Auth::user();
                if ($user->id != $formSr4->administrator_id) {
                    $form->html('<div class="alert alert-danger">You cannot edit this form </div>');
                    $form->footer(function ($footer) {

                        // disable reset btn
                        $footer->disableReset();

                        // disable submit btn
                        $footer->disableSubmit();

                        // disable `View` checkbox
                        $footer->disableViewCheck();

                        // disable `Continue editing` checkbox
                        $footer->disableEditingCheck();

                        // disable `Continue Creating` checkbox
                        $footer->disableCreatingCheck();

                    });
                }
                else {
                    $this->show_fields($form);
                }
            }
            else {
                $this->show_fields($form);
            }
        }


        if ($form->isCreating()) {

            if (!Utils::can_create_sr4()) {
                return admin_warning("Warning", "You cannot create a new SR4 form  while still having another PENDING one.");
                
            }

            if (Utils::can_renew_form('FormSr4')) {
                return admin_warning("Warning", "You cannot create a new SR4 form  while still having a valid one.");
            
            }
            $this->show_fields($form);
        }


    
        return $form;
    }

    public function show_fields($form){
        

        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        $form->setWidth(8, 4);
        Admin::style('.form-group  {margin-bottom: 25px;}');
        $user = Auth::user();

        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }



        if (Admin::user()->isRole('basic-user')) {

            $form->select('type', __('Application category?'))
            ->options([
                // 'Seed Merchant' => 'Seed Merchant',
                'Seed Producer' => 'Seed Producer',
                'Seed Stockist' => 'Seed Stockist',
                'Seed Importer' => 'Seed Importer',
                'Seed Exporter' => 'Seed Exporter',
                'Seed Processor' => 'Seed Processor',
            ])
            ->help('Which SR4 type are you applying for?')
            // ->creationRules(["required", "unique:form_sr4s"])
            ->rules('required');

            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->required();
            $form->text('company_initials', __('Company initials'))->required();
            $form->text('premises_location', __('Premises location'));

            $form->text('years_of_expirience', __('Years of experience'))
                ->rules('min:1')
                ->attribute('type', 'number')
                ->required();
            $form->select('expirience_in', __('Experience in?'))
                ->options([
                    // 'Seed Merchant' => 'Seed Merchant',
                    'Seed Producer' => 'Seed Producer',
                    'Seed Stockist' => 'Seed Stockist',
                    'Seed Importer' => 'Seed Importer',
                    'Seed Exporter' => 'Seed Exporter',
                    'Seed Processor' => 'Seed Processor',
                ])
                ->help('What are you experienced in?')
                ->rules('required');


            $form->html('<h3>I/We wish to apply for a certificate as a seed stockist.</h3>');

            $form->radio('dealers_in', __('Applicant is applying for production of?'))
                ->options([
                    'Agricultural crops' => 'Agricultural crops',
                    'Horticultural crops' => 'Horticultural crops',
                    'Other' => 'Other',
                    'NA' => 'NA'
                ])
                ->required()
                ->when('Other', function (Form $form) {
                    $form->text('dealers_in_other', 'Applicant is applying for Other Production of?')
                        ->help("Please specify Production that you are applying for");
                });


            // $form->radio('processing_of', __('Applicant is applying for processing of?'))
            //     ->options([
            //         'Agricultural crops' => 'Agricultural crops',
            //         'Horticultural crops' => 'Horticultural crops',
            //         'Other' => 'Other'
            //     ])
            //     ->required()
            //     ->when('Other', function (Form $form) {
            //         $form->text('processing_of_other', __('Applicant is applying for Other processing of?'))
            //             ->help('Specify if you selected "Other" processing.');
            //     });


            $form->radio('marketing_of', __('Applicant is applying for marketing of?'))
                ->options([
                    'Agricultural crops' => 'Agricultural crops',
                    'Horticultural crops' => 'Horticultural crops',
                    'Other' => 'Other',
                    'NA' => 'NA'
                ])
                ->required()
                ->when('Other', function (Form $form) {
                    $form->text('marketing_of_other', __('Applicant is applying for Other marketing of?'))
                        ->help('Please Specify if you selected "Other" marketing.');
                });


            $form->radio('have_adequate_land', 'Do you have adequate land to handle basic seed?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])->required()
                ->when('1', function (Form $form) {
                    $form->text('land_size', 'Specify Land size. (in Acres)')
                        ->attribute('type', 'number')
                        ->help("Please specify land (in Acres)")
                        ->attribute('min', 1);
                });


            $form->radio('have_adequate_storage', 'I/We have adequate storage facilities to handle the resultant seed:')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])->required();

            $form->radio('have_adequate_equipment', 'Do you have adequate equipment to handle basic seed?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])->required()
                ->when('1', function (Form $form) {
                    $form->text('eqipment', 'specify the equipment')
                        ->help("Please specify the equipment");
                });


            $form->radio('have_contractual_agreement', 'Do you have contractual agreement with the growers you have recruited?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->radio('have_adequate_field_officers', 'Do you have adequate field officers to supervise and advise growers on all operation of seed production?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->radio(
                'have_conversant_seed_matters',
                __('Do you have adequate and knowledgeable personal who are conversant with seed matters?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();



            $items = Administrator::all();
            $_items = [];
            foreach ($items as $key => $item) {
                // if($item->parent>0){
                //     continue;
                // }
                $_items[$item->id] = $item->id . " - " . $item->name;
            }
            $_items['Other'] = "Other";
            
            $form->text('souce_of_seed', __('What is your souce of seed?'))->required();
    


            $form->radio(
                'have_adequate_land_for_production',
                __('Do you have adequate land for production of basic seed?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->radio(
                'have_internal_quality_program',
                __('Do you have an internal quality program?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->file('receipt', __('Receipt'))->required();

            if(Utils::check_inspector_remarks()){
            $form->textarea('status_comment', __('Inspector\'s remarks.'))->readonly();
            }

            $form->divider();
            $form->html('<h4>Declaration:</h4>
                <p>I/WE* AT ANY TIME DURING OFFICIAL WORKING HOURS EVEN WITHOUT previous appointment will allow the inspectors entry to the seed stores and thereby provide them with the facilities necessary to carry out their inspection work as laid out in the seed and plant regulations, 2015.I/We further declare taht I/We am/are conversant with the Regulations. In addition I/We will send a list of all seed lots in our stores on a given date and or at such a date as can be mutually agreed upon between the National Seed Certification Service and ourselves.</p>
        ');

            $form->radio(
                'accept_declaration',
                __('Accept declaration')
            )
                ->options([
                    '1' => 'I Accept',
                ])
                ->required();
        }

        if (Admin::user()->isRole('admin')) {
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();

            $form->text('type', __('Applicant type'))->readonly(); 


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
                });
        }


        if (Admin::user()->isRole('inspector')) {
            $form->text('type', __('Applicant type'))->readonly();
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('company_initials', __('Company initials'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();
            $form->file('receipt', __('Receipt'))->readonly(); 

            $form->radio('status', __('Status'))
                ->options([ 
                    '3' => 'Halted',
                    '4' => 'Rejected',
                    '5' => 'Accepted',
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

                    // $form->text('inspector', __('Inspector'))
                    //     ->options($_items)
                    //     ->readonly()
                    //     ->help('Name of the Inspector');
                })
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Inspector\'s comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('in', [5, 6], function (Form $form) {

                    $today = Carbon::now();
                    $_today = Carbon::now();
                   /*  echo ($today);
                    echo "<br>";
                    $_today = $today->addYear();*/

                    /**
                     * 
                     * $id = request()->route()->parameters['form-sr4s'];
                     * $model = $form->model()->find($id);
                     * dd($model);

                     * Applicaiton forms can only allow a person to apply for a category once. 
                     * After the status is approved, this person gets a number (seed board reg no.) 
                     * that is unique to the category and the user himself
                     */
                    $form->text('seed_board_registration_number', __('Enter Seed Board Registration number'))
                        ->help("Please Enter seed board registration number")
                        ->default(rand(1000000, 9999999));
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });
        }


        $form->footer(function ($footer) {

            // disable reset btn
            $footer->disableReset();

            // disable `View` checkbox
            $footer->disableViewCheck();

            // disable `Continue Creating` checkbox
            $footer->disableCreatingCheck();
        });

        

    }
}
