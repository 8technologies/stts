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
        //organize the grid in descending order of created_at
        $grid->model()->orderBy('created_at', 'desc');
        $form_sr4s = FormSr4::where('administrator_id', auth('admin')->user()->id)->get();

        //disable export button
        $grid->disableExport();

        //disable batch delete
        $grid->batchActions(function ($batch) 
        {
            $batch->disableDelete();
        });

        //check if the role is an inspector and has been assigned that form
        //return an empty table if the inspector has not been assigned any forms
        if (Admin::user()->isRole('inspector'))  
        {
            $grid->model()->where('inspector_id', '=', Admin::user()->id);
               
        }
       
        if (Admin::user()->isRole('basic-user')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
           
            $grid->actions(function ($actions) 
            {
                $status = ((int)(($actions->row['status'])));
                if (
                    $status == 2 ||
                    $status == 5 ||
                    $status == 6
                ) 
                {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
                if (
                    $status == 3 ||
                    $status == 4
                ) 
                {
                    $actions->disableDelete();
                }
                //get last parameter from url
                if(Utils::check_expiration_date('FormSr4',$this->getKey()))
                {  
                    $actions->add(new Renew(request()->segment(count(request()->segments()))));
                    
                };
            });
        } 
        
        else if (Admin::user()->isRole('inspector')|| Admin::user()->isRole('admin') ) 
        { 
            $grid->disableCreateButton();
            $grid->actions(function ($actions) 
            {
                $actions->disableDelete();
                $actions->disableEdit();
                
            });
        } 
        else 
        {
            $grid->disableCreateButton();
        }
        
        $grid->column('name_of_applicant', __("Name of Applicant"))->sortable();

        $grid->column('created_at', __('Created'))->display(function ($item) 
        {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('type', __('Application Category'))->sortable();

        $grid->column('status', __('Status'))->display(function ($status) 
        {
           // check expiration date
            if (Utils::check_expiration_date('FormSr4',$this->getKey())) 
            {
                return Utils::tell_status(6);
            } else
            {
                return Utils::tell_status($status);
            }
        })->sortable();
        
        if(Utils::is_form_accepted('FormSr4'))
        {
        $grid->column('valid_from', __("Starts"))->sortable();
        $grid->column('valid_until', __("Expires"))->sortable();
        };

        $grid->column('administrator_id', __('Created by'))->display(function ($userId) 
        {
            $u = Administrator::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        })->sortable();

        $grid->column('address', __('Address'))->sortable();
        $grid->column('inspector_id', __('Inspector'))->display(function ($userId) 
        {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();

        $grid->column('id', __('Certificate'))->display(function ($id)
        {
            $form_sr4  =  FormSr4::find($id);
        
            if ($form_sr4 && $form_sr4->status == '5') {
                $link = url('certificate?id=' . $id);
                return '<b><a target="_blank" href="' . $link . '">Print Certificate</a></b>';
            } else {
                
                return '<b>Unavailable</b>';
            }
        });
       

          $grid->filter(function ($filter) 
          {
           // Remove the default id filter
           $filter->disableIdFilter();
           $filter->like('administrator_id', 'Applicant')->select(\App\Models\User::pluck('name', 'id'));
          
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
        $form_sr4 = FormSr4::findOrFail($id);
       
        //delete the notification once a user has viewed the form
        if(Admin::user()->isRole('basic-user') )
        {
            if($form_sr4->status == 2 || $form_sr4->status == 3 || $form_sr4->status == 4 || $form_sr4->status == 5)
            {
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'FormSr4'])->delete();
            }
        }

        $show = new Show($form_sr4);
        $show->panel()
            ->tools(function ($tools) use($id) 
            {
                $tools->disableEdit();
                $tools->disableDelete();
            
            });

        $show->field('type', __('Application Category'));

        //check if seed board registration number is empty,if it is then dont show it
        if ($form_sr4->seed_board_registration_number != null) 
        {
            $show->field('seed_board_registration_number', __('Seed board registration number'));
        }
        $show->field('name_of_applicant', __('Name of applicant'));
        $show->field('address', __('Address'));
        $show->field('phone_number', __('Phone number'));
        $show->field('company_initials', __('Company initials'));
        $show->field('premises_location', __('Premises location'));
        $show->field('expirience_in', __('Experience in'));
        $show->field('years_of_expirience', __('Years of experience'))->as(function ($item)
        {
            return $item . " Years";
        });
        $show->field('dealers_in', __('Dealers in'))->as (function($item)
        {
            if($item == "Other"){
                return $this->dealers_in_other ;
            }
            return $item;
        });
    
      
        $show->field('marketing_of', __('Marketing of'))->as(function ($item) 
        {
            if ($item == "Other") {
                return $this->marketing_of_other ;
            }
            return $item;
        });
        $show->field('have_adequate_land', __('Have adequate land'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else
            {
                return "No";
            }
            return $item;
        });
        $show->field('have_adequate_storage', __('Have adequate storage'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } 
            else  
            {
                return "No";
            }
            return $item;
        });
        //check if land_size has a value and if it has a value then show it and if not then dont show it
        if ($form_sr4->land_size)
        {
            $show->field('land_size', __('Land size (In Acres)'));
        }
        //check if eqipment has a value and if it has a value then show it and if not then dont show it
        if ($form_sr4->eqipment) 
        {
            $show->field('eqipment', __('Equipment'));
        } 
        
        $show->field('have_adequate_equipment', __('Have adequate equipment'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } 
            else 
            {
                return "No";
            }
            return $item;
        });
        $show->field('have_contractual_agreement', __('Have contractual agreement'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } 
            else 
            {
                return "No";
            }
            return $item;
        });
        $show->field('have_adequate_field_officers', __('Have adequate field officers'))->as(function ($item)
         {
            if ($item) 
            {
                return "Yes";
            } 
            else 
            {
                return "No";
            }
            return $item;
        });
        $show->field('have_conversant_seed_matters', __('Have conversant seed matters'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('souce_of_seed', __('Souce of seed'))->as(function ($userId)
        {
            $u = Administrator::find($userId);
            if (!$u)
                return $userId;
            return $u->name . " - ID: " . $u->id;
        });
        $show->field('have_adequate_land_for_production', __('Have adequate land for production'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else 
            {
                return "No";
            }
            return $item;
        });
        $show->field('have_internal_quality_program', __('Have internal quality program'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('receipt', __('Receipt'))->file();

        $show->field('accept_declaration', __('Accepted declaration'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else 
            {
                return "No";
            }
        });
        //check if valid_from , valid_until are empty,if they are then dont show them
        if ($form_sr4->valid_from != null) 
        {
            $show->field('valid_from', __('Valid from'));
        }
        if ($form_sr4->valid_until != null) 
        {
            $show->field('valid_until', __('Valid until'));
        }
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {
            return Utils::tell_status($status);
        });
        
       //check if the status comment is null
       if($form_sr4->status_comment != null)
       {
           $show->field('status_comment', __('Status comment'));
       }
       else
       {
           $show->field('status_comment', __('Status comment'))->as(function ($status) 
           {
               return "No comment";
           });
       }
    

        Utils::take_action($form_sr4, $id ,'form-sr4s',$show);
        
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
        if ($form->isEditing()) 
        {
             //get request id
            $id = request()->route()->parameters()['form_sr4'];
            //get the form
             $formSr4 = FormSr4::find($id);
             //get the user
             $user = Auth::user();

             //checking the user before accessing the form to ensure the right user accesses the right form
            if (Admin::user()->isRole('basic-user'))
            {
            
                if ($user->id != $formSr4->administrator_id) 
                {
                    $form->html('<div class="alert alert-danger">You cannot edit this form </div>');
                    $form->footer(function ($footer) 
                    {

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
                else 
                {
                    $this->show_fields($form);
                }
            }
            
            //checking if the form has been inspected by the inspector if it is prevent him from editing it again
            elseif(Admin::user()->isRole('inspector'))
            {
                 if($formSr4->status != 2)
                {
                    $form->html('<div class="alert alert-danger">You cannot edit this form, please contact the commissioner to make any changes. </div>');
                    $form->footer(function ($footer) 
                    {

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
                else 
                {
                $this->show_fields($form);
                }
            }

            else 
            {
              $this->show_fields($form);
            }
        }

        // callback after save to return to table view controller after saving the form data 
        $form->saved(function (Form $form)
        {
            return redirect(admin_url('form-sr4s'));
        });


        if ($form->isCreating()) 
        {
    
            $this->show_fields($form);
        }
        
        //callback when saving to check if the type is already in the database
        if(Admin::user()->isRole('basic-user')){
        $form->saving(function (Form $form) 
        {
            $type = $form->type;
            $user = Auth::user();
            $form_sr4 = FormSr4::where('type', $type)->where('administrator_id', $user->id)->first();
            if ($form_sr4) 
            {
                
                    if($form->isEditing())
                    {
                        $form = request()->route()->parameters()['form_sr4'];
                        $formSr4 = FormSr4::find($form);
                      //count the number of forms with the same type
                        $count = FormSr4::where('type', $type)->where('administrator_id', $user->id)->count();
                        if($count)
                        {
                            //check if what is being passed to the form is the same as the one in the database
                            if($form_sr4->id == $formSr4->id)
                            {
                                return true;
                            }
                            else
                            {

                                if(!Utils::can_create_form($form_sr4))
                                {
                                    return  response(' <p class="alert alert-warning"> You cannot create a new SR4 form  while having PENDING one of the same category. <a href="/admin/form-sr4s"> Go Back </a></p> ');
                                }
                                
                                //check if its still valid
                                if (Utils::can_renew_app_form($form_sr4)) 
                                {
                                    return  response(' <p class="alert alert-warning"> You cannot create a new SR4 form  while having VALID one of the same category. <a href="/admin/form-sr4s"> Go Back </a></p> ');   
                                }
                            }
                        }
                        else
                        {
                            return response(' <p class="alert alert-danger">Form Not Found </p>');
                        }

                    }
                    //check if the status of the form is pending, rejected,halted or accepted
                    if(!Utils::can_create_form($form_sr4))
                    {
                        return  response(' <p class="alert alert-warning"> You cannot create a new SR4 form  while having PENDING one of the same category. <a href="/admin/form-sr4s/create"> Go Back </a></p> ');

                    }
                    
                    //check if its still valid
                    if (Utils::can_renew_app_form($form_sr4)) 
                    {
                        
                        return  response(' <p class="alert alert-warning"> You cannot create a new SR4 form  while having VALID one of the same category. <a href="/admin/form-sr4s/create"> Go Back </a></p> ');   
                    }
                    $form->accept_declaration = 1;
                   
            }
          
                     
        });
    }

        //disable tool buttons
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            
        });

        return $form;
    
    }


    public function show_fields($form)
    {
    
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            
        });

        $form->setWidth(8, 4);  
        Admin::style('.form-group  {margin-bottom: 25px;}');

        $user = Auth::user();

        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } 

        //basic-user form fields
        if (Admin::user()->isRole('basic-user')) 
        {

            $form->select('type', __('Application category?'))
            ->options
            ([
                'Seed Merchant/Company' => 'Seed Merchant/Company',
                'Seed Dealer/importer/exporter' =>   'Seed Dealer/importer/exporter',
               
            
            ])
            ->help('Which SR4 type are you applying for?')
            ->rules('required');

            $form->text('name_of_applicant', __('Name of applicant Company'))->default($user->name);
            $form->text('address', __('Address'))->required();
            $form->text('phone_number', __('Phone number'));
            $form->text('company_initials', __('Company initials'))->required();
            $form->text('premises_location', __('Premises location'));
            $form->number('years_of_expirience', __('Years of experience'))
                ->required();
            $form->text('expirience_in', __('Experience as?'))
            ->rules('required');

            $form->html('<h3>I/We wish to apply for a certificate as a Seed Merchant/Company/Dealer/importer/exporter </h3>');
            $form->radio('dealers_in', __('Applicant is applying for production of?'))
                 ->options
            ([
                'Agricultural crops' => 'Agricultural crops',
                'Horticultural crops' => 'Horticultural crops',
                'Both crops' => 'Both crops',
                'Other' => 'Other',
                'NA' => 'NA'
            ])
            ->help("Applies only if you are a Merchant or Producer")
            ->when('Other', function (Form $form) 
            {
                $form->text('dealers_in_other', 'Please specify what you are producing')
                    ->help('Please Specify if you selected "Other" production.')->rules('required');
            });

            $form->radio('marketing_of', __('Applicant is applying for marketing of?'))
                ->options
                ([
                    'Agricultural crops' => 'Agricultural crops',
                    'Horticultural crops' => 'Horticultural crops',
                    'Both crops' => 'Both crops',
                    'Other' => 'Other',
                    'NA' => 'NA'
                ])
                ->required()

                ->when('Other', function (Form $form) 
                {
                    $form->text('marketing_of_other', __('Applicant is applying for Other marketing of?'))
                        ->help('Please Specify if you selected "Other" marketing.');
                });


            $form->radio('have_adequate_land', 'Do you have adequate land to handle basic seed?')
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])->help("Applies only if you are a Merchant or Producer")

                ->when('1', function (Form $form) 
                {
                    $form->text('land_size', 'Specify Land size. (in Acres)')
                        ->help("Please specify land (in Acres)")
                        ->attribute('min', 1);
                });


            $form->radio('have_adequate_storage', 'I/We have adequate storage facilities to handle the resultant seed:')
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])->required();

            $form->radio('have_adequate_equipment', 'Do you have adequate equipment to handle basic seed?')
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])->help("Applies only if you are a Merchant or Producer")

                ->when('1', function (Form $form) 
                {
                    $form->text('eqipment', 'specify the equipment')
                        ->help("Please specify the equipment");
                });

            $form->radio('repackage_equipment', 'Do you have adequate equipment to process and repackage seed?')
            ->options
            ([
                '1' => 'Yes',
                '0' => 'No',
                '2' => 'NA'
            ]);


            $form->radio('have_contractual_agreement', 'Do you have contractual agreement with the growers you have recruited?')
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->radio('have_adequate_field_officers', 'Do you have adequate field officers to supervise and advise growers on all operation of seed production?')
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->radio(
                'have_conversant_seed_matters',
                __('Do you have adequate and knowledgeable personnel who are conversant with seed matters?'))
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();
            
            $form->text('souce_of_seed', __('What is your souce of seed?'))->required();
    
            $form->radio('have_adequate_land_for_production', __('Do you have adequate land for production of basic seed?'))
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->radio('have_internal_quality_program', __('Do you have an internal quality program?') )
                ->options
                ([
                    '1' => 'Yes',
                    '0' => 'No',
                    '2' => 'NA'
                ])
                ->required();

            $form->file('receipt', __('Receipt'))
            ->help('Attach a copy of your proof of payment,it should be in pdf, jpg or jpeg format and less than 500KB in size.')
            ->required();

            if(Utils::check_inspector_remarks())
            {
            $form->textarea('status_comment', __('Inspector\'s remarks.'))->readonly();
            }

            $form->divider();
            $form->html('<h4>Declaration:</h4>
                <p>I/WE* AT ANY TIME DURING OFFICIAL WORKING HOURS EVEN WITHOUT previous 
                appointment will allow the inspectors entry to the seed stores and thereby provide 
                them with the facilities necessary to carry out their inspection work as laid
                 out in the seed and plant regulations, 2015.I/We further declare that I/We am/are 
                 conversant with the Regulations. In addition I/We will send a list of all seed lots
                  in our stores on a given date and/or at such a date as can be mutually agreed upon between 
                  the National Seed Certification Service and ourselves.</p> ');

            $form->hidden('accept_declaration', __('Accept declaration') )->required();
            $form->html('<input type="checkbox" name="accept_declaration" value="1" required>  I Accept');

                
        }
        
        // administrator form fields
        if (Admin::user()->isRole('admin')) 
        {
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();
            $form->text('type', __('Applicant type'))->readonly(); 
            $form->display('recommendation', __('Inspector\'s comment (Remarks)'))->default('non')->readonly();
            $form->divider();
            $form->radio('status', __('Action'))
                ->options
                ([
                    
                    '2' => 'Assign Inspector',
                    '3' => 'Halted',
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()

                ->when('2', function (Form $form) 
                {
                    $items = Administrator::all();
                    $_items = [];
                    foreach ($items as $key => $item) 
                    {
                        if (!Utils::has_role($item, "inspector")) 
                        {
                            continue;
                        }
                        $_items[$item->id] = $item->name;
                    }
                    $form->select('inspector_id', __('Inspector'))
                        ->options($_items)
                        ->help('Please select inspector')
                        ->rules('required');
                })
                
                ->when('in', [3, 4], function (Form $form) 
                {
                    $form->textarea('status_comment', 'Inspector\'s comment (Remarks)')
                        ->help("Please specify with a comment");
                })

                ->when('5', function (Form $form) 
                {
                    $form_id = request()->route()->parameters()['form_sr4'];
                    $type = FormSr4::find($form_id)->type;
                    
                    $abbreviations = [
                        'Seed Merchant/Company' => 'MER',
                        'Seed Dealer/importer/exporter' =>   'STK',
                        
                    ];
                    
                    $abbreviation = $abbreviations[$type] ?? ''; 
                    
                    $form->text('seed_board_registration_number', __('Enter Seed Board Registration number'))
                        ->help("Please Enter seed board registration number")
                        ->default("MAAIF" ."/".$abbreviation."/".mt_rand(0000, 9999)."/". date('Y'));
                    $form->date('valid_from', 'Valid from date?')->default(Carbon::now())->readonly();
                    $nextYear = Carbon::now()->addYear(); // Get the date one year from now
                    $defaultDateTime = $nextYear->format('Y-m-d H:i:s'); // Format the date for default value
                    
                    $form->date('valid_until', 'Valid until date?')
                        ->default($defaultDateTime)
                        ->readonly();
                   
                });
        }


        // inspector form fields
        if (Admin::user()->isRole('inspector')) 
        {
            $form->text('type', __('Applicant type'))->readonly();
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('company_initials', __('Company initials'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();
            $form->file('receipt', __('Receipt'))->readonly(); 
            $form->radio('status', __('Status'))
                ->options
                ([ 
                    '18' => 'Recommended',
                     '4' => 'Rejected',
                    
                ])
                ->required()
             
                ->when('4', function (Form $form) 
                {
                    $form->textarea('status_comment', 'Inspector\'s comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('18', function (Form $form) 
                {
                   $form->textarea('recommendation', 'Recommendation')
                        ->help("Please specify with a comment");
                   
                });

        }


        $form->footer(function ($footer) 
        {

            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableCreatingCheck();
            $footer->disableEditingCheck();
        });

        

    }
}