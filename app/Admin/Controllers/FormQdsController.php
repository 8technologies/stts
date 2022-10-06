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

        $grid->disableFilter();
        $grid->disableColumnSelector();


        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);


            if (!Utils::can_create_sr6()) {
                $grid->disableCreateButton();
            }

            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if (
                    $status == 2 ||
                    $status == 5 ||
                    $status == 6
                ) {
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->disableCreateButton();

            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                $actions->disableDelete();
                if (
                    $status == 1
                ) {
                    $actions->disableEdit();
                }
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

        
        if ( (Admin::user()->isRole('basic-user'))){
            $grid->actions(function ($actions) {
                $actions->disableEdit();
                $actions->disableDelete();
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
        $show = new Show(FormQds::findOrFail($id));

        $show->panel()->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'))
            ->as(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('administrator_id', __('Administrator id'))
            ->as(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });
        $show->field('name_of_applicant', __('Name of applicant'));
        $show->field('address', __('Address'));

        $show->field('premises_location', __('Premises location'));
        $show->field('years_of_expirience', __('Years of experience'));
        $show->field('dealers_in', __('Dealers in'))
            ->unescape()
            ->as(function ($item) {
                if (!$item) {
                    return "None";
                }
                if (strlen($item) < 10) {
                    return "None";
                }
                $_data = json_decode($item);

                $headers = ['Crop', 'Variety', 'Ha', 'Origin'];
                $rows = array();
                foreach ($_data as $key => $val) {
                    $row['crop'] = $val->crop;
                    $row['variety'] = $val->variety;
                    $row['ha'] = $val->ha;
                    $row['origin'] = $val->origin;
                    $rows[] = $row;
                }

                $table = new Table($headers, $rows);
                return $table;
            });
        $show->field('previous_grower_number', __('Previous grower number'));
        $show->field('cropping_histroy', __('Cropping histroy'));
        $show->field('have_adequate_isolation', __('Have adequate isolation'))
            ->as(function ($item) {
                if ($item) {
                    return "Yes";
                } else {
                    return "No";
                }
                return $item;
            });
        $show->field('have_adequate_labor', __('Have adequate labor'))->as(function ($item) {
            if ($item) {
                return "Yes";
            } else {
                return "No";
            }
            return $item;
        });
        $show->field('aware_of_minimum_standards', __('Aware of minimum standards'))
            ->as(function ($item) {
                if ($item) {
                    return "Yes";
                } else {
                    return "No";
                }
                return $item;
            });
        $show->field('signature_of_applicant', __('Signature of applicant'))->file();
        $show->field('grower_number', __('Grower number'));
        $show->field('registration_number', __('Registration number'));
        $show->field('valid_from', __('Valid from'))
            ->as(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('valid_until', __('Valid until'))
            ->as(function ($item) {
                if (!$item) {
                    return "-";
                }
                return Carbon::parse($item)->diffForHumans();
            });
        $show->field('status', __('Status'))
            ->unescape()
            ->as(function ($status) {
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
        $form = new Form(new FormQds());
        if ($form->isCreating()) {
            if (!Utils::can_create_qds()) {
                return admin_warning("Warning", "You cannot create a new QDS form while still having another active one.");
                return redirect(admin_url('form-qds'));
            }
        } 

        session_start();
        
        if (!isset($_SESSION['sr6_refreshed'])) {
            $_SESSION['sr6_refreshed'] = "yes";
            $my_uri = $_SERVER['REQUEST_URI'];
            Admin::script('window.location.href="' . $my_uri . '";');
        } else {
            unset($_SESSION['sr6_refreshed']);
        }

        // callback before save
        $form->saving(function (Form $form) {

            $form->dealers_in = '[]';
            if (isset($_POST['group-a'])) {
                $form->dealers_in = json_encode($_POST['group-a']);
                //echo($form->dealers_in);
            }
        });

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


        $form->hidden('dealers_in', __('dealers_in'));


        if (Admin::user()->isRole('basic-user')) {
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->required()->required();
            $form->text('address', __('Address'))->required();
            $form->text('premises_location', __('Premises location'))->required();
            $form->text('years_of_expirience', __('Enter Applicant years of experience as a quality declared seed (QDS) grower'))
                ->rules('min:1')
                ->attribute('type', 'number')
                ->required();

            $repeat = "";

            if ($form->isEditing()) {
                $sec  = ((int)(request()->segment(3)));
                if ($sec > 0) {
                    $da = FormQds::findOrFail($sec);
                    if ($da) {
                        if (isset($da->dealers_in)) {
                            if (strlen($da->dealers_in) > 3) {
                                $_reapeat_data = json_decode($da->dealers_in);

                                foreach ($_reapeat_data as $key => $val) {
                                    $repeat .= '<tr data-repeater-item>
                                    <td><input value="' . $val->crop . '" class="form-control" required name="crop" type="text"></td>
                                    <td><input value="' . $val->variety . '" class="form-control" required name="variety" type="text"></td>
                                    <td><input value="' . $val->ha . '" class="form-control" required name="ha" type="text"></td>
                                    <td><input value="' . $val->origin . '" class="form-control" required name="origin" type="text"></td>
                                    <td><button class="btn btn-danger btn-sm" data-repeater-delete type="button">
                                    <span>Delete</span>
                                  </button></td>
                                    </tr>';
                                }
                            }
                        }
                    }
                }
            }
            if (strlen($repeat) < 4) {
                $repeat .= '<tr data-repeater-item>
                                    <td><input placeholder="Crop" value="" class="form-control" required name="crop" type="text"></td>
                                    <td><input placeholder="Variety" value="" class="form-control" required name="variety" type="text"></td>
                                    <td><input placeholder="Ha" value="" class="form-control" required name="ha" type="text"></td>
                                    <td><input placeholder="Origin" value="" class="form-control" required name="origin" type="text"></td>
                                    <td><button class="btn btn-danger btn-sm" data-repeater-delete type="button">
                                    <span>Delete</span>
                                  </button></td>
                                    </tr>';
            }


            $form->html('<h3>I/We wish to apply for a license to produce quality declared seed (QDS) as indicated below:</h3>');
            $form->hasMany('qds_has_crops',__('Click on "New" to Add Crops
                '), function (NestedForm $form) {   
                $_items = [];
                foreach (Crop::all() as $key => $item) { 
                    $_items[$item->id] = $item->name . " - " . $item->id;
                }
                $form->select('crop_id','S Crop')->options( Crop::all()->pluck('name','id') )
                ->required();
            });



          /*   $form->html('<div class="repeater">
            <table class="table">
                <thead>
                    <tr>
                        <th>Crops(s)</th>
                        <th>Vatiety</th>
                        <th>Ha</th>
                        <th>Origin/Source</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody data-repeater-list="group-a">
                    ' . $repeat . '
                </tbody>
            </table>
            <input data-repeater-create class="btn btn-success btn-sm" type="button" value="Add record" />
        </div>'); */



            // $form->table('dealers_in', function ($table) {
            //     $table->text('key');
            //     $table->text('value');
            //     $table->text('desc');
            //     $table->text('romina');
            // });

            //URL::asset('/assets/js/vendor/nice-select.min.js')
          /*   Admin::js('/assets/js/vendor/jquery.repeater.min.js');
            Admin::js('/assets/js/vendor/form-repeater.min.js'); */


            //$form->textarea('dealers_in', __('Dealers in'));

            $form->radio('have_been_qds', __('Have you been a QDS producer in the past?'))
                ->options([
                    '1' => 'Yes',
                    '2' => 'No',
                ])
                ->required()
                ->when('1', function (Form $form) {
                    $form->text('previous_grower_number', __('Specify QDS grower number:'));
                });


            $form->radio(
                'have_adequate_storage_facility',
                __('Do you have adequate storage facilities to handle the resultant seed?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();

            $form->textarea('cropping_histroy', __('The field wehere I intend to grow the seeds was previous under? (Give it\'s cropping history)'))->required();


            $form->radio(
                'have_adequate_isolation',
                __('Do you have adequate isolation?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->when('1', function (Form $form) {
                    $form->text('isolation_distance', __('Specify isolation distance (in Meters)'))->attribute(['type' => 'number']);
                })
                ->required();


            $form->radio(
                'have_adequate_labor',
                __('Do you have adequate labor to carry out all farm operations in a timely manner?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->when('1', function (Form $form) {
                    $form->text('number_of_labors', __('Specify number of laborers'))->attribute(['type' => 'number']);
                })
                ->required();

 


            $form->radio(
                'aware_of_minimum_standards',
                __('Are you aware that only seed that meets the minimum standards shall be accepted as certified seed?')
            )
                ->options([
                    '1' => 'Yes',
                    '0' => 'No',
                ])
                ->required();
            $form->file('signature_of_applicant', __('Upload payment receipt'))->required();


            if ($form->status == '2'){
                // $form->tools(function (Form\Tools $tools) {
                //     $tools->disableDelete();
                //     $tools->disableEdit();
                // });
                
                $form->panel()->tools(function ($tools) {
                    $tools->disableEdit();
                    $tools->disableDelete();
            });

            }
        }

        if (Admin::user()->isRole('admin')) {
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('company_initials', __('Company initials'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();

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
                    $form->date('valid_from', 'Valid from date?');
                    $form->date('valid_until', 'Valid until date?');
                });
        }

        if (Admin::user()->isRole('inspector')) {

            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->readonly();
            $form->text('address', __('Address'))->readonly();
            $form->text('company_initials', __('Company initials'))->readonly();
            $form->text('premises_location', __('Premises location'))->readonly();
            $form->file('signature_of_applicant', __('Receipt'))->readonly(); 
            
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
                    
                })
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                })
                ->when('in', [5, 6], function (Form $form) {

                    $form->hidden('grower_number', __('Grower number'))
                        ->value("000")
                        ->default("0000");
                    $form->text('registration_number', __('Registration number'))
                        ->help("Please Enter Registration number");
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
