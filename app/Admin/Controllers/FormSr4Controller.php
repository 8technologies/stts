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


        /*s = FormSr4::all()->first();
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
            });
        } else if (Admin::user()->isRole('inspector')) {
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
        } else {
            $grid->disableCreateButton();
        }

        $grid->column('id', __('Id'))->sortable();

        $grid->column('created_at', __('Created'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        $grid->column('valid_from', __('Starts'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();
        $grid->column('valid_until', __('Exipires'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

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
        $show = new Show(FormSr4::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('id', __('Id'));
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
        if ($form->isCreating()) {

            if (!Utils::can_create_sr4()) {
                admin_warning("Warning", "You cannot create a new SR4 form with a while still having another active one.");
                return redirect(admin_url('form-sr6s'));
            }
        }


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
                'Seed Merchant' => 'Seed Merchant',
                'Seed Producer' => 'Seed Producer',
                'Seed Stockist' => 'Seed Stockist',
                'Seed Importer' => 'Seed Importer',
                'Seed Exporter' => 'Seed Exporter',
                'Seed Processor' => 'Seed Processor',
            ])
            ->help('Which SR4 type are tou applying for?')
            ->rules('required');

            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->required();
            $form->text('address', __('Address'))->required();
            $form->text('company_initials', __('Company initials'))->required();
            $form->text('premises_location', __('Premises location'))->required();

            $form->text('expirience_in', __('Years of experience'))
                ->rules('min:1')
                ->attribute('type', 'number')
                ->required();
            $form->select('years_of_expirience', __('Experience in?'))
                ->options([
                    'Seed Merchant' => 'Seed Merchant',
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
                    'Other' => 'Other'
                ])
                ->required()
                ->when('Other', function (Form $form) {
                    $form->text('dealers_in_other', 'Applicant is applying for Other Production of?')
                        ->help("Please specify Production that you are applying for");
                });


            $form->radio('processing_of', __('Applicant is applying for processing of?'))
                ->options([
                    'Agricultural crops' => 'Agricultural crops',
                    'Horticultural crops' => 'Horticultural crops',
                    'Other' => 'Other'
                ])
                ->required()
                ->when('Other', function (Form $form) {
                    $form->text('processing_of_other', __('Applicant is applying for Other processing of?'))
                        ->help('Specify if you selected "Other" processing.');
                });


            $form->radio('marketing_of', __('Applicant is applying for marketing of?'))
                ->options([
                    'Agricultural crops' => 'Agricultural crops',
                    'Horticultural crops' => 'Horticultural crops',
                    'Other' => 'Other'
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
                ])->required();

            $form->radio('have_adequate_equipment', 'Do you have adequate equipment to handle basic seed?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])->required()
                ->when('1', function (Form $form) {
                    $form->text('eqipment', 'specify the equipment')
                        ->help("Please specify the equipment");
                });


            $form->radio('have_contractual_agreement', 'Do you have contractual agreement with the growers you have recruited?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->radio('have_adequate_field_officers', 'Do you have adequate field officers to supervise and advise growers on all operation of seed production?')
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->radio(
                'have_conversant_seed_matters',
                __('Do you have adequate and knowledgeable personel who are conversant with seed matters?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();



            $items = Administrator::all();
            $_items = [];
            foreach ($items as $key => $item) {
                // if($item->parent>0){
                //     continue;
                // }
                $_items[$item->id] = $item->name . " - " . $item->id;
            }
            $_items['Other'] = "Other";
            $form->select(
                'souce_of_seed',
                __('What is your source of seed?')
            )->options($_items)
                ->help('Select "Other" if your supplier is not found on the list.')
                ->required()
                ->when('Other', function (Form $form) {
                    $form->text('souce_of_seed_other', 'Specify your source of seed?')
                        ->help("Please specify your source of seed?");
                });


            $form->radio(
                'have_adequate_land_for_production',
                __('Do you have adequate land for production of basic seed?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->radio(
                'have_internal_quality_program',
                __('Do you have an internal quality program?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();


            $form->file('receipt', __('Receipt'));
            $form->textarea('status_comment', __('Inspector\'s remarks.'))->readonly();

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
                    $form->textarea('status_comment', 'Inspector\'s comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('in', [5, 6], function (Form $form) {

                    $today = Carbon::now();
                    $_today = Carbon::now();
                   /*  echo ($today);
                    echo "<br>";
                    $_today = $today->addYear();*/

 

                    $form->text('seed_board_registration_number', __('Enter seed board registration number'))
                        ->help("Please Enter seed board registration number")
                        ->default(rand(10000, 10000));
                    $form->date('valid_from', 'Valid from date?')->readonly();
                    $form->date('valid_until', 'Valid until date?')->readonly();
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
        return $form;
    }
}
