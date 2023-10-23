<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\SubGrower\BatchReplicate;
use App\Models\Crop;
use App\Models\CropVariety;
use App\Models\SubGrower;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;


class SubGrowerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Planting Return - Growers';

    /**
     * 
     * 
     

     * Make a grid builder.
     *
     * @return Grid 
     */
    protected function grid()
    {
 
        $grid = new Grid(new SubGrower());

            //filter by name
       $grid->filter(function ($filter) 
       {
        // Remove the default id filter
        $filter->disableIdFilter();
        $filter->like('administrator_id', 'Applicant')->select(\App\Models\User::pluck('name', 'id'));
       
       });

        //as an inspector, view only subgrowers assigned to you
        //check if the role is an inspector and has been assigned that form
        if (Admin::user()->isRole('inspector'))  
        {
            $grid->model()->where('inspector_id', '=', Admin::user()->id);
            $grid->disableCreateButton();
            $grid->disableBatchActions();
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $actions->disableView();    
    
        });

        }
      

        if (Admin::user()->isRole('admin')) 
        {
            $grid->batchActions(function ($batch) 
            {
                //disable delete
                $batch->disableDelete();
                $batch->add(new BatchReplicate()); 
            });
            $grid->actions(function ($actions) {
                    $actions->disableDelete();
                    $actions->disableEdit();    
        
            });
            $grid->disableCreateButton();
        }

       
        if (Admin::user()->isRole('basic-user')) 
        {
            $userId = Admin::user()->id;
        
            $grid->model()->where('administrator_id', '=', $userId);
        
            $grid->actions(function ($actions) {
                $status = (int)($actions->row['status']);
        
                if ($status == 4 || $status != 1) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        }
        
        $grid->column('created_at', __('Created'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();

        $grid->column('administrator_id', __('Applicant'))->display(function ($user) {
            $_user = Administrator::find($user);
            return $_user ? $_user->name : "-";
        });
        $grid->column('field_name', __('Field Name'));
        $grid->column('name', __('Person responsible'))->sortable();
        $grid->column('size', __('Size'))->sortable();
        $grid->column('crop', __('Crop'))->display(function(){
            return $this->get_crop_name();
        })->sortable();
        $grid->column('variety', __('variety'))->sortable();
        $grid->column('seed_class', __('Seed class'))->sortable();
        $grid->column('inspector_id', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
        
            $u = Administrator::find($userId);
        
            return $u ? $u->name : "Not assigned";
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
        $show = new Show(SubGrower::findOrFail($id));
       
        $subgrower = SubGrower::findOrFail($id);
        if(Admin::user()->isRole('basic-user') ){
            if($subgrower->status == 2 || $subgrower->status == 3 || $subgrower->status == 4 || $subgrower->status == 16){
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'SubGrower'])->delete();
            }
        }
        $show->field('created_at', __('Created at'))->as(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();
        $show->field('administrator_id', __('Created by'))->as(function ($user) {
            $_user = Administrator::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->name;
        });
        $show->field('name', __('Name'));
        $show->field('size', __('Size'));
        $show->field('crop', __('Crop'))->as(function ($crop) {
            return $this->get_crop_name();
        })->sortable();
        $show->field('variety', __('Variety'));
        $show->field('district', __('District'));
        $show->field('subcourty', __('Subcounty'));
        $show->field('planting_date', __('Planting date'));
        $show->field('quantity_planted', __('Quantity planted'));
        $show->field('expected_yield', __('Expected yield'));
        $show->field('phone_number', __('Phone number'));
        $show->field('gps_latitude', __('Gps latitude'));
        $show->field('gps_longitude', __('Gps longitude'));
        $show->field('status', __('Status'))->unescape()->as(function ($status) {
            return Utils::tell_status($status);
        });
    
        $show->field('inspector_id', __('Inspector'))->unescape()->as(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
        
            $u = Administrator::find($userId);
        
            return $u ? $u->name : "Not assigned";
        })->sortable();

         //remove delete from show panels
         $show->panel()->tools(function ($tools) use($id) 
         {
            $tools->disableDelete();
            $tools->disableEdit();
         
         });
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SubGrower());

      
        $user = Admin::user();

        //onsaved return to the list page
        $form->saved(function (Form $form) 
        {
            admin_toastr(__('Form submitted successfully'), 'success');
            return redirect(admin_url('sub-growers'));
        });
        

        if ($form->isCreating()) 
        {
            $form->hidden('administrator_id')->default($user->id);
        };

        if (Admin::user()->isRole('basic-user')) 
        {

            $form->text('name', __('Name'))->default($user->name)->readonly();
            $form->text('size', __('Garden Size (in Acres)'))->attribute ('type', 'number')->required();
            $form->select('crop', 'Crop')->options(Crop::all()->pluck('name', 'name'))
                ->required();
            $form->select('variety', 'Crop Variety')->options(CropVariety::all()->pluck('name', 'name'))
                ->required();
            $form->text('seed_class', __('Seed class'))->required();
            $form->text('lot_number', __('Lot number'))->required();
            $form->text('source_of_seed', __('Source of foundation seed used'))->required();
            $form->text('field_name', __('Field name'))->required();
            $form->text('district', __('District'))->required();
            $form->text('subcourty', __('Subcounty'))->required();
            $form->text('village', __('Village'))->required();
            $form->date('planting_date', __('Planting date'))->required();
            $form->text('quantity_planted', __('Quantity planted(in Kgs)'))->attribute ('type', 'number')->required();
            $form->text('expected_yield', __('Expected yield(in Kgs)'))->attribute ('type', 'number')->required();
            $form->text('phone_number', __('Phone number'))->required();
            $form->text('gps_latitude', __('Gps latitude'))->required();
            $form->text('gps_longitude', __('Gps longitude'))->required();
            $form->textarea('detail', __('Detail'));
        }

        if (Admin::user()->isRole('inspector')) 
        {

            $id = request()->route()->parameters['sub_grower'];
            $model = $form->model()->find($id);
        //get crop name from the model
        $crop = optional(Crop::find($model->crop))->name ?? $model->crop;

            $u = Administrator::find($model->administrator_id);


            $form->html('<h3>Initialize inspection</h3>');
            $form->html('<p class="alert alert-info">This inspection form (SR10) has not been inizilized yet. 
            Select initialize below and submit to start inspection process.</p>');

            $form->display('', __('Applicant'))->default($u->name)->readonly();
            $form->display('', __('Person responsible'))->default($model->name)->readonly();
            $form->display('', __('Field name'))->default($model->field_name)->readonly();
            $form->display('', __('District'))->default($model->district)->readonly();
            $form->display('', __('Subcourty'))->default($model->subcourty)->readonly();
            $form->display('', __('Village'))->default($model->village)->readonly();
            $form->display('', __('Crop'))->default($crop)->readonly();
            $form->display('', __('Variety'))->default($model->variety)->readonly();
            $form->divider();

            $form->select('seed_class', 'Select Seed Class')->options([
                'Pre-Basic' => 'Pre-Basic',
                'Certified seed' => 'Certified seed',
                'Basic seed' => 'Basic seed',
            ])
                ->required();


            $_items = [];
            $crop_val = "";
            foreach (CropVariety::all() as $key => $item) {
                $_items[$item->id] = "CROP: " . $item->crop->name.", Variety: ".$item->name;
                if ($model->crop == $item->name) {
                    $crop_val = $item->id;
                }
            }



            $form->select('crop', 'Select crop variety')->options($_items)->value($crop_val)
                ->default($crop_val)
                ->required();

            $form->radio('status', 'Initialize this form')->options([
                '16' => 'Initialize form' 
            ])->value($crop_val)
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
