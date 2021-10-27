<?php

namespace App\Admin\Controllers;

use App\Models\Crop;
use App\Models\ImportExportPermit;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class ImportExportPermitController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ImportExportPermit';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ImportExportPermit());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        
        $grid->column('name', __('Name'));
        $grid->column('telephone', __('Telephone'));
        $grid->column('quantiry_of_seed', __('Quantiry of seed'));
         
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

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('telephone', __('Telephone'));
        $show->field('national_seed_board_reg_num', __('National seed board reg num'));
        $show->field('store_location', __('Store location'));
        $show->field('quantiry_of_seed', __('Quantiry of seed'));
        $show->field('name_address_of_origin', __('Name address of origin'));
        $show->field('details', __('Details'));
        $show->field('ista_certificate', __('Ista certificate'));

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
        $form->setWidth(8, 4);
        $user = Auth::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }

        $form->text('name', __('Name'))->default($user->name)->required();
        $form->text('address', __('Postal Address'))->required();
        $form->text('telephone', __('Phone number'))->required();
        $form->text(
            'national_seed_board_reg_num',
            __('National seed board registration number')
        )->required();
        $form->text('store_location', __('Location of the store'))->required();
        $form->text(
            'quantiry_of_seed',
            __('Quantity of seed of the same variety held in stock')
        )
            ->help("In METRIC TONNES")
            ->attribute(['type' => 'number'])
            ->required();
        $form->text(
            'name_address_of_origin',
            __('Name and address of origin')
        )
            ->required();


        $form->html('<h3>I/We wish to apply for a license to produce seed as indicated below:</h3>');

        $form->hasMany('import_export_permits_has_crops', __('Click on "New" to Add Crops
            '), function (NestedForm $form) {
            $_items = [];
            foreach (Crop::all() as $key => $item) {
                $_items[$item->id] = $item->name . " - " . $item->id;
            }
            $form->select('crop_id', 'Add Crop')->options(Crop::all()->pluck('name', 'id'))
                ->required();
            $form->text('varieties', __('Crop variety'))->required();
            $form->text('category', __('Category'))->required();
            $form->text('weight', __('Weight (in KGs)'))->required();
        });


        $form->file('ista_certificate', __('Ista certificate'))->required();

        return $form;
    }
}
