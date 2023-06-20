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

        //disable batch delete
        $grid->batchActions(function ($batch) 
        {
            $batch->disableDelete();
        });

        //check if the role is an inspector and has been assigned that form
        //return an empty table if the inspector has not been assigned any forms
        if (Admin::user()->isRole('inspector'))  
        {
            $grid->model()->where('inspector', '=', Admin::user()->id);
               
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
        
        $grid->column('name_of_applicant', admin_trans("Name of Applicant"))->sortable();

        $grid->column('created_at', admin_trans('Created'))->display(function ($item) 
        {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('type', admin_trans('Application Category'))->sortable();

        $grid->column('status', admin_trans('Status'))->display(function ($status) 
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
        $grid->column('valid_from', admin_trans("Starts"))->sortable();
        $grid->column('valid_until', admin_trans("Expires"))->sortable();
        };

        $grid->column('administrator_id', admin_trans('Created by'))->display(function ($userId) 
        {
            $u = Administrator::find($userId);
            if (!$u)
                return "-";
            return $u->name;
        })->sortable();

        $grid->column('address', admin_trans('Address'))->sortable();
        $grid->column('inspector', admin_trans('Inspector'))->display(function ($userId) 
        {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();

        $grid->filter(function($search_param)
        {
            $search_param->disableIdfilter();
            $search_param->like('name_of_applicant', admin_trans("Search by Name of Applicant"));
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

            
        return view('reports.form_sr4_report',  [
            'form' => $form_sr4,
        ]);

        $show->field('type', __('Application Category'));

        //check if seed board registration number is empty,if it is then dont show it
        if ($form_sr4->seed_board_registration_number != null) 
        {
            $show->field('seed_board_registration_number', admin_trans('Seed board registration number'));
        }
        $show->field('name_of_applicant', admin_trans('Name of applicant'));
        $show->field('address', admin_trans('Address'));
        $show->field('company_initials', admin_trans('Company initials'));
        $show->field('premises_location', admin_trans('Premises location'));
        $show->field('expirience_in', admin_trans('Experience in'));
        $show->field('years_of_expirience', admin_trans('Years of experience'))->as(function ($item)
        {
            return $item . " Years";
        });
        $show->field('dealers_in', admin_trans('Dealers in'))->as (function($item)
        {
            if($item == "Other"){
                return $this->dealers_in_other ;
            }
            return $item;
        });
    
      
        $show->field('marketing_of', admin_trans('Marketing of'))->as(function ($item) 
        {
            if ($item == "Other") {
                return $this->marketing_of_other ;
            }
            return $item;
        });
        $show->field('have_adequate_land', admin_trans('Have adequate land'))->as(function ($item) 
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
        $show->field('have_adequate_storage', admin_trans('Have adequate storage'))->as(function ($item) 
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
            $show->field('land_size', admin_trans('Land size (In Acres)'));
        }
        //check if eqipment has a value and if it has a value then show it and if not then dont show it
        if ($form_sr4->eqipment) 
        {
            $show->field('eqipment', admin_trans('Equipment'));
        } 
        
        $show->field('have_adequate_equipment', admin_trans('Have adequate equipment'))->as(function ($item) 
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
        $show->field('have_contractual_agreement', admin_trans('Have contractual agreement'))->as(function ($item) 
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
        $show->field('have_adequate_field_officers', admin_trans('Have adequate field officers'))->as(function ($item)
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
        $show->field('have_conversant_seed_matters', admin_trans('Have conversant seed matters'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('souce_of_seed', admin_trans('Souce of seed'))->as(function ($userId)
        {
            $u = Administrator::find($userId);
            if (!$u)
                return $userId;
            return $u->name . " - ID: " . $u->id;
        });
        $show->field('have_adequate_land_for_production', admin_trans('Have adequate land for production'))->as(function ($item) 
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
        $show->field('have_internal_quality_program', admin_trans('Have internal quality program'))->as(function ($item) 
        {
            if ($item) 
            {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('receipt', admin_trans('Receipt'))->file();

        $show->field('accept_declaration', admin_trans('Accepted declaration'))->as(function ($item) 
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
            $show->field('valid_from', admin_trans('Valid from'));
        }
        if ($form_sr4->valid_until != null) 
        {
            $show->field('valid_until', admin_trans('Valid until'));
        }
        $show->field('status', admin_trans('Status'))->unescape()->as(function ($status) 
        {
            return Utils::tell_status($status);
        });

       //check if the status comment is null
       if($form_sr4->status_comment != null)
       {
           $show->field('status_comment', admin_trans('Status comment'));
       }
       else
       {
           $show->field('status_comment', admin_trans('Status comment'))->as(function ($status) 
           {
               return "No comment";
           });
       }
    

        if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            //check the status of the form being shown
            if($form_sr4->status == 1 || $form_sr4->status == 2 || $form_sr4->status == null)
            {
            $show->field('id','Action')->unescape()->as(function ($id) 
            {
                return "<a href='/admin/form-sr4s/$id/edit' class='btn btn-primary'>Take Action</a>";
            });
            }
        }

        if (Admin::user()->isRole('basic-user')) 
        {
            if($form_sr4->status == 3 || $form_sr4->status == 4)
            {
                $show->field('id','Action')->unescape()->as(function ($id) 
                {
                    return "<a href='/admin/form-sr4s/$id/edit' class='btn btn-primary'>Take Action</a>";
                });
            }
        }
        
            //return $show;
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
                    $form->html('<div class="alert alert-danger">You cannot edit this form, please commit the commissioner to make any changes. </div>');
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
                        if($count > 1)
                        {
                           
                        }
                        elseif($count == 1)
                        { 
                            return  response(' <p class="alert alert-warning"> You cannot create a new SR4 form  while having PENDING one of the same category. <a href="/admin/form-sr4s"> Go Back </a></p> ');
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
                        else{
                             return true;
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

        return $form;
    
    }


    public function show_fields($form)
    {
    
        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            $tools->disableView();
        });

        $form->setWidth(8, 4);  
        Admin::style('.form-group  {margin-bottom: 25px;}');

        $user = Auth::user();

        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else 
        {
            $form->hidden('administrator_id', __('Administrator id'));
        }

        //basic-user form fields
        if (Admin::user()->isRole('basic-user')) 
        {

            $form->select('type', __('Application category?'))
            ->options
            ([
                'Seed Producer' => 'Seed Producer',
                'Seed Stockist' => 'Seed Stockist',
                'Seed Importer' => 'Seed Importer',
                'Seed Exporter' => 'Seed Exporter',
                'Seed Processor' => 'Seed Processor',
            ])
            ->help('Which SR4 type are you applying for?')
            ->rules('required');

            $form->text('name_of_applicant', admin_trans('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', admin_trans('Address'))->required();
            $form->text('company_initials', admin_trans('Company initials'))->required();
            $form->text('premises_location', admin_trans('Premises location'));
            $form->text('years_of_expirience', admin_trans('Years of experience'))
                ->required();
            $form->select('expirience_in', admin_trans('Experience in?'))
                ->options
            ([
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
                 ->options
            ([
                'Agricultural crops' => 'Agricultural crops',
                'Horticultural crops' => 'Horticultural crops',
                'Other' => 'Other',
                'NA' => 'NA'
            ])
            ->required()

            ->when('Other', function (Form $form) 
            {
                $form->text('dealers_in_other', 'Applicant is applying for Other Production of?')
                    ->help("Please specify Production that you are applying for");
            });

            $form->radio('marketing_of', __('Applicant is applying for marketing of?'))
                ->options
                ([
                    'Agricultural crops' => 'Agricultural crops',
                    'Horticultural crops' => 'Horticultural crops',
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
                ])->required()

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
                ])->required()

                ->when('1', function (Form $form) 
                {
                    $form->text('eqipment', 'specify the equipment')
                        ->help("Please specify the equipment");
                });


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
                __('Do you have adequate and knowledgeable personal who are conversant with seed matters?'))
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

            $form->file('receipt', __('Receipt'))->required();

            if(Utils::check_inspector_remarks())
            {
            $form->textarea('status_comment', __('Inspector\'s remarks.'))->readonly();
            }

            $form->divider();
            $form->html(admin_trans('sr4_declaration'));

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
            $form->divider();
            $form->radio('status', __('Action'))
                ->options
                ([
                    '2' => 'Assign Inspector',
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
                        $_items[$item->id] = $item->name . " - " . $item->id;
                    }
                    $form->select('inspector', __('Inspector'))
                        ->options($_items)
                        ->help('Please select inspector')
                        ->rules('required');
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
                    '3' => 'Halted',
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()
             
                ->when('in', [3, 4], function (Form $form) 
                {
                    $form->textarea('status_comment', 'Inspector\'s comment (Remarks)')
                        ->help("Please specify with a comment");
                })

                ->when('5', function (Form $form) 
                {
                    $form->text('seed_board_registration_number', __('Enter Seed Board Registration number'))
                        ->help("Please Enter seed board registration number")
                        ->default("MAAIF" ."/". date('Y') ."/". "SC". "/". mt_rand(10000000, 99999999));
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });
        }


        $form->footer(function ($footer) 
        {

            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableCreatingCheck();
        });

        

    }
}
