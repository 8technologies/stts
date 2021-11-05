<?php

namespace App\Admin\Controllers;

use App\Models\FormQds;
use App\Models\FormStockExaminationRequest;
use App\Models\ImportExportPermit;
use App\Models\PlantingReturn;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FormStockExaminationRequestController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Stock examination requests';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormStockExaminationRequest());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('import_export_permit_id', __('Import export permit id'));
        $grid->column('planting_return_id', __('Planting return id'));
        $grid->column('form_qds_id', __('Form qds id'));
        $grid->column('field_size', __('Field size'));
        $grid->column('yield', __('Yield'));
        $grid->column('date', __('Date'));
        $grid->column('purity', __('Purity'));
        $grid->column('germination', __('Germination'));
        $grid->column('moisture_content', __('Moisture content'));
        $grid->column('insect_damage', __('Insect damage'));
        $grid->column('moldiness', __('Moldiness'));
        $grid->column('noxious_weeds', __('Noxious weeds'));
        $grid->column('recommendation', __('Recommendation'));
        $grid->column('state', __('State'));
        $grid->column('inspector', __('Inspector'));
        $grid->column('status_comment', __('Status comment'));

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
        $show = new Show(FormStockExaminationRequest::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('import_export_permit_id', __('Import export permit id'));
        $show->field('planting_return_id', __('Planting return id'));
        $show->field('form_qds_id', __('Form qds id'));
        $show->field('field_size', __('Field size'));
        $show->field('yield', __('Yield'));
        $show->field('date', __('Date'));
        $show->field('purity', __('Purity'));
        $show->field('germination', __('Germination'));
        $show->field('moisture_content', __('Moisture content'));
        $show->field('insect_damage', __('Insect damage'));
        $show->field('moldiness', __('Moldiness'));
        $show->field('noxious_weeds', __('Noxious weeds'));
        $show->field('recommendation', __('Recommendation'));
        $show->field('state', __('State'));
        $show->field('inspector', __('Inspector'));
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
        $form = new Form(new FormStockExaminationRequest());

        $import_permits = [];
        $planting_returnings = [];
        $all_planting_returning = [];
        $my_qds = [];
        $all_qds = [];

        if ($form->isCreating()) {
            if (!Admin::user()->isRole('basic-user')) {
                admin_warning("Warning", "You cannot create a new Stock examination requests.");
                return redirect(admin_url('form-stock-examination-requests'));
            }
        }

        $all_qds =  FormQds::where([
            'administrator_id' => Admin::user()->id
        ])->get();
        foreach ($all_qds as $key => $value) {
            if ($value->status == 5) {
                if (!$value->is_not_used) {
                    $my_qds[$value->id] = "QDS number: " . $value->id;
                }
            }
        }


        $all_planting_returning =  PlantingReturn::where([
            'administrator_id' => Admin::user()->id
        ])->get();
        foreach ($all_planting_returning as $key => $value) {
            if ($value->status == 5) {
                if (!$value->is_not_used) {
                    $planting_returnings[$value->id] = "SR8 number: " . $value->id;
                }
            }
        }


        $all_import_permits =  ImportExportPermit::where([
            'administrator_id' => Admin::user()->id,
            'is_import' => 1
        ])->get();

        foreach ($all_import_permits as $key => $value) {
            if ($value->status == 5) {
                $min_date = Carbon::parse($value->valid_until);
                if (!$min_date->isToday()) {
                    if (!$min_date->isPast()) {
                        $import_permits[$value->id] = "Permit number: " . $value->permit_number;
                    }
                } else {
                    $import_permits[$value->id] = $value->id;
                }
            }
        }



        $form->radio('examination_category', __('Select examination category'))
            ->options([
                '1' => 'Imported seed',
                '2' => 'Grower seed',
                '3' => 'QDs',
            ])
            ->when('1', function (Form $form) {

                $all_import_permits =  ImportExportPermit::where([
                    'administrator_id' => Admin::user()->id,
                    'is_import' => 1
                ])->get();
                foreach ($all_import_permits as $key => $value) {
                    if ($value->status == 5) {
                        $min_date = Carbon::parse($value->valid_until);
                        if (!$min_date->isToday()) {
                            if (!$min_date->isPast()) {
                                $import_permits[$value->id] = "Permit number: " . $value->permit_number;
                            }
                        } else {
                            $import_permits[$value->id] = $value->id;
                        }
                    }
                }

                if (count($import_permits) >= 1) {
                    $form->select('import_export_permit_id', __('Import permit number'))
                        ->options($import_permits);
                }
            })
            ->when('2', function (Form $form) {
                $all_planting_returning =  PlantingReturn::where([
                    'administrator_id' => Admin::user()->id
                ])->get();
                foreach ($all_planting_returning as $key => $value) {
                    if ($value->status == 5) {
                        if (!$value->is_not_used) {
                            $planting_returnings[$value->id] = "SR8 number: " . $value->id;
                        }
                    }
                }

                if (count($planting_returnings) >= 1) {
                    $form->select('planting_return_id', __('Planting return'))
                        ->options($planting_returnings);
                }
            })
            ->when('3', function (Form $form) {
                $all_qds =  FormQds::where([
                    'administrator_id' => Admin::user()->id
                ])->get();

                foreach ($all_qds as $key => $value) {
                    if ($value->status == 5) {
                        if (!$value->is_not_used) {
                            $my_qds[$value->id] = "QDS number: " . $value->id;
                        }
                    }
                }

                if (count($my_qds) >= 1) {
                    $form->select('form_qds_id', __('Select QDS'))
                        ->options($my_qds);
                }
            });




        $form->textarea('field_size', __('Field size'));
        $form->textarea('yield', __('Yield'));
        $form->textarea('date', __('Date'));
        $form->textarea('purity', __('Purity'));
        $form->textarea('germination', __('Germination'));
        $form->textarea('moisture_content', __('Moisture content'));
        $form->textarea('insect_damage', __('Insect damage'));
        $form->textarea('moldiness', __('Moldiness'));
        $form->textarea('noxious_weeds', __('Noxious weeds'));
        $form->textarea('recommendation', __('Recommendation'));
        $form->number('state', __('State'));
        $form->number('inspector', __('Inspector'));
        $form->textarea('status_comment', __('Status comment'));

        return $form;
    }
}
