<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\FormSr4;
use App\Models\ImportExportPermit;
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

class ImportExportPermitController2 extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Export Permit';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ImportExportPermit());
          //organize the grid in descending order of created_at
          $grid->model()->orderBy('created_at', 'desc');

        //disable batch delete
        $grid->batchActions(function ($batch) 
        {
            $batch->disableDelete();
        });

        //customise filter
        $grid->filter(function($filter)
        {

            // Remove the default id filter
            $filter->disableIdFilter();
        
            // Add a column filter
            $filter->like('name', 'Name');
            
        
            //... additional filter options
        });

        $grid->disableExport();
        $grid->model()->where('is_import', '!=', 1);

        //check if the role is an inspector and has been assigned that form
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
                    $status != null 
                ) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
               
                if(Utils::check_expiration_date('ImportExportPermit',$this->getKey()))
                {
                        
                    $actions->add(new Renew(request()->segment(count(request()->segments()))));
                
                };
            });
        } 
        else if (Admin::user()->isRole('inspector')|| Admin::user()->isRole('admin')) 
        {
            $grid->disableCreateButton();
            $grid->actions(function ($actions) 
            {
                $actions->disableDelete();
                $actions->disableEdit();
               
            });
            $grid->filter(function ($search_param) 
            {
                $search_param->disableIdfilter();
                $search_param->like('name', __("Search by Name"));
                $search_param->like('status', __("Search by Status"));
            });

        } 
        else
        {
            $grid->disableCreateButton();
        }

        $grid->column('created_at', __('Created'))
            ->display(function ($item) 
            {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        $grid->column('name', __('Name'));
        $grid->column('type', __('Application Category'));
        $grid->column('telephone', __('Telephone'));
        $grid->column('quantiry_of_seed', __('Quantity of seed'));
        $grid->column('ista_certificate', __('Type Of Certificate'))->sortable();


        if(!Admin::user()->isRole('basic-user'))
        {
            $grid->column('inspector', __('Inspector'))->display(function ($userId) 
            {
                $u = Administrator::find($userId);
                if (!$u)
                    return "Not assigned";
                return $u->name;
            })->sortable();
        }

       //check if the status is expired or not
        $grid->column('status', __('Status'))->display(function ($status) 
        {
            // check expiration date
             if (Utils::check_expiration_date('ImportExportPermit',$this->getKey())) 
             {
                 return Utils::tell_status(6);
             } else{
                 return Utils::tell_status($status);
             }
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
        $export_permit = ImportExportPermit::findOrFail($id);
        //delete the notification from the database once a user views the form
        if(Admin::user()->isRole('basic-user') )
        {
            if($export_permit->status == 2 || $export_permit->status == 3 || $export_permit->status == 4 || $export_permit->status == 5)
            {
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'ImportExportPermit'])->delete();
            }

        }

        $show = new Show(ImportExportPermit::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) 
            {
                $tools->disableEdit();
                $tools->disableDelete();
            });

        $show->field('created_at', __('Created'))
            ->as(function ($item) 
            {
                if (!$item) 
                {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Created by id'))
            ->as(function ($userId) 
            {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });

        $show->field('type', __('Permit category'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('telephone', __('Telephone'));
        $show->field('national_seed_board_reg_num', __('National seed board reg num'));
        $show->field('store_location', __('Store location'));
        $show->field('quantiry_of_seed', __('Quantity of seed'));
        $show->field('name_address_of_origin', __('Name address of origin'));

        //show table of crops associated with an import permit

        $show->field('import_export_permits_has_crops', __('Crops'))
            ->unescape()
            ->as(function ($item) 
            {
            
                if (!$this->import_export_permits_has_crops) 
                {
                    return "None";
                }

                $headers = ['Crop',  'Category', 'Weight'];
                $rows = array();
                foreach ($this->import_export_permits_has_crops as $key => $val) 
                {
                    
                    $row['crop'] = $val->variety->crop->name;
                    $row['variety'] = $val->variety->name;
                    $row['weight'] = $val->weight;
                    $rows[] = $row;
                }

                $table = new Table($headers, $rows);
                return $table;
            });
        
        $show->field('ista_certificate', __('Ista certificate'));
        if($export_permit->permit_number != null)
        {
           $show->field('permit_number', __('Permit number'));
        }
    
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {

            return Utils::tell_status($status);
        });

        $show->field('status_comment', __('Comment'));

         //check if valid_from , valid_until are empty,if they are then dont show them
         if ($export_permit->valid_from != null) 
         {
            $show->field('valid_from', __('Valid from'));
        }
        if ($export_permit->valid_until != null) {
            $show->field('valid_until', __('Valid until'));
        }

        if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            //check the status of the form being shown
            if($export_permit->status == 1 || $export_permit->status == 2 || $export_permit->status == null)
            {
            $show->field('id','Action')->unescape()->as(function ($id) 
            {
                return "<a href='/admin/import-export-permits-2/$id/edit' class='btn btn-primary'>Take Action</a>";
            });
            }
        }
    
        if (Admin::user()->isRole('basic-user')) 
        {
            if($export_permit->status == 3 || $export_permit->status == 1)
            {
                $show->field('id','Action')->unescape()->as(function ($id)
                {
                    return "<a href='/admin/import-export-permits-2/$id/edit' class='btn btn-primary'>Take Action</a>";
                });
            }
        }

        return $show;
    }

    protected function form()
    {
        $form = new Form(new ImportExportPermit());

        // callback after save to return to the table view
        $form->saved(function (Form $form) 
        {
            return redirect(admin_url('import-export-permits-2'));
        });

        if($form->isEditing())
        {
            
            //find the import permit id, if its status is not pending, block an inspector from editing and disable form actions
            $import_export_permit = ImportExportPermit::find(request()->route()->parameters()['import_export_permits_2']);
            if(Admin::user()->isRole('inspector'))
            {
                if($import_export_permit->status != 2)
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
            }
        }


        //customize the form features

            $form->setWidth(8, 4);
            $form->disableCreatingCheck();
            $form->tools(function (Form\Tools $tools) 
            {
                $tools->disableDelete();
                $tools->disableView();
            });

            $form->footer(function ($footer) 
            {
                $footer->disableReset();
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });

            $user = Auth::user();
            $form->hidden('is_import', __('is_import'))->default(0)->value(0)->required();

            if ($form->isCreating()) 
            {
                $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
            } 
            else 
            {
                $form->hidden('administrator_id', __('Administrator id'));
            }
             
        
        //basic-user forms
        if (Admin::user()->isRole('basic-user')) 
        {


            if($form->isEditing())
            {
          
               
                $form->saving(Function(Form $form)
                {
                    $user = Auth::user();
                    $form_id = request()->route()->parameters()['import_export_permits_2'];
                    $import = ImportExportPermit::where('type', $form->type)->where('administrator_id', $user->id)->where('is_import', 0)->first();
                    $import_permit = ImportExportPermit::find($form_id);
                    $count = ImportExportPermit::where('type', $form->type)->where('administrator_id', $user->id)->where('is_import', 0)->count();
                    if($count)
                    {
                        //check if what is being passed to the form is the same as the one in the database
                        if($import->id == $import_permit->id)
                        {
                                return true;          
                        }

                        else
                        {
    
                            if(!Utils::can_create_import($import))
                            {
                                return  response(' <p class="alert alert-warning"> You cannot create a new export permit form  while having PENDING one of the same category. <a href="/admin/import-export-permits-2"> Go Back </a></p> ');
                            }
                            
                            //check if its still valid
                            if (Utils::can_renew_permit($import)) 
                            {
                                return  response(' <p class="alert alert-warning"> You cannot create a new export permit form  while having VALID one of the same category. <a href="/admin/import-export-permits-2"> Go Back </a></p> ');   
                            }
                        }
                    }
                    else
                    {
                        return response(' <p class="alert alert-danger">Form Not Found </p>');
                    }
                });
                //count the number of forms with the same type
               

            }

            if($form->isCreating())
            {
             
                //check if there is a valid sr4 for the selected application type
                $form->saving(function (Form $form) 
                {

                
                        $form_sr4 = FormSr4::where('administrator_id',  Admin::user()->id)->where('valid_until','>=', Carbon::now())->where('type', $form->type)->first();

                        if ( $form->type != 'Researchers' &&  !$form_sr4)
                        {
                            
                            return  response(' <p class="alert alert-warning">You do not have a valid SR4 of the selected type. <a href="/admin/import-export-permits-2"> Go Back </a></p> ');     
                        }
                        else
                        {
                            $type = $form->type;
                            $user = Auth::user();
                            $export = ImportExportPermit::where('type', $type)->where('administrator_id', $user->id)->where('is_import', 0)->first();
                            if ($export) 
                            {
                                
                                
                                    //check if the status of the form is pending, rejected,halted or accepted
                                    if(!Utils::can_create_export($export))
                                    {
                                        return  response(' <p class="alert alert-warning"> You cannot create a new export permit form  while having PENDING one of the same category. <a href="/admin/import-export-permits-2/create"> Go Back </a></p> ');
                
                                    }
                                    
                                    //check if its still valid
                                    if (Utils::can_renew_permit($export)) 
                                    {
                                        
                                        return  response(' <p class="alert alert-warning"> You cannot create a new export permit form  while having VALID one of the same category. <a href="/admin/import-export-permits-2/create"> Go Back </a></p> ');   
                                    }
                            
                            }

                            //function to set the category to 'yes' only when the form is being saved the first time
                
                            if($form->type != 'Researchers')
                            {
                                $form->national_seed_board_reg_num = $form_sr4->seed_board_registration_number;
                            }
                            else
                            {
                                $form->national_seed_board_reg_num = 'N/A';
                            }
                        
                            
                        }

                });
            }
                
            
            $form->radio('type', __('Application Category?'))
                ->options([
                    'Seed Merchant' => 'Seed Merchant',
                    'Seed Producer' => 'Seed Producer',
                    'Seed Stockist' => 'Seed Stockist',
                    'Seed Importer' => 'Seed Importer',
                    'Seed Exporter' => 'Seed Exporter',
                    'Seed Processor' => 'Seed Processor',
                    'Researchers' => 'Researchers',

                ])
                ->required()
                ->help('Which SR4 type are you applying for?');
            $this->show_fields($form);
                   

        } 

        //admin form fields
        if (Admin::user()->isRole('admin')) 
        {
            $form->text('name', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('telephone', __('Telephone'))->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('store_location', __('Store location'))->readonly();
            $form->divider();
            $form->radio('status', __('Action'))
                ->options([
                    '2' => 'Assign inspector',
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

        //inspector form fields
        if (Admin::user()->isRole('inspector')) 
        {

            $form->text('name', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('telephone', __('Telephone'))->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('store_location', __('Store location'))->readonly();
            $form->text('other_varieties', __('Other varieties'))->readonly();
            $form->divider();

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
                    $form->text('permit_number', __('Permit number'))
                        ->help("Please Enter Permit number")
                        ->default("Import" ."/". date('Y') ."/". mt_rand(10000000, 99999999))->readonly();
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });

        }


            return $form;
    }


    //form function
    public function show_fields($form)
    {
        $user = Auth::user();
        $form->text('name', __('Applicant Name'))->default($user->name)->readonly();
        $form->text('address', __('Postal Address'))->required();
        $form->text('telephone', __('Phone Number'))->required(); 
        $form->hidden('national_seed_board_reg_num', __('National Seed Board Registration Number'));    
        $form->text('store_location', __('Location of the store'))->required();
        $form->number( 'quantiry_of_seed', __('Quantity of seed of the same variety held in stock') )
            ->help("(metric tons)")
            ->required();
        $form->text('name_address_of_origin', __('Name and address of origin'))
            ->required();

        $form->tags('ista_certificate', __('Type Of Certificate'))
            ->required()
            ->options(['ISTA certificate', 'Phytosanitary certificate']);

        $form->html('<h3>I or We wish to apply for a license to import seed as indicated below:</h3>');

        $form->radio('crop_category', __('Category'))
            ->options
            ([
                'Commercial' => 'Commercial',
                'Research' => 'Research',
                'Own use' => 'Own use',
            ])->stacked()
            ->required();

        $form->hasMany('import_export_permits_has_crops', __('Click on "New" to Add Crop varieties '), function (NestedForm $form) 
        {
            //access the crop varities in the variety table
            $_items = [];

            foreach (CropVariety::all() as $key => $item) 
            {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $form->select('crop_variety_id', 'Add Crop Variety')->options($_items)
                ->required();
                
            $form->textarea('other_varieties', __('Specify other varieties if any.') )
            ->help('If varieties you are applying for were not listed');
           
            $form->number('weight','Weight in (Kgs)')
            ->required();

            
                   
        });
        return $form;
    }
}
