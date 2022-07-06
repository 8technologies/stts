<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\PreOrder;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class PreOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'PreOrder';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PreOrder());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))->display(function ($f) {
            return Carbon::parse($f)->toFormattedDateString();
        });
        $grid->column('administrator_id', __('Created by'))->display(function ($id) {
            if ($id == Auth::user()->id) {
                return "You";
            }
            $u = Administrator::find($id);
            if (!$u) {
                return $id;
            }
            return $u->name;
        });

        $grid->column('crop_variety_id', __('Crop variety'))->display(function ($id) {
            $item = CropVariety::find($id);
            if (!$item) {
                return "-";
            }
            return $item->crop->name . " - " . $item->name;
        });

        $grid->column('quantity', __('Quantity'))->display(function ($qty) {
            return number_format($qty) . " KGs";
        });

        $grid->column('seed_class', __('Seed class'));
        $grid->column('invetory_status', __('Invetory status'));
        $grid->column('collection_date', __('Collection date'));
        $grid->column('pickup_location', __('Pickup location'));

        $grid->disableBatchActions();

        $grid->actions(function ($actions) {
            $administrator_id = ((int)(($actions->row['administrator_id'])));
            if ($administrator_id != Auth::user()->id) {
                $actions->disableDelete();
                $actions->disableEdit();
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
        $show = new Show(PreOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('crop_variety_id', __('Crop variety id'));
        $show->field('quantity', __('Quantity'));
        $show->field('seed_class', __('Seed class'));
        $show->field('invetory_status', __('Invetory status'));
        $show->field('collection_date', __('Collection date'));
        $show->field('pickup_location', __('Pickup location'));
        $show->field('detail', __('Detail'));
        $show->field('status', __('Status'));


        $show->panel()
            ->tools(function ($tools) {
                $id = request()->route()->parameters['pre_order'];
                $tools->disableEdit();
                $tools->disableList();
                $tools->disableDelete();
                $tools->append("<a href='" . admin_url('quotations/create?pre_order_id='.$id) . "' class='btn btn-primary'>SUBMIT QUOTATION</a>");
            });;


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PreOrder());

        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))
                ->value(Auth::user()->id)
                ->default(Auth::user()->id);

            $_items = [];
            foreach (CropVariety::all() as $key => $item) {
                $_items[$item->id] = "CROP: " . $item->crop->name . ", VARIETY: " . $item->name;
            }

            $form->select('crop_variety_id', 'Select crop variety')->options($_items)
                ->required();
            $form->text('quantity', __('Quantity (in KGs)'))
                ->required()
                ->attribute('min', 0)
                ->attribute('type', 'number');

            $form->radio('seed_class', __('Seed class'))
                ->options([
                    'Pre-basic' => 'Pre-basic',
                    'Basic' => 'Basic',
                    'Certified' => 'Certified',
                    'Quality declaired seed' => 'Quality declaired seed',
                ])
                ->when('Certified', function (Form $form) {
                    $form->select('invetory_status', __('Select invetory status'))
                        ->options([
                            'Raw' => 'Raw',
                            'Processed' => 'Processed'
                        ]);
                });


            $form->hidden('status', __('Status'))->default(1);
            $form->date('collection_date', __('Collection date'))->required();
            $form->text('pickup_location', __('Pickup location'))->required();
            $form->textarea('detail', __('Detail'));
        }


        $form->disableEditingCheck();
        $form->disableViewCheck();
        $form->disableReset();

        return $form;
    }
}
