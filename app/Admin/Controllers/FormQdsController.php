<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\FormQds;
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

class FormQdsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Quality Declared Seed (QDS) Producers';  

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormQds());
        $qdss = FormQds::where('administrator_id', auth('admin')->user()->id)->get();

        $grid->filter(function ($filter) 
        {
         // Remove the default id filter
         $filter->disableIdFilter();
         $filter->like('administrator_id', 'Applicant')->select(\App\Models\User::pluck('name', 'id'));
        
        });
        //disable export button
        $grid->disableExport();

        $grid->disableColumnSelector();

        //check if the role is an inspector and has been assigned that form
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
              
                //add a renewal button
              
                if(Utils::check_expiration_date('FormQds',$this->getKey()))
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


        $grid->column('created_at', __('Created'))->display(function ($item) 
        {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('status', __('Status'))->display(function ($status) 
        {
            //check expiration date
            if (Utils::check_expiration_date('FormQds',$this->getKey())) 
            {
                return Utils::tell_status(6);
            } else
            {
                return Utils::tell_status($status);
            }
        })->sortable();

        if(Utils::is_form_accepted('FormQds'))
        {
            $grid->column('valid_from', __("Starts"))->sortable();
            $grid->column('valid_until', __("Expires"))->sortable();
        }

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
            if (Admin::user()->isRole('basic-user')) 
            {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();

            $grid->column('id', __('Certificate'))->display(function ($id) {
                $qds  = FormQds::find($id);
            
                if ($qds && $qds ->status == '5') {
                    $link = url('qds?id=' . $id);
                    return '<b><a target="_blank" href="' . $link . '">Print Certificate</a></b>';
                } else {
                    
                    return '<b>Unavailable</b>';
                }
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
        $form_qds = FormQds::findOrFail($id);

        //delete a notification once a user has viewed the notification
        if(Admin::user()->isRole('basic-user') )
        {
            if($form_qds->status == 2 || $form_qds->status == 3 || $form_qds->status == 4 || $form_qds->status == 5)
            {
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'FormQds'])->delete();
            }
        }
        $show = new Show(FormQds::findOrFail($id));

        $show->panel()->tools(function ($tools) 
        {
                $tools->disableEdit();
                $tools->disableDelete();
        });

        $show->field('created_at', __('Created at'))
            ->as(function ($item) 
            {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('name_of_applicant', __('Name of applicant'));
        $show->field('address', __('Address'));
        $show->field('phone_number', __('Phone number'));
        $show->field('farm_location', __('Farm location'));
        $show->field('years_of_expirience', __('Years of experience'))->as(function ($item) 
        {
            return $item . " years";
        });
        $show->field('qds_has_crops', __('Crops'))
        ->unescape()
        ->as(function ($item) 
        {
        
            if (!$this->qds_has_crops) 
            {
                return "None";
            }

            $headers = ['Crops'];
            $rows = array();
            foreach ($this->qds_has_crops as $key => $val) 
            {
                
                $row['crop'] = $val->crops->name;
                $rows[] = $row;
            }

            $table = new Table($headers, $rows);
            return $table;
        });
        $show->field('cropping_histroy', __('Cropping histroy'));
        $show->field('have_adequate_isolation', __('Have adequate isolation'))
            ->as(function ($item) 
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
        if($form_qds->isolation_distance != null)
       {
        $show->field('isolation_distance', __('Isolation distance'));
       }
        $show->field('have_adequate_labor', __('Have adequate labor'))->as(function ($item)
        {
            if ($item) 
            {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        if($form_qds->have_adequate_labor)
        {
            $show->field('number_of_labors', __('Number of labourers'));
        }
       
        $show->field('aware_of_minimum_standards', __('Aware of minimum standards'))
            ->as(function ($item) 
            {
                if ($item) {
                    return "Yes";
                } else {
                    return "No";
                }
                return $item;
            });
          
        $show->field('recommendation', __('Recommendation letter'))->file();
        $show->field('certification', __('Certificate of registration'))->file();
        
        $show->field('signature_of_applicant', __('Receipt'))->file();

        if($form_qds->grower_number != null)
        {
        $show->field('grower_number', __('Grower number'));
        }

        if ($form_qds->registration_number != null) 
        {
            $show->field('registration_number', __('Seed board registration number'));
        }
        if ($form_qds->valid_from != null && $form_qds->valid_from != null) 
        {
            $show->field('valid_from', __('Valid from'));
            $show->field('valid_until', __('Valid until'));
        }
        $show->field('status', __('Status'))
            ->unescape()
            ->as(function ($status) 
            {
                return Utils::tell_status($status);
            });
        if($form_qds->status_comment != null)
        {
            $show->field('inspector_comment', __('Inspector\'s comment (Remarks)'));
        }
        //check if the status comment is null
        if($form_qds->status_comment != null)
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


        Utils::take_action($form_qds, $id ,'form-qds',$show);

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FormQds());
       

        if ($form->isCreating()) 
        {

            if (!Utils::can_create_qds()) 
            {
                return admin_warning("Warning", "You cannot create a new QDS form while still having a pending one. <a href='/admin/form-qds'> Go Back </a>");
                
            }
            if (Utils::can_renew_form('FormQds')) 
            {
                return admin_warning("Warning", "You cannot create a new QDs form  while still having a valid one. <a href='/admin/form-qds'> Go Back </a>");
            
            }
            $user = Auth::user();
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        }   
        else 
        {
            $form->hidden('administrator_id', __('Administrator id'));
        }

        // If the user refreshes the page again, the code detects that the page has already been refreshed,
        // and prevents the code block from executing again. 
        // This prevents unnecessary session variable initialization and ensures that the page behaves as expected.
        session_start(); 
        if (!isset($_SESSION['sr6_refreshed'])) 
        {
            $_SESSION['sr6_refreshed'] = "yes";
            $my_uri = $_SERVER['REQUEST_URI'];
            Admin::script('window.location.href="' . $my_uri . '";');
        } else 
        {
            unset($_SESSION['sr6_refreshed']);
        }

        // callback after save to return to table view controller after saving the form data 
        $form->saved(function (Form $form)
        {  
             return redirect(admin_url('form-qds'));
        });


        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            $tools->disableView();
        });

        $form->setWidth(8, 4);
        Admin::style('.form-group  {margin-bottom: 25px;}');

        $user = Auth::user();
        //basic_user form fields
        if (Admin::user()->isRole('basic-user')) 
        {
            $form->text('name_of_applicant', __('Name of applicant'))
            ->default($user->name)->required();
            $form->text('address', __('Address'))->required();
            $form->text('phone_number', __('Phone number'))->required();
            $form->text('farm_location', __('Farm location'))->required();
            $form->text('years_of_expirience', __('Years of experience as a quality declared seed (QDS) grower'))
                ->attribute('type', 'number')
                ->required();

            if ($form->isEditing()) 
            {
                //check if the form is being edited by the user who created it
                $sec  = ((int)(request()->segment(3)));
                $formQds = FormQds::find($sec);
                if ($user->id != $formQds->administrator_id) 
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

            $form->html('<h3>I/We wish to apply for a license to produce quality declared seed (QDS) as indicated below:</h3>');
            $form->hasMany('qds_has_crops',__('Click on "New" to Add Crops'), function (NestedForm $form) 
                {   
                   
                    $form->select('crop_id','Select Crop')->options( Crop::where('qds', 1)->pluck('name','id') )
                    ->required();
                });

            $form->radio('have_been_qds', __('Have you been a QDS producer in the past?'))
                ->options([
                    '1' => 'Yes',
                    '2' => 'No',
                ])
                ->required()
                ->when('1', function (Form $form) 
                {
                    $form->text('previous_grower_number', __('Specify QDS grower number:'));
                });


            $form->radio('have_adequate_storage_facility', __('Do you have adequate storage facilities to handle the resultant seed?'))
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->textarea('cropping_histroy', __('The field where I intend to grow the seeds was previously under? (Give it\'s cropping history)'))->required();

            $form->radio('have_adequate_isolation', __('Do you have adequate isolation?') )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->when('1', function (Form $form) 
                {
                    $form->text('isolation_distance', __('Specify isolation distance (in Meters)'))->attribute(['type' => 'number']);
                })
                ->required();


            $form->radio('have_adequate_labor', __('Do you have adequate labor to carry out all farm operations in a timely manner?') )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->when('1', function (Form $form) 
                {
                    $form->text('number_of_labors', __('Specify number of laborers'))->attribute(['type' => 'number']);
                })
                ->required();

            $form->radio('aware_of_minimum_standards',
                __('Are you aware that only seed that meets the minimum standards shall be accepted as certified seed?'))
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();
            $form->file('recommendation', __('Upload recommendation letter from DAO'))->required();
            $form->file('certification', __('Upload certificate of registration'))->required();   
            $form->file('signature_of_applicant', __('Upload payment receipt'))->required();
            $form->html('<p style="color: green;">If this application is successful, you will be required to finish the details of the crop in Form QDS R3</p>');

            
        }

        //administrator form fields
        if (Admin::user()->isRole('admin')) 
        {
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('phone_number', __('Phone number'))->readonly();
            $form->text('farm_location', __('Farm location'))->readonly();
            $form->display('inspector_comment', __('Inspector\'s comment (Remarks)'));
            $form->divider();
            $form->radio('status', __('Action'))
                ->options([
                    '2' => 'Assign inspector',
                    '3' => 'Halted',
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('5', function (Form $form) 
                {

                    $form->text('grower_number', __('Grower number'))
                        ->default("NSCS"."/". "QDS" ."/". mt_rand(1, 9999) ."/". date('Y'))->readonly();
                    $form->text('registration_number', __('Registration number'))
                          ->default("MAAIF"."/". "QDS" ."/". mt_rand(0000, 9999) ."/".  date('Y'))->readonly();
                    $form->date('valid_from', 'Valid from date?')->default(Carbon::now())->readonly();
                    $nextYear = Carbon::now()->addYear(); // Get the date one year from now
                    $defaultDateTime = $nextYear->format('Y-m-d H:i:s'); // Format the date for default value
                    
                    $form->date('valid_until', 'Valid until date?')
                        ->default($defaultDateTime)
                        ->readonly();
                })
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
                });
               
        }

        //inspector form fields
        if (Admin::user()->isRole('inspector')) 
        {
            $sec  = ((int)(request()->segment(3)));
            $formQds = FormQds::find($sec);
            
            //call back if editing
            if($form->isEditing())
            {
                if(Admin::user()->isRole('inspector'))
                {
                    if($formQds->status != 2)
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

            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('farm_location', __('Farm location'))->readonly();
            $form->file('signature_of_applicant', __('Receipt'))->readonly();     
            $form->radio('status', __('Status'))
                ->options([
                    
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
                  $form->textarea('inspector_comment', 'Recommendation')
                       ->help("Please specify with a comment");
                  
           });

                    
        }
        $form->footer(function ($footer) 
        {

            // disable `View` checkbox
            $footer->disableViewCheck();
            //disable reset btn
            $footer->disableReset();

            // disable `Continue editing` checkbox
            $footer->disableEditingCheck();

            

        });

        return $form;
         
    }
}