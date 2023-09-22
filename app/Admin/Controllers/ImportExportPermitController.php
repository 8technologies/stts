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
use PragmaRX\Countries\Package\Countries;
use Illuminate\Support\Facades\Config;

class ImportExportPermitController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Import Permit';


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
        $grid->model()->where('is_import', '=', 1);

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
     


        if(!Admin::user()->isRole('basic-user'))
        {
            $grid->column('inspector_id', __('Inspector'))->display(function ($userId) 
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

         $import_permits = ImportExportPermit::where('administrator_id', auth('admin')->user()->id)->get();

       //check user role then show a certificate button
       if(!auth('admin')->user()->inRoles(['inspector','admin']))
       {

           $grid->column('id', __('Certificate'))->display(function ($id) use ( $import_permits) {
               $import_permit =  $import_permits->firstWhere('id', $id);
           
               if ($import_permit && $import_permit->status == '5') {
                $link = url('import_permit?id=' . $id);
                return '<b><a target="_blank" href="' . $link . '">Print Certificate</a></b>';
               } else {
                  
                   return '<b>Unavailable</b>';
               }
           });
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
        $import_permit = ImportExportPermit::findOrFail($id);
        //delete the notification from the database once a user views the form
        if(Admin::user()->isRole('basic-user') )
        {
            if($import_permit->status == 2 || $import_permit->status == 3 || $import_permit->status == 4 || $import_permit->status == 5)
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

        $show->field('created_at', __('Created on'))
            ->as(function ($item) 
            {
                if (!$item) 
                {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Created by'))
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
        $show->field('store_location', __('Store location'));
        $show->field('quantiry_of_seed', __('Quantity of seed'));
        $show->field('name_address_of_origin', __('Country of origin'));
        $show->field('supplier_name', __('Name of Supplier'));
        $show->field('supplier_address', __('Address of Supplier'));

        //show table of crops associated with an import permit

        $show->field('import_export_permits_has_crops', __('Crops'))
            ->unescape()
            ->as(function ($item) 
            {
            
                if (!$this->import_export_permits_has_crops) 
                {
                    return "None";
                }

                $headers = ['Crop',  'Variety','Category', 'Weight'];
                $rows = array();
                foreach ($this->import_export_permits_has_crops as $key => $val) 
                {
                    
                    $row['crop'] = $val->variety->crop->name;
                    $row['variety'] = $val->variety->name;
                    $row['category'] = $val->category;
                    $row['weight'] = $val->weight;
                    $rows[] = $row;
                }

                $table = new Table($headers, $rows);
                return $table;
            });
        
        $show->field('ista_certificate', __('Ista certificate'));
        if($import_permit->permit_number != null)
        {
           $show->field('permit_number', __('Permit number'));
        }
    
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {

            return Utils::tell_status($status);
        });

        $show->field('status_comment', __('Comment'))->unescape()->as(function ($status_comment){
            return $status_comment ?? 'No comment';
        });
        

         //check if valid_from , valid_until are empty,if they are then dont show them
         if ($import_permit->valid_from != null) 
         {
            $show->field('valid_from', __('Valid from'));
        }
        if ($import_permit->valid_until != null) {
            $show->field('valid_until', __('Valid until'));
        }

        
        Utils::take_action($import_permit, $id ,'import-export-permits',$show);


        return $show;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ImportExportPermit());

        // callback after save to return to the table view
        $form->saved(function (Form $form) 
        {
            return redirect(admin_url('import-export-permits'));
        });

        if($form->isEditing())
        {
            //find the import permit id, if its status is not pending, block an inspector from editing and disable form actions
            $import_export_permit = ImportExportPermit::find(request()->route()->parameters()['import_export_permit']);
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
                //$tools->disableView();
            });

            $form->footer(function ($footer) 
            {
                $footer->disableReset();
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });

            $user = Auth::user();
            $form->hidden('is_import', __('is_import'))->default(1)->value(1)->required();

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


            // if($form->isEditing())
            // {
          
            //     $form->saving(Function(Form $form)
            //     {
            //         $user = Auth::user();
            //         $form_id = request()->route()->parameters()['import_export_permit'];
            //         $import = ImportExportPermit::where('type', $form->type)->where('administrator_id', $user->id)->where('is_import', 1)->first();
            //         $import_permit = ImportExportPermit::find($form_id);
            //         $count = ImportExportPermit::where('type', $form->type)->where('administrator_id', $user->id)->where('is_import', 1)->count();
            //         if($count)
            //         {
            //             //check if what is being passed to the form is the same as the one in the database
            //             if($import->id == $import_permit->id)
            //             {
            //                     return true;          
            //             }

            //             else
            //             {
    
            //                 if(!Utils::can_create_import($import))
            //                 {
            //                     return  response(' <p class="alert alert-warning"> You cannot create a new import-export-permit form  while having PENDING one of the same category. <a href="/admin/import-export-permits"> Go Back </a></p> ');
            //                 }
                            
            //                 //check if its still valid
            //                 if (Utils::can_renew_permit($import)) 
            //                 {
            //                     return  response(' <p class="alert alert-warning"> You cannot create a new import-export-permits form  while having VALID one of the same category. <a href="/admin/import-export-permits"> Go Back </a></p> ');   
            //                 }
            //             }
            //         }
            //         else
            //         {
                        
                
            //             $form_sr4 = FormSr4::where('administrator_id',  Admin::user()->id)->where('valid_until','>=', Carbon::now())->where('type', $form->type)->first();

            //             if ( $form->type != 'Researchers' &&  !$form_sr4)
            //             {
            //                 return  response(' <p class="alert alert-warning">You do not have a valid SR4 of the selected type. <a href="/admin/import-export-permits"> Go Back </a></p> ');     
            //             }
            //             else
            //             {
            //                 $type = $form->type;
            //                 $user = Auth::user();
            //                 $import = ImportExportPermit::where('type', $type)->where('administrator_id', $user->id)->where('is_import', 1)->first();
            //                 if ($import) 
            //                 {
                                
                                
            //                         //check if the status of the form is pending, rejected,halted or accepted
            //                         if(!Utils::can_create_import($import))
            //                         {
            //                             return  response(' <p class="alert alert-warning"> You cannot create a new import permit form  while having PENDING one of the same category. <a href="/admin/import-export-permits/create"> Go Back </a></p> ');
                
            //                         }
                                    
            //                         //check if its still valid
            //                         if (Utils::can_renew_permit($import)) 
            //                         {
                                        
            //                             return  response(' <p class="alert alert-warning"> You cannot create a new import permit form  while having VALID one of the same category. <a href="/admin/import-export-permits/create"> Go Back </a></p> ');   
            //                         }
                            
            //                 }

            //                 //function to set the category to 'yes' only when the form is being saved the first time
                
            //                 if($form->type != 'Researchers')
            //                 {
            //                     $form->national_seed_board_reg_num = $form_sr4->seed_board_registration_number;
            //                 }
            //                 else
            //                 {
            //                     $form->national_seed_board_reg_num = 'N/A';
            //                 }
                        
                            
            //             }
            //         }
            //     });
            //     //count the number of forms with the same type
               

            // }

            // if($form->isCreating())
            // {
             
            //     //check if there is a valid sr4 for the selected application type
            //     $form->saving(function (Form $form) 
            //     {
            //         $selected_type = $form->type;
            //         $user = Auth::user();
            //         $import = ImportExportPermit::where('type', $selected_type)->where('administrator_id', $user->id)->where('is_import', 1)->first();
            //         if ($import) 
            //         {
                        
                        
            //                 //check if the status of the form is pending, rejected,halted or accepted
            //                 if(!Utils::can_create_import($import))
            //                 {
                               
            //                     return response('<p class="alert alert-warning"> You cannot create a new import permit form  while having PENDING one of the same category. <a href="/admin/import-export-permits/create"> Go Back </a></p>');
                              
            //                  }
        
                          
                            
            //                 //check if its still valid
            //                 if (Utils::can_renew_permit($import)) 
            //                 {
                                
            //                     return response('<p class="alert alert-warning"> You cannot create a new import permit form  while having VALID one of the same category. <a href="/admin/import-export-permits/create"> Go Back </a></p>');  
            //                     return;
            //                 }
            //         }

                
            //             $form_sr4 = FormSr4::where('administrator_id',  Admin::user()->id)->where('valid_until','>=', Carbon::now())->where('type', $form->type)->first();


            //                 //function to set the category to 'yes' only when the form is being saved the first time
                
            //                 if($form->type != 'Researchers')
            //                 {
            //                     $form->national_seed_board_reg_num = $form_sr4->seed_board_registration_number;
            //                 }
            //                 else
            //                 {
            //                     $form->national_seed_board_reg_num = 'N/A';
            //                 }
                        
                            
                        

            //     });
            // }
                
            
            $form->radio('type', __("Applicant's Category?"))
                ->options([
                    'Seed Merchant/Company' => 'Seed Merchant/Company',
                    'Seed Dealer/importer/exporter' =>   'Seed Dealer/importer/exporter',
                    'Seed Producer' => 'Seed Producer',
                    'Researchers' => 'Researchers/Own use',

                ])
                ->required();
                // ->when( 'Seed Merchant', function (Form $form) {
                //    Utils::sr4Check($form,'Seed Merchant');
                // })
                // ->when( 'Seed Producer', function (Form $form) {
                //     Utils::sr4Check($form,'Seed Producer');
                // })
                // ->when( 'Seed Stockist', function (Form $form) {
                //     Utils::sr4Check($form,'Seed Stockist');
                // })
                // ->when( 'Seed Importer', function (Form $form) {
                //     Utils::sr4Check($form,'Seed Importer');
                // })
                // ->when( 'Seed Exporter', function (Form $form) {
                //     Utils::sr4Check($form,'Seed Exporter');
                // })
                // ->when( 'Seed Processor', function (Form $form) {
                //     Utils::sr4Check($form,'Seed Processor');
                // });
            $this->show_fields($form);
                   

        } 


        //admin form fields
        if (Admin::user()->isRole('inspector')) 
        {
            $form->text('name', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('telephone', __('Telephone'))->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('store_location', __('Store location'))->readonly();
            $form->divider();
            $form->radio('status', __('Status'))
            ->options
            ([ 
                '18' => 'Recommended',
                 '4' => 'Rejected',
                
            ])
            ->required()
         
            ->when('in', [18, 4], function (Form $form) 
            {
                $form->textarea('status_comment', 'Inspector\'s comment (Remarks)')
                    ->help("Please specify with a comment");
            });
                
        }

        //inspector form fields
        if (Admin::user()->isRole('admin')) 
        {

            $form->text('name', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('telephone', __('Telephone'))->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('store_location', __('Store location'))->readonly();
            $form->divider();
            $form->html('
            <h4>NOTE:</h4></br>
            <p>The seeds shall not 
            be distributed prior to the release of the result of the 
            tests carried on samples unless with express permission of the Head of NSCS or his or her agent.</p></br>
            <p>The consignment shall be subjected to Ugandan plant quarantine Regulations and upon arrival 
            in your stores shall be inspected by plant/seed inspectors.</p></br>
            <p>Payment of sampling and testing fees as stipultaed in the Fifth Schedule to Seeds Regulations shall be honoured</p></br>
            <p>Fulfillment of commerce/customs requirements and adherence to regulations pertaining to importation of seed</p></br>');
                
            $form->divider();
            $form->radio('status', __('Status'))
                ->options([
                    '2' => 'Assign inspector',
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
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('5', function (Form $form) 
                {
                $lastPermitNumber = Config::get('permit.last_permit_number');

                $form->text('permit_number', __('Permit number'))
                    ->help("Please Enter Permit number")
                    ->default($lastPermitNumber)
                    ->readonly();
                    $form->date('valid_from', 'Valid from date?')->default(Carbon::now())->readonly();
                    $nextYear = Carbon::now()->addMonths(6);
                    $defaultDateTime = $nextYear->format('Y-m-d H:i:s'); // Format the date for default value
                    
                    $form->date('valid_until', 'Valid until date?')
                        ->default($defaultDateTime)
                        ->readonly();
                    $form->textarea('additional_conditions', __('Additional Conditions'));
                });
               

        }


            return $form;
    }

    //form function
    public function show_fields($form)
    {
       //get all countries
         $countries = new Countries();
        $countries = $countries->all()->pluck('name.common')->toArray();
        $countries = array_combine($countries, $countries);
          
        $user = Auth::user();
        $form->text('name', __('Applicant Name'))->default($user->name)->required();
        $form->text('address', __('Postal Address'))->required();
        $form->text('telephone', __('Phone Number'))->required(); 
        $form->hidden('national_seed_board_reg_num', __('National Seed Board Registration Number'));    
        $form->text('store_location', __('Location of the store'))->required();
        $form->number( 'quantiry_of_seed', __('Quantity of seed of the same variety held in stock') )
            ->help("(Kgs)")
            ->required();
        $form->select('name_address_of_origin', __('Country of Origin'))->options($countries)->required();
        $form->text('supplier_name', __('Name of supplier'))->required();
        $form->text('supplier_address', __('Address of supplier'))->required();

        $form->tags('ista_certificate', __('The seed consignment shall be accompanied by'))
            ->required()
            ->options(['ISTA certificate', 'Phytosanitary certificate']);

        $form->html('<h3>I or We wish to apply for a license to import seed as indicated below:</h3>');

      

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

            $form->radio('category', __('Category'))
            ->options
            ([
                'Commercial' => 'Commercial',
                'Research' => 'Research',
                'Own use' => 'Own use',
            ])->stacked()
            ->required();
           
            $form->number('weight','Weight in (Kgs)')
            ->required();

           
                   
        })->required();

        $form->html(' <h4>NOTE:</h4></br><p>The seeds shall not 
        be distributed prior to the release of the result of the 
        tests carried on samples unless with express permission of the Head of NSCS or his or her agent.</p>');

        $form->html('<p>The consignment shall be subjected to Ugandan plant quarantine Regulations and upon arrival 
        in your stores shall be inspected by plant/seed inspectors.</p>');
        return $form;
    }

    
}