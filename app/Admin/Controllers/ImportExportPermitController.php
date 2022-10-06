<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\FormSr4;
use App\Models\FormSr6;
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
use Illuminate\Support\Facades\Redirect;


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
        // $grid->disableFilter();
        $grid->disableExport();
        $grid->model()->where('is_import', '=', 1);


        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);

            // if (!Utils::can_create_import_form()) {
            //     $grid->disableCreateButton();
            // }

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
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->disableCreateButton();

            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                $actions->disableDelete();
                if (
                    $status != 2
                ) {
                    //$actions->disableEdit();
                }

                if (
                    $status == 5
                ) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            });
        } elseif (Admin::user()->isRole('admin')) {
            $grid->disableCreateButton();

            $grid->filter(function ($search_param) {
                $search_param->disableIdfilter();
                $search_param->like('name', __("Search by Name"));
                $search_param->like('status', __("Search by Status"));
            });
        } else {
            $grid->disableCreateButton();
        }


        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        $grid->column('name', __('Name'));
        $grid->column('telephone', __('Telephone'));
        $grid->column('quantiry_of_seed', __('Quantity of seed'));
        $grid->column('ista_certificate', __('Type Of Certificate'))->sortable();


        // $grid->column('administrator_id', __('Created by'))->display(function ($userId) {
        //     $u = Administrator::find($userId);
        //     if (!$u)
        //         return "-";
        //     return $u->name;
        // })->sortable();

        $grid->column('inspector', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();


        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
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
        $show = new Show(ImportExportPermit::findOrFail($id));
        // $show->setWidth(8, 4);
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });

        $show->field('created_at', __('Created'))
            ->as(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Created by id'))
            ->as(function ($userId) {
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
        $show->field('dealers_in', __('Crops'))
            ->unescape()
            ->as(function ($item) {
                if (!$this->import_export_permits_has_crops) {
                    return "None";
                }

                $headers = ['Crop',  'Category', 'Weight'];
                $rows = array();
                foreach ($this->import_export_permits_has_crops as $key => $val) {
                    //$var = CropVariety::find($val->crop_variety_id);


                    $row['crop'] = $val->variety->crop->name;
                    $row['variety'] = $val->variety->name;
                    // $row['category'] = $val->category;
                    $row['weight'] = $val->weight;
                    $rows[] = $row;
                    // dd($val);
                }

                $table = new Table($headers, $rows);
                return $table;
            });
        $show->field('ista_certificate', __('Ista certificate'));
        $show->field('permit_number', __('Permit number'));

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

        if ($form->isCreating()) {
            if (!Utils::can_create_import_form()) {
                return admin_error("Alert", "You must apply for SR4 and be 'Accepted' or have an 'accepted' SR4 to apply for a new Import Permit");
                // return redirect(admin_url('import-export-permits'));
            }
        }

        if ($form->isCreating()) {
            if (!Utils::previous_import_form_not_accepted()) {
                return admin_error("Alert", "You can not apply for a new Import Permit while your last application hasn't been accepted yet! <br>If status isn't 'Pending', please check the Inspector's comment(s) to correct your application and submit again.");
                // return redirect(admin_url('import-export-permits'));
            }
        }

        // dd(Utils::previous_import_form_not_accepted());


        $form->setWidth(8, 4);
        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        $form->footer(function ($footer) {
            $footer->disableReset();
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });

        $user = Auth::user();
        $form->hidden('is_import', __('is_import'))->default(1)->value(1)->required();

        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }

        if (Admin::user()->isRole('basic-user')) {
            // $form->submitted(function (Form $form) {

            //     if ($_POST['type'] != 'Researchers') {
            //         $national_seed_board_reg_num = $this->show->field('national_seed_board_reg_num', __('National seed board reg num'));
            //         $form
            //         ->text($national_seed_board_reg_num, __('National seed board reg num'))
            //         ->required()
            //         ->readonly();
            //     }
            // });

            // ----------------------------------------------
            // // $address_of_current_user = FormSr6::find('address')->where('name_of_applicant', $user->name)->get();

            // $address_of_current_user = FormSr4::findOrFail('address')->get();

            // dd($address_of_current_user);
            // ----------------------------------------------


            $form->text('name', __('Applicant Name'))->default($user->name)->readonly();
            // $form->text($address_of_current_user, __('Postal Address'))->required();
            $form->text('address', __('Postal Address'))->required();
            $form->text('telephone', __('Phone Number'))->required();

            // $application_cats = [
            //     'Seed Merchant' => 'Seed Merchant',
            //     'Seed Producer' => 'Seed Producer',
            //     'Seed Stockist' => 'Seed Stockist',
            //     'Seed Importer' => 'Seed Importer',
            //     'Seed Exporter' => 'Seed Exporter',
            //     'Seed Processor' => 'Seed Processor',
            //     'Researchers' => 'Researchers',
            // ];

            /*
            $form->radio('type', __('Application category?'))
                ->options([
                    'Seed Merchant' => 'Seed Merchant',
                    'Seed Producer' => 'Seed Producer',
                    'Seed Stockist' => 'Seed Stockist',
                    'Seed Importer' => 'Seed Importer',
                    'Seed Exporter' => 'Seed Exporter',
                    'Seed Processor' => 'Seed Processor',
                    'Researchers' => 'Researchers',
                    
                    // foreach ($application_cats as $cat ) {
                    //     return [$cat => $cat];
                    // }
                ])
                // ->stacked()
                ->required()
                ->help('Which SR4 type are you applying for?')

                ->when('Seed Merchant', function (Form $form) {
 
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                                $seed_board_registration_number = $sr4->seed_board_registration_number;
                                $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })

                ->when('Seed Producer', function (Form $form) {
 
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                                $seed_board_registration_number = $sr4->seed_board_registration_number;
                                $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                    
                })
                
                ->when('Seed Stockist', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                                $seed_board_registration_number = $sr4->seed_board_registration_number;
                                $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })
                
                ->when('Seed Importer', function (Form $form) {
 
                    $seed_board_registration_number = null;
                    $sr66 = Utils::has_valid_sr6();
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr6 form (if their sr6 form application has been accepted)
                    
                    // if ($sr66 != null) {
                    //     if ($sr66->registration_number != null) {
                    //             $seed_board_registration_number = $sr66->registration_number;
                    //             $form->text("", __('National Seed Board Registration Number'))
                    //             ->default($seed_board_registration_number)
                    //             ->readonly();
                    //     }
                    // }

                    
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                                $seed_board_registration_number = $sr4->seed_board_registration_number;
                                $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })
                
                ->when('Seed Exporter', function (Form $form) {
 
                    $seed_board_registration_number = null;
                    $sr66 = Utils::has_valid_sr6();
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr6 form (if their sr6 form application has been accepted)
                    
                    // if ($sr66 != null) {
                    //     if ($sr66->registration_number != null) {
                    //             $seed_board_registration_number = $sr66->registration_number;
                    //             $form->text("", __('National Seed Board Registration Number'))
                    //             ->default($seed_board_registration_number)
                    //             ->readonly();
                    //     }
                    // }
                    
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                                $seed_board_registration_number = $sr4->seed_board_registration_number;
                                $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                    
                })
                
                ->when('Seed Processor', function (Form $form) {
 
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                                $seed_board_registration_number = $sr4->seed_board_registration_number;
                                $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                });

           
           
                // ->when('in', [
            //     'Seed Merchant',
            //     'Seed Producer',
            //     'Seed Stockist',
            //     'Seed Importer',
            //     'Seed Exporter',
            //     'Seed Processor',
            // ], function (Form $form) {
            // })

            // $seed_board_registration_number = null;
            // $sr4 = Utils::has_valid_sr4();

            // // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
            // if ($sr4 != null) {
            //     // echo $sr4;
            //     if ($sr4->seed_board_registration_number != null) {
            //         // if (strlen($sr4->seed_board_registration_number) > 1) {
            //             $seed_board_registration_number = $sr4->seed_board_registration_number;
            //             // echo $seed_board_registration_number;

            //             $form->text("", __('National Seed Board Registration Number'))
            //             ->default($seed_board_registration_number)
            //             ->readonly();
            //         // }
            //     }
            // }         
            
            // if (!$form->radio('type') == 'Researchers') {
                // $form->text(
                //     'national_seed_board_reg_num',
                //     __('National Seed Board Registration Number')
                // )
                //     ->readonly()
                //     ->value($seed_board_registration_number);
            // }

            
            */



            $form->radio('type', __('Application Category?'))
                ->options([
                    'Seed Merchant' => 'Seed Merchant',
                    'Seed Producer' => 'Seed Producer',
                    'Seed Stockist' => 'Seed Stockist',
                    'Seed Importer' => 'Seed Importer',
                    'Seed Exporter' => 'Seed Exporter',
                    'Seed Processor' => 'Seed Processor',
                    'Researchers' => 'Researchers',

                    // foreach ($application_cats as $cat ) {
                    //     return [$cat => $cat];
                    // }
                ])
                // ->stacked()
                ->required()
                ->help('Which SR4 type are you applying for?')

                ->when('Seed Merchant', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                            $seed_board_registration_number = $sr4->seed_board_registration_number;
                            $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })
                ->when('Seed Producer', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                            $seed_board_registration_number = $sr4->seed_board_registration_number;
                            $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })

                ->when('Seed Stockist', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                            $seed_board_registration_number = $sr4->seed_board_registration_number;
                            $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })

                ->when('Seed Importer', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                            $seed_board_registration_number = $sr4->seed_board_registration_number;
                            $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })

                ->when('Seed Exporter', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                            $seed_board_registration_number = $sr4->seed_board_registration_number;
                            $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                })

                ->when('Seed Processor', function (Form $form) {
                    $seed_board_registration_number = null;
                    $sr4 = Utils::has_valid_sr4();
                    // if basic-user has an active sr4 form (if their sr4 form application has been accepted)
                    if ($sr4 != null) {
                        if ($sr4->seed_board_registration_number != null) {
                            $seed_board_registration_number = $sr4->seed_board_registration_number;
                            $form->text("", __('National Seed Board Registration Number'))
                                ->default($seed_board_registration_number)
                                ->readonly();
                        }
                    }
                });



            $form->text('store_location', __('Location of the store'))->required();
            $form->text(
                'quantiry_of_seed',
                __('Quantity of seed of the same variety held in stock')
            )
                ->help("(metric tons)")
                ->attribute(['type' => 'number'])
                ->required();
            $form->text(
                'name_address_of_origin',
                __('Name and address of origin')
            )
                ->required();


            // ------------------------------------------------------------------
            $form->tags('ista_certificate', __('Type Of Certificate'))
                ->required()
                ->options(['ISTA certificate', 'Phytosanitary certificate']);
            // ------------------------------------------------------------------

            $form->html('<h3>I or We wish to apply for a license to import seed as indicated below:</h3>');

            $form->radio('crop_category', __('Category'))
                ->options([
                    'Commercial' => 'Commercial',
                    'Research' => 'Research',
                    'Own use' => 'Own use',
                ])->stacked()
                ->required();

            $form->hasMany('import_export_permits_has_crops', __('Click on "New" to Add Crop varieties
            '), function (NestedForm $form) {
                $_items = [];

                foreach (CropVariety::all() as $key => $item) {
                    $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
                }

                $form->select('crop_variety_id', 'Add Crop Variety')->options($_items)
                    ->required();
                $form->hidden('category', __('Category'))->default("")->value($item->name);
                $form->text('weight', __('Weight (in KGs)'))->attribute('type', 'number')->required();
            });

            //Specify other varieties
            $form->textarea(
                'other_varieties',
                __('Specify other varieties.')
            )
            ->help('If varieties you are applying for were not listed');
        }

        if (Admin::user()->isRole('admin')) {
            //$form->file('ista_certificate', __('Ista certificate'))->required();
            $form->text('name', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('telephone', __('Telephone'))->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('store_location', __('Store location'))->readonly();
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
                    $form->date('valid_from', 'Valid from date?')->readonly();
                    $form->date('valid_until', 'Valid until date?')->readonly();
                });
        }

        if (Admin::user()->isRole('inspector')) {

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
                        ->readonly()
                        ->help('Please select inspector')
                        ->rules('required');
                })
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('in', [5, 6], function (Form $form) {
                    $form->text('permit_number', __('Permit number'))
                        ->help("Please Enter Permit number")
                        ->default(rand(10000, 1000000));
                    // $form->date('valid_from', 'Valid from date?')->readonly();
                    // $form->date('valid_until', 'Valid until date?')->readonly();
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });


            // $form->datetime('valid_from', __('Valid from'))->default(date('Y-m-d H:i:s'));
            // $form->datetime('valid_until', __('Valid until'))->default(date('Y-m-d H:i:s'));
            // $form->text('status', __('Status'));
            // $form->number('inspector', __('Inspector'));
            // $form->textarea('status_comment', __('Status comment'));
        }

        return $form;
    }
}
