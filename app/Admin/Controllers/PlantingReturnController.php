<?php

namespace App\Admin\Controllers;

use App\Imports\UsersImport;
use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\FormSr10;
use App\Models\FormSr6;
use App\Models\PlantingReturn;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Hamcrest\Util;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\ToModel;


class PlantingReturnController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */  
    protected $title = 'Planting Return - Company/ Breeders';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PlantingReturn());
        $grid->disableExport();
        //check if the role is an inspector and has been assigned that form
        if (Admin::user()->isRole('inspector')) 
        {
            $grid->model()->where('inspector_id', '=', Admin::user()->id);          
        }

        //organise table in descending order
        $grid->model()->orderBy('id', 'desc');


       $grid->filter(function ($filter) 
        {
         // Remove the default id filter
         $filter->disableIdFilter();
         $filter->like('name', 'Company Name')->select(\App\Models\PlantingReturn::pluck('name', 'name'));
        
        });

        if (Admin::user()->isRole('basic-user')) 
        {

            $grid->disableBatchActions();
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) 
            {
                $status = (int)($actions->row['status']);
                $actions->disableDelete();
                
            });
            
        } 

        else if (Admin::user()->isRole('inspector')|| Admin::user()->isRole('admin') ) 
        { 
             $grid->disableCreateButton();
 
             $grid->actions(function ($actions) 
             {
                 $status = ((int)(($actions->row['status'])));
                 $actions->disableDelete();
                 $actions->disableEdit();
                
             });
         } 
         else if (Admin::user()->isRole('basic-user'))  {
            $grid->actions(function ($actions) {

                $status = ((int)(($actions->row['status'])));
                if($status == 4){
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
                if (
                    $status != 1
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        }

        
        $grid->column('created_at', __('Created at'))->display(function ($item) 
        {
                return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('name', __('Company Name'));
        $grid->column('address', __('Address'));
        $grid->column('sub_growers_file', __('Sub growers file'))
            ->display(function ($item) {
                if (!$item) {
                    return "-";
                }
                return "<a href='/storage/$item' target='_blank'>Download</a>";
            });
        $grid->column('amount_enclosed', __('Amount enclosed'));
        $grid->column('registerd_dealer', __('Registered dealer'));
    
        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * 
     * 
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(PlantingReturn::findOrFail($id));

        //deleting notifications once they are viewed
        $planting_return = PlantingReturn::findOrFail($id);
        if(Admin::user()->isRole('basic-user') ){
            if($planting_return->status == 2 || $planting_return->status == 3 || $planting_return->status == 4 || $planting_return->status == 16){
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => ''])->delete();
            }
        }

        //dosable panel tools
        $show->panel()->tools(function ($tools) 
        {
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
        $show->field('administrator_id', __('Created by'))
            ->as(function ($userId) {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            });
        $show->field('name', __('Company Name'));
        $show->field('address', __('Company Address'));
        $show->field('telephone', __('Company Telephone'));
        $show->field('amount_enclosed', __('Amount enclosed for application'));
        $show->field('registerd_dealer', __('Registered seed merchant/dealer to whom the entire seed stock will be sold'));
        $show->field('payment_receipt', __('Payment receipt'))->image();
        $show->field('sub_growers_file', __('Sub-growers excel file'))->file();



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PlantingReturn());
        //onsaved return to the list page
        $form->saved(function (Form $form) 
        {
            admin_toastr(__('Form submitted successfully'), 'success');
            return redirect(admin_url('planting-returns'));
        });
        
        $user = Auth::user();
        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
            $form->hidden('status', __('status'))->value(1);
        } 
        
    
        $form->setWidth(8, 4);
        $form->hidden('seed_rate', __('seed_rate'))->value(rand(10000,1000000))
        ->default((rand(10000,1000000)));

        if (Admin::user()->isRole('basic-user')) 
        {

            $form->text('name', __('Company Name'));
            $form->text('address', __('Company Address'));
            $form->text('telephone', __('Company Telephone'));
            $form->text('amount_enclosed', __('Amount enclosed for application'))->attribute('type', 'number')->required();
            $form->file('payment_receipt', __('Payment receipt'))->required();
            $form->text('registerd_dealer', __('Registered seed merchant/dealer to whom the entire seed stock will be sold'));
            $link = url('/assets/files/sub-growsers-template.xlsx');
            $form->html('<h3>Download sub-growers template file (Excel) ... <a href="'.$link.'" clast="btn btn-primary"
            style="border: solid green 2px;"
            target="_blank"
            >DOWNLOAD TEMPLATE</a></h3>');
            $form->file('sub_growers_file', __('Sub-growers excel file'))
            ->help("To upload many planting_returns, attach an Excel file of multiple Sub-growers here.")
            ->required();     
 
        }

        //disable bottom checkboxes
        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        //disable top buttons
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            $tools->disableView();
        });

        return $form;
    }
}