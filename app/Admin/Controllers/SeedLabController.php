<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\FormStockExaminationRequest;
use App\Models\SeedLab;
use App\Models\StockRecord;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SeedLabController extends AdminController
{
    /** 
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Seed lab - analysis';

    /**
     * Make a grid builder.
     *
     * @return Grid 
     */
    protected function grid()
    {
        $grid = new Grid(new SeedLab());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'))
            ->display(function ($item) {
                return Carbon::parse($item)->toFormattedDateString();
            })->sortable();

        $grid->column('administrator_id', __('Applicant'))->display(function ($user) {
            $_user = Administrator::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->name;
        })->sortable();
        $grid->column('crop_variety_id', __('Crop variety id'))->display(function ($user) {
            $_user = CropVariety::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->crop->name . ", " . $_user->name;
        })->sortable();
        $grid->column('mother_lot', __('Mother lot'));
        $grid->column('lot_number', __('Lot number'));
        $grid->column('collection_date', __('Collection date'));


        $grid->column('quantity', __('Quantity'))->display(function ($quantity) {
            return number_format($quantity);
        })->sortable();

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        $grid->column('report_recommendation', __('Recommendation'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        $grid->column('print', __('Lab Certificate'))->display(function ($status) {
            return '<a target="_blank" href="'.url('/print').'">Print Certificate</a>';
        })->sortable();
 

        $grid->column('inspector', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            if (!$userId) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();



        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);

            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if ($status == 0) {
                    $status = 1;
                }
                if (
                    $status != 1
                ) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            });
        } else if (Admin::user()->isRole('inspector')) {
            $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if (
                    $status != 2
                ) {
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('lab-reception')) {
            $grid->model()->where('status', 9);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
            });
        } else if (Admin::user()->isRole('lab-technician')) {
            $grid->model()->where('status', 10)
                ->orWhere('status', 5);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if ($status == 0) {
                    $status = 1;
                }
                if (
                    $status == 5
                ) {
                    $actions->disableEdit();
                    $actions->disableDelete();
                }
            });
        }


        // $grid->column('collection_date', __('Collection date'));
        // $grid->column('payment_receipt', __('Payment receipt'));
        // $grid->column('applicant_remarks', __('Applicant remarks'));
        // $grid->column('sampling_date', __('Sampling date'));
        // $grid->column('sample_weight', __('Sample weight'));
        // $grid->column('packaging', __('Packaging'));
        // $grid->column('number_of_units', __('Number of units'));
        // $grid->column('sample_condition', __('Sample condition'));
        // $grid->column('inspector_remarks', __('Inspector remarks'));
        // $grid->column('tests_required', __('Tests required'));
        // $grid->column('lab_technician_id', __('Lab technician id'));
        // $grid->column('quantity', __('Quantity'));
        // $grid->column('purity', __('Purity'));
        // $grid->column('germination_capacity', __('Germination capacity'));
        // $grid->column('abnormal_sprouts', __('Abnormal sprouts'));
        // $grid->column('broken_germs', __('Broken germs'));
        // $grid->column('report_recommendation', __('Report recommendation'));
        // $grid->column('inspector', __('Inspector'));
        // $grid->column('inspector_is_done', __('Inspector is done'));
        // $grid->column('status', __('Status'));
        // $grid->column('status_comment', __('Status comment'));

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
        $show = new Show(SeedLab::findOrFail($id));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created'))->as(function ($item) {
            return Carbon::parse($item)->toFormattedDateString();
        })->sortable();

        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('form_stock_examination_request_id', __('Form stock examination request id'));
        $show->field('collection_date', __('Collection date'));
        $show->field('payment_receipt', __('Payment receipt'));
        $show->field('applicant_remarks', __('Applicant remarks'));
        $show->field('sampling_date', __('Sampling date'));
        $show->field('sample_weight', __('Sample weight'));
        $show->field('packaging', __('Packaging'));
        $show->field('number_of_units', __('Number of units'));
        $show->field('mother_lot', __('Mother lot'));
        $show->field('sample_condition', __('Sample condition'));
        $show->field('inspector_remarks', __('Inspector remarks'));
        $show->field('tests_required', __('Tests required'));
        $show->field('lab_technician_id', __('Lab technician id'));
        $show->field('quantity', __('Quantity'));
        $show->field('purity', __('Purity'));
        $show->field('germination_capacity', __('Germination capacity'));
        $show->field('abnormal_sprouts', __('Abnormal sprouts'));
        $show->field('broken_germs', __('Broken germs'));
        $show->field('report_recommendation', __('Report recommendation'));
        $show->field('inspector', __('Inspector'));
        $show->field('inspector_is_done', __('Inspector is done'));
        $show->field('status', __('Status'));
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
        $form = new Form(new SeedLab());

        $user = Admin::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))
                ->default($user->id); 
            $form->saving(function ($form) {
                $exam = FormStockExaminationRequest::find($form->form_stock_examination_request_id);
                if (!$exam) {
                    dd("Exam not found");
                }
                $form->crop_variety_id = $exam->id;
                $user = Admin::user();
                $form->administrator_id = $user->id;
            });
        }

        if (Admin::user()->isRole('basic-user')) {
            $exams = FormStockExaminationRequest::where([
                'administrator_id' => $user->id,
                'status' => 5
            ])->get();


            if (count($exams) < 1) {
                admin_error("Warning", "You don't have any valid stock examination request.");
                return redirect(admin_url('seed-labs'));
            }
            $form->hidden('crop_variety_id', __('Crop variety id'));

            $_exams = []; 
            foreach ($exams as $key => $exam) {
                if($exam->crop()->id <1){
                    continue;
                }
                $_exams[$exam->id] = "Exam  ID: " . $exam->id . ", Crop: " . $exam->crop()->name;
            }

            $form->setWidth(8, 4);
            $form->select('form_stock_examination_request_id', __('Select Stock examination form'))
                ->options($_exams);
            $form->date('collection_date', __('Collection date'))->default(date('Y-m-d'))->required();
            $form->file('payment_receipt', __('Attach Payment receipt'))->required();
            $form->hidden('crop_variety_id', __('crop_variety_id'));
            $form->textarea('applicant_remarks', __('Enter remarks'))->required();
        }

        if (Admin::user()->isRole('admin') ) {
            if ($form->isEditing()) {
                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) {
                    dd("Form not found");
                }


                $form->display('applicant', 'Applicant')
                    ->default($model->user->name);

                $form->display('applicant', 'Crop variety')
                    ->default($model->crop_variety->crop->name . " - " . $model->crop_variety->name);

                $form->display('collection_date', 'Collection date')
                    ->default($model->user->collection_date);
            }

            $form->saving(function ($form) {

                $form->inspector_is_done = 0;
            });

            $form->divider();
            $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute(['value', 0]);
            $form->radio('status', __('Status'))
                ->options([
                    '1' => 'Pending',
                    '2' => 'Assign inspector',
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


            $form->hidden('parent_id');
            $form->hidden('order');
            $form->hidden('title');
            $form->hidden('temp_parent');

            if ($form->isEditing()) {

                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) {
                    dd("Form not found");
                }
                if ($model->inspector_is_done == 1) {
                    admin_error("You cannot inspect this form more than once. Request adminstrator to re-activate this form.");
                    $form->disableEditingCheck();
                    $form->disableCreatingCheck();
                    $form->disableViewCheck();

                    $form->tools(function (Form\Tools $tools) {
                        $tools->disableDelete();
                        $tools->disableView();
                        $tools->disableList();
                    });
                    return $form;
                }

                $form->saving(function ($form) {
                    $id = request()->route()->parameters['seed_lab'];
                    $model = $form->model()->find($id);
                    $quantity = (int)($form->quantity);
                    if ($quantity < 1) {
                        $quantity = (-1) * $quantity;
                    }

                    $form->quantity = $quantity;



                    $records = StockRecord::where([
                        'administrator_id' => $model->user->id,
                        'crop_variety_id' => $model->crop_variety_id
                    ])->get();
                    $tot = 0;
                    foreach ($records as $key => $value) {
                        $tot += ((int)($value->quantity));
                    }


                    if ($quantity > $tot) {
                        admin_error("Warning", "There is insufitient quantity stock of crop vareity {$model->crop_variety->crop->name} - {$model->crop_variety->name}. You tried to 
                        enter quantity " . number_format($quantity) . " from " . number_format($tot) . " (Metric Tonnes).");
                        return redirect(admin_url('seed-labs'));
                    }


                    $mother = SeedLab::where('lot_number', $form->mother_lot)->first();
                    $form->parent_id = 0;
                    if ($mother != null) {
                        if ($mother->crop_variety_id != $model->crop_variety_id) {
                            admin_error('Invalid lot number', 'Crop varity of Mother lot number 
                            doesn\' match with current crop variety.');
                            return redirect(admin_url('seed-labs/' . $model->id . "/edit"))->withInput();
                        }
                        $form->parent_id = $mother->id;
                        $form->title = $form->lot_number;
                        $form->order = $model->id;
                        $form->temp_parent = 0;
                    }
                    //dd($form->quantity);
                    $form->inspector_is_done = 1;
                });

                $records = StockRecord::where([
                    'administrator_id' => $model->user->id,
                    'crop_variety_id' => $model->crop_variety_id
                ])->get();
                $tot = 0;
                foreach ($records as $key => $value) {
                    $tot += ((int)($value->quantity));
                }


                $form->setWidth(8, 4);
                $form->display('applicant', 'Applicant')
                    ->default($model->user->name);

                $form->display('applicant', 'Crop variety')
                    ->default($model->crop_variety->crop->name . " - " . $model->crop_variety->name);

                $form->display('collection_date', 'Collection date')
                    ->default($model->user->collection_date);
                $form->divider();

                $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute('value', 1)->value(1)->default(1);
                $form->date('sampling_date', __('Sampling date'))->default(date('y-m-d'));

                $form->text('sample_weight', __('Enter weight of Sample (in KGs)'))
                    ->attribute('type', 'number');
                $form->text('quantity', __('Enter the quantity represented (in Metric Tonnes)'))
                    ->default(1000)
                    ->attribute([
                        'type' => 'number',
                        'value' => $tot,
                    ]);
                $form->text('packaging', __('Packaging'));
                $form->text('number_of_units', __('Number of units'))->default(15);
                $form->text('mother_lot', __('Mother lot'))->attribute('type', 'number');
                $form->text('lot_number', __('lot_number'))->default(rand(10000000, 100000000));
                $form->select('sample_condition', __('Sample condition'))
                    ->options([
                        'Raw seed' => 'Raw seed',
                        'Processed seed' => 'Processed seed',
                        'Quality cleared seed' => 'Quality cleared seed',
                        'Unprocessed seed' => 'Unprocessed seed',
                        'Quality awaited seed' => 'Quality awaited seed',
                        'Conditioned seed' => 'Conditioned seed',
                        'Other' => 'Other',
                    ]);


                $form->tags('tests_required', __('Tests required'))
                    ->options(['Moisture content', 'Purity', 'Germination', 'Seed health']);

                $form->radio('status', __('Decision'))
                    ->options([
                        '9' => 'Accept',
                        '4' => 'Reject'
                    ])->when(4, function ($form) {
                        $form->textarea('inspector_remarks', __('Additional remarks'));
                    });

                $form->html('<small>NOTE: You cannot reverse this process once is done.</small>');
            }
        }

        if (Admin::user()->isRole('lab-reception')) {

            if ($form->isEditing()) {

                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) {
                    dd("Form not found");
                }


                $form->saving(function ($form) {
                    $id = request()->route()->parameters['seed_lab'];
                    $model = $form->model()->find($id);


                    $records = StockRecord::where([
                        'administrator_id' => $model->user->id,
                        'crop_variety_id' => $model->crop_variety_id
                    ])->get();
                    $tot = 0;
                    foreach ($records as $key => $value) {
                        $tot += ((int)($value->quantity));
                    }

                    $form->inspector_is_done = 1;
                    $form->receptionist_is_done = 1;
                });

                $records = StockRecord::where([
                    'administrator_id' => $model->user->id,
                    'crop_variety_id' => $model->crop_variety_id
                ])->get();
                $tot = 0;
                foreach ($records as $key => $value) {
                    $tot += ((int)($value->quantity));
                }


                $form->setWidth(8, 4);
                $form->display('applicant', 'Applicant')
                    ->default($model->user->name)
                    ->readonly()
                    ->disable();

                $form->display('applicant', 'Crop variety')
                    ->default($model->crop_variety->crop->name . " - " . $model->crop_variety->name);

                $form->display('collection_date', 'Collection date')
                    ->default($model->user->collection_date);
                $form->divider();

                $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute('value', 1)->value(1)->default(1)
                    ->readonly()
                    ->disable();

                $form->hidden('receptionist_is_done', __('receptionist_is_done'))->attribute('value', 1)->value(1)->default(1)
                    ->readonly()
                    ->disable();

                $form->display('sampling_date', __('Sampling date'))->required()
                    ->readonly()
                    ->disable();

                $form->display('sample_weight', __('Enter weight of Sample (in KGs)'))->attribute('type', 'number')->required()
                    ->readonly()
                    ->disable();

                $form->display('quantity', __('Enter the quantity represented (in Metric Tonnes)'))->attribute([
                    'type' => 'number',
                    'value' => $tot,
                ])
                    ->readonly()
                    ->disable();
                $form->display('packaging', __('Packaging'));
                $form->display('number_of_units', __('Number of units'));
                $form->display('mother_lot', __('Mother lot'))->attribute('type', 'number');
                $form->hidden('lot_number', __('lot_number'))->default(rand(10000000, 100000000));
                $form->select('sample_condition', __('Sample condition'))
                    ->options([
                        'Raw seed' => 'Raw seed',
                        'Processed seed' => 'Processed seed',
                        'Quality cleared seed' => 'Quality cleared seed',
                        'Unprocessed seed' => 'Unprocessed seed',
                        'Quality awaited seed' => 'Quality awaited seed',
                        'Conditioned seed' => 'Conditioned seed',
                        'Other' => 'Other',
                    ])
                    ->readonly()
                    ->disable();

                $form->display('tests_required', __('Tests required'))
                    ->options(['Moisture content', 'Purity', 'Germination', 'Seed health']);
                $form->divider();
                $form->radio('status', __('Decision'))
                    ->required()
                    ->options([
                        '10' => 'Accept',
                        '3' => 'Halt'
                    ])->when(10, function ($form) {
                        $form->text('lab_test_number', __('Enter lab test number'))
                            ->required();
                        $items = Administrator::all();
                        $_items = [];
                        foreach ($items as $key => $item) {
                            if (!Utils::has_role($item, "lab-technician")) {
                                continue;
                            }
                            $_items[$item->id] = $item->name . " - " . $item->id;
                        }
                        $form->select('lab_technician', __('Assign lab technician'))
                            ->options($_items)
                            ->help('Please select lab technician')
                            ->rules('required');
                    })->when(3, function ($form) {
                        $form->textarea('receptionist_remarks', __('Additional remarks'));
                    });
                $form->html('<small>NOTE: You cannot reverse this process once is done.</small>');
            }
        }


        if (Admin::user()->isRole('lab-technician')) {

            if ($form->isEditing()) {

                $id = request()->route()->parameters['seed_lab'];
                $model = $form->model()->find($id);
                if (!$model) {
                    dd("Form not found");
                }


                $form->saving(function ($form) {
                    $id = request()->route()->parameters['seed_lab'];
                    $model = $form->model()->find($id);

                    $quantity = (int)($form->quantity);
                    if ($quantity < 1) {
                        $quantity = (-1) * $quantity;
                    }
                    $form->quantity = $quantity;

                    $records = StockRecord::where([
                        'administrator_id' => $model->user->id,
                        'crop_variety_id' => $model->crop_variety_id
                    ])->get();
                    $tot = 0;
                    foreach ($records as $key => $value) {
                        $tot += ((int)($value->quantity));
                    }

                    if ($quantity > $tot) {
                        admin_error("Warning", "There is insufitient quantity stock of crop vareity {$model->crop_variety->crop->name} - {$model->crop_variety->name}. You tried to 
                        enter quantity " . number_format($quantity) . " from " . number_format($tot) . " (Metric Tonnes).");
                        return redirect(admin_url('seed-labs/' . $model->id . "/edit"))->withInput();
                    }
                    $purity = (int)($form->purity);
                    $germination_capacity = (int)($form->germination_capacity);
                    $p_x_g = (($purity * $germination_capacity) / 100);
                    $form->p_x_g = $p_x_g;

                    $form->inspector_is_done = 1;
                    $form->receptionist_is_done = 1;
                    $form->status = 5;


                    $StockRecord = new StockRecord();
                    $StockRecord->administrator_id = $model->administrator_id;
                    $StockRecord->crop_variety_id = $model->crop_variety_id;
                    $StockRecord->is_deposit = 0;
                    $StockRecord->is_transfer = 0;
                    $StockRecord->seed_class = null;
                    $StockRecord->source = null;
                    $StockRecord->quantity = $model->quantity;
                    if ($StockRecord->quantity > 0) {
                        $StockRecord->quantity = ((-1) * $StockRecord->quantity);
                    }
                    $StockRecord->detail = "To seed lab. ID " . $model->id;
                    $StockRecord->save();
                });

                $records = StockRecord::where([
                    'administrator_id' => $model->user->id,
                    'crop_variety_id' => $model->crop_variety_id
                ])->get();
                $tot = 0;
                foreach ($records as $key => $value) {
                    $tot += ((int)($value->quantity));
                }


                $form->setWidth(8, 4);
                $form->display('applicant', 'Applicant')
                    ->default($model->user->name)
                    ->readonly()
                    ->disable();

                $form->display('applicant', 'Crop variety')
                    ->default($model->crop_variety->crop->name . " - " . $model->crop_variety->name);


                $form->hidden('inspector_is_done', __('inspector_is_done'))->attribute('value', 1)->value(1)->default(1)
                    ->readonly()
                    ->disable();

                $form->hidden('receptionist_is_done', __('receptionist_is_done'))->attribute('value', 1)->value(1)->default(1)
                    ->readonly()
                    ->disable();

                $form->display('tests_required', __('Tests required'))
                    ->options(['Moisture content', 'Purity', 'Germination', 'Seed health']);
                $form->divider();
                $form->display('lot_number', __('Lot number'));
                $form->display('lab_test_number', __('Lab test number'));
                $form->divider();


                $form->text('purity', __('Enter Purity (in percentage)'))->attribute([
                    'min', 0,
                    'max', 100,
                ])
                    ->required();


                $form->text('germination_capacity', __('Enter Germination capacity (in percentage)'))->attribute([
                    'min', 0,
                    'max', 100,
                ])
                    ->required();

                $form->text('p_x_g', __('PXG'))->attribute([])
                    ->readonly()
                    ->disable();


                $form->text('abnormal_sprouts', __('Enter Abnormal sprouts (in percentage)'))->attribute([
                    'min' => 0,
                    'max' => 100,
                    'type' => 'number'
                ])
                    ->required();

                $form->text('broken_germs', __('Enter percentage of Broken germs'))->attribute([
                    'min' => 0,
                    'max' => 100,
                    'type' => 'number'
                ])
                    ->required();

                $form->radio('report_recommendation', __('Report recommendation'))
                    ->options([
                        '11' => 'Marketable',
                        '12' => 'Not Marketable',
                    ])
                    ->required();

                $form->hidden('status', __('Status'))->attribute(['value' => 5]);
                /*                
                $form->number('inspector', __('Inspector'));
                $form->number('status', __('Status'))->default(1);
                $form->textarea('status_comment', __('Status comment')); */
                // $form->radio('status', __('Decision'))
                //     ->options([
                //         '10' => 'Accept',
                //         '3' => 'Reject'
                //     ])->when(10, function ($form) {
                //         $items = Administrator::all();
                //         $_items = [];
                //         foreach ($items as $key => $item) {
                //             if (!Utils::has_role($item, "lab-technician")) {
                //                 continue;
                //             }
                //             $_items[$item->id] = $item->name . " - " . $item->id;
                //         }
                //         $form->select('lab_technician', __('Assign lab technician'))
                //             ->options($_items)
                //             ->help('Please select lab technician')
                //             ->rules('required');
                //     })->when(3, function ($form) {
                //         $form->textarea('receptionist_remarks', __('Additional remarks'));
                //     });
                $form->html('<small>NOTE: You cannot reverse this process once is done.</small>');
            }
        }





        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
            $tools->disableList();
        });
        return $form;
    }
}
