<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\FormSr6;
use App\Models\FormSr6HasCrop;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Illuminate\Support\Facades\Auth;
use App\Admin\Actions\Post\Renew;

class FormSr6Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Form SR6 - Seed Growers'; 

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
       
        $grid = new Grid(new FormSr6());

        $grid->filter(function($search_param)
        {
            $search_param->disableIdfilter();
            $search_param->like('name_of_applicant', __("Search by Name of Applicant"));
        });

        //disable export button
        $grid->disableExport();
        $grid->disableColumnSelector();

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
                    $status == 2 ||  // Inspection assigned
                    $status == 5 ||  // Accepted
                    $status == 6     // Expired
                ) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
                if (
                    $status == 3 ||
                    $status == 4
                ) {
                    $actions->disableDelete();
                }
                if(Utils::check_expiration_date('FormSr6',$this->getKey()))
                {
                    
                    $actions->add(new Renew(request()->segment(count(request()->segments()))));
                
                }
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


        $grid->column('created_at', __('Created'))->display(function ($item) 
        {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();
        $grid->column('type', __('Category'))->sortable();

        $grid->column('status', __('Status'))->display(function ($status) 
        {
            //check expiration date
            if (Utils::check_expiration_date('FormSr6',$this->getKey())) 
            {
                return Utils::tell_status(6);
            } else{
                return Utils::tell_status($status);
            }
        })->sortable();

       
        if(Utils::is_form_accepted('FormSr6'))
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
        
        $grid->column('inspector', __('Inspector'))->display(function ($userId) 
        {
            if (Admin::user()->isRole('basic-user')) 
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
        $form_sr6 = FormSr6::findOrFail($id);

        //Delete a notification once a user has viewed it
        if(Admin::user()->isRole('basic-user') )
        {
            if($form_sr6->status == 2 || $form_sr6->status == 3 || $form_sr6->status == 4 || $form_sr6->status == 5)
            {
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'FormSr6'])->delete();
            }
        }

        $show = new Show(FormSr6::findOrFail($id));
        $show->panel()->tools(function ($tools) 
        {
                $tools->disableEdit();
                $tools->disableDelete();
        });;

        $show->field('created_at', __('Created at'))->as(function ($item) 
        {
                if (!$item) 
                {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
        });
        $show->field('administrator_id', __('Created by'))->as(function ($userId) 
        {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
        });
        
        if ($form_sr6->registration_number != null) 
        {
            $show->field('registration_number', __('Seed board registration number'));
        }
        $show->field('name_of_applicant', __('Name of applicant'));
        $show->field('address', __('Address'));
        $show->field('premises_location', __('Premises location'));
        $show->field('years_of_expirience', __('Years of experience'))->as(function ($item)
            {
                return $item . " Years";
            });
        
        $show->field('form_sr6_has_crops', __('Crops'))
        ->unescape()
        ->as(function ($item) 
        {
        
            if (!$this->form_sr6_has_crops) 
            {
                return "None";
            }

            $headers = ['Crops'];
            $rows = array();
            foreach ($this->form_sr6_has_crops as $key => $val) 
            {
                
                $row['crop'] = $val->crops->name;
                $rows[] = $row;
            }

            $table = new Table($headers, $rows);
            return $table;
        });
        $show->field('cropping_histroy', __('Land histroy'));
        $show->field('have_adequate_isolation', __('Have adequate isolation'))->as(function ($item) 
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
        $show->field('have_adequate_labor', __('Have adequate labor'))->as(function ($item) 
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
        $show->field('aware_of_minimum_standards', __('Aware of minimum standards'))->as(function ($item) 
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
        $show->field('signature_of_applicant', __('Attach receipt'))->file();
        if($form_sr6->grower_number != null){
            $show->field('grower_number', __('Grower number'));
        }
        
        if ($form_sr6->valid_from != null && $form_sr6->valid_from != null) 
        {
            $show->field('valid_from', __('Valid from'));
            $show->field('valid_until', __('Valid until'));
        }
        
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {
            return Utils::tell_status($status);
        });
        //check if the status comment is null
        if($form_sr6->status_comment != null)
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

    
       if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            //check the status of the form being shown
            if($form_sr6->status == 1 || $form_sr6->status == 2 || $form_sr6->status == null)
            {
                $show->field('id','Action')->unescape()->as(function ($id) 
                {
                    return "<a href='/admin/form-sr6s/$id/edit' class='btn btn-primary'>Take Action</a>";
                });
            }
        }

        if (Admin::user()->isRole('basic-user')) 
        {
            if($form_sr6->status == 3 || $form_sr6->status == 4)
            {
                $show->field('id','Action')->unescape()->as(function ($id) 
                {
                    return "<a href='/admin/form-sr6s/$id/edit' class='btn btn-primary'>Take Action</a>";
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
        $form = new Form(new FormSr6());
        $user = Auth::user();
        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } 
        else 
        {
            $form->hidden('administrator_id', __('Administrator id'));
        }

         //check the id of the user before editing the form
        if ($form->isEditing()) 
        {
             //get request id
             $id = request()->route()->parameters()['form_sr6'];
             //get the form
             $formSr6 = FormSr6::find($id);
             //get the user
             $user = Auth::user();
            if (Admin::user()->isRole('basic-user')) 
            {
               
                if ($user->id != $formSr6->administrator_id) 
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
               
            }

            //the inspector shouldnt be able to inspect a form once its submitted
            if(Admin::user()->isRole('inspector'))
            {
                if($formSr6->status != 2)
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
            }
           
        }

        // callback after save to return to table view controller after saving the form data 
        $form->saved(function (Form $form) 
        { 
            return redirect(admin_url('form-sr6s'));
        });

        //callback when saving to check if the type is already in the database
        $form->saving(function (Form $form) 
        {
            $type = $form->type;
            $user = Auth::user();
            $form_sr6 = FormSr6::where('type', $type)->where('administrator_id', $user->id)->first();
            if ($form_sr6) 
            {
                
                    if($form->isEditing())
                    {
                        $form = request()->route()->parameters()['form_sr6'];
                        $formSr6 = FormSr6::find($form);
                      //count the number of forms with the same type
                        $count = FormSr6::where('type', $type)->where('administrator_id', $user->id)->count();
                        if($count)
                        {
                            //check if what is being passed to the form is the same as the one in the database
                            if($form_sr6->id == $formSr6->id)
                            {
                                return true;
                            }
                            else
                            {

                                if(!Utils::can_create_form($form_sr6))
                                {
                                    return  response(' <p class="alert alert-warning"> You cannot create a new SR6 form  while having PENDING one of the same category. <a href="/admin/form-sr6s"> Go Back </a></p> ');
                                }
                                
                                //check if its still valid
                                if (Utils::can_renew_app_form($form_sr6)) 
                                {
                                    return  response(' <p class="alert alert-warning"> You cannot create a new SR6 form  while having VALID one of the same category. <a href="/admin/form-sr6s"> Go Back </a></p> ');   
                                }
                            }
                        }
                        else
                        {
                            return response(' <p class="alert alert-danger">Form Not Found </p>');
                        }

                    }
                    //check if the status of the form is pending, rejected,halted or accepted
                    if(!Utils::can_create_form($form_sr6))
                    {
                        return  response(' <p class="alert alert-warning"> You cannot create a new SR6 form  while having PENDING one of the same category. <a href="/admin/form-sr6s/create"> Go Back </a></p> ');

                    }
                    
                    //check if its still valid
                    if (Utils::can_renew_app_form($form_sr6)) 
                    {
                        
                        return  response(' <p class="alert alert-warning"> You cannot create a new SR6 form  while having VALID one of the same category. <a href="/admin/form-sr6s/create"> Go Back </a></p> ');   
                    }

                   
            }
                     
        });
  

        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            $tools->disableView();
        });
        $form->setWidth(8, 4);
        Admin::style('.form-group  {margin-bottom: 25px;}');


       //form fields fo the basic-user
        if (Admin::user()->isRole('basic-user')) 
        {
            $form->select('type', __('Category'))
            ->options([
                'Seed Grower' => 'Seed Grower',
                'Seed Company' => 'Seed Company',
                'Seed Breeder' => 'Seed Breeder',
            ])
            ->rules('required');

            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->required()->required();
            $form->text('company_initials', __('Company initials'))->required();
            $form->text('address', __('Address'))->required();
            $form->text('premises_location', __('Premises location'))->required();
            $form->text('years_of_expirience', __('Years of experience as seed grower'))
                 ->required();
            
            $form->html('<h3>I/We wish to apply for a license to produce seed as indicated below:</h3>');

            $form->hasMany('form_sr6_has_crops',__('Click on New to Add Crops'),
                function (NestedForm $form)
                {   
                    $_items = [];
                    foreach (Crop::all() as $key => $item) 
                    {
                        $_items[$item->id] = $item->name . " - " . $item->id;
                    }
                    $form->select('crop_id', 'Add Crop')->options(Crop::all()->pluck('name', 'id'))->required();
                    
                });   

            $form->radio('seed_grower_in_past', __('I/We have/has not been a seed grower in the past?') )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required()
                ->when('1', function (Form $form) 
                {
                    $form->text('previous_grower_number', __('Enter Previous grower number'))
                    ->help("Please specify Previous grower number");
                });

            $form->textarea('cropping_histroy', __('The field where i intend to grow the seed crop was previously under (Crop history for the last three season or years)'))->required();

            $form->radio('have_adequate_storage', 'I/We have adequate storage facilities to handle the resultant seed:')
            ->options([
                '1' => 'Yes',
                '0' => 'No',
            ])->required(); 

            $form->radio('have_adequate_isolation', __('Do you have adequate isolation?'))
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->radio('have_adequate_labor', __('Do you have adequate labor to carry out all farm operations in a timely manner?'))
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->radio('aware_of_minimum_standards', __('Are you aware that only seed that meets the minimum standards shall be accepted as certified seed?'))
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->file('signature_of_applicant', __('Attach receipt'))->required();
        }

        if (Admin::user()->isRole('admin')) 
        {
            $form->text('name_of_applicant', __('Name of applicant/Company'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();

            $form->divider();
            $form->radio('status', __('Action'))
                ->options([
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
                        $_items[$item->id] = $item->name;
                    }
                    $form->select('inspector', __('Inspector'))
                        ->options($_items)
                        ->help('Please select inspector')
                        ->rules('required');
                });
               
        }

       
        if (Admin::user()->isRole('inspector')) 
        {
            $form->text('type', __('Cateogry'));
            $form->text('name_of_applicant', __('Name of applicant/Company'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('premises_location', __('Location of Farm'))->readonly();
            $form->radio('status', __('Status'))
                ->options([
                    '3' => 'Halted',
                    '4' => 'Rejected',
                    '5' => 'Accepted', 
                ])
                ->required()
                
                ->when('in', [3, 4], function (Form $form) 
                {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('5', function (Form $form) 
                {

                    $form->text('grower_number', __('Grower number'))
                         ->default("Grower" ."/". date('Y') ."/". mt_rand(10000000, 99999999))->readonly()
                         ->help("Please Enter grower number");
                    $form->date('valid_from', 'Valid from date');
                    $form->date('valid_until', 'Valid until date');

                    $form->text('registration_number', __('Enter Seed Board Registration number'))
                        ->help("Please Enter seed board registration number")
                        ->default("MAAIF" ."/". date('Y') ."/". "SG". "/". mt_rand(10000000, 99999999))->readonly();
                });
        }
        $form->footer(function ($footer) 
        {

            // disable `View` checkbox
            $footer->disableViewCheck();
            // disable `reset` button
            $footer->disableReset();

            // disable `Continue editing` checkbox
            $footer->disableEditingCheck();

            

        });

        return $form;

       
    }
}