<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\FormCropDeclaration;
use App\Models\Utils;
use App\Models\FormQds;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Form\NestedForm;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;


class FormCropDeclarationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'QDS - Crop Declarations';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormCropDeclaration());
       //order by id desc
        $grid->model()->orderBy('id', 'desc');
        

        $grid->disableFilter();

        if (Admin::user()->isRole('basic-user')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) 
            {
                $status = ((int)(($actions->row['status'])));
                if (
                    $status != 1 
                
                ) {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
            });
        } else if (Admin::user()->isRole('inspector')) 
        {
            $grid->model()->where('inspector_id', '=', Admin::user()->id);
            $grid->disableCreateButton();
            $grid->actions(function ($actions) 
            {
                $actions->disableDelete();
                $actions->disableEdit();
                
            });
        } else {
            $grid->disableCreateButton();
            $grid->actions(function ($actions) 
            {
                $actions->disableDelete();
                $actions->disableEdit();
            });
        }

        $grid->column('id', __('Id'))->sortable(); 
        $grid->column('created_at', __('Created'))
            ->display(function ($item) 
            {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        $grid->column('administrator_id', __('Created by'))->display(function ($userId)
            {
                $u = Administrator::find($userId);
                if (!$u)
                    return "-";
                return $u->name;
            })->sortable();


        $grid->column('field_size', __('Field size'))->display(function ($field_size) 
        {
            return $field_size . " Acres";
        });
        $grid->column('seed_rate', __('Seed rate'))->display(function ($seed_rate) 
        {
            return $seed_rate . " kgs per acre";
        });
        $grid->column('amount', __('Amount'))->display(function ($amount) 
        {
            return "UGX. " . $amount;
        });
        $grid->column('status', __('Status'))->display(function ($status) 
            {
                return Utils::tell_status($status);
            })->sortable();

        $grid->column('inspector_id', __('Inspector'))->display(function ($userId) 
        {
            if (Admin::user()->isRole('basic-user')) 
            {
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
        $show = new Show(FormCropDeclaration::findOrFail($id));
        $model = FormCropDeclaration::findOrFail($id);
        $show->panel()
            ->tools(function ($tools) 
            {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Applicant'))->as(function ($id) 
        {
            $u = Administrator::find($id);
            if (!$u)
                return "-";
            return $u->name;
        });
        
        $show->field('form_crop_declarations_has_crop_varieties', __('Crops'))
        ->unescape()
        ->as(function ($item) 
        {
            
            if (!$this->form_crop_declarations_has_crop_varieties) 
            {
                return "None";
            }

            $headers = ['Crop',  'Category'];
            $rows = array();
            foreach ($this->form_crop_declarations_has_crop_varieties as $key => $val) 
            {
                
                $row['crop'] = $val->crop_variety->crop->name;
                $row['variety'] = $val->crop_variety->name;
                $rows[] = $row;
              
            }

            $table = new Table($headers, $rows);
            return $table;
        });
        
        $show->field('source_of_seed', __('Source of seed'));
        $show->field('field_size', __('Field size'))->as(function ($field_size) 
        {
            return $field_size . " Acres";
        });
        $show->field('seed_rate', __('Seed rate'))->as(function ($seed_rate) 
        {
            return $seed_rate . " kgs per acre";
        });
        $show->field('amount', __('Amount'))->as(function ($amount) 
        {
            return "UGX. " . $amount;
        });
        $show->field('payment_receipt', __('Payment receipt'))->file();
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {

            return Utils::tell_status($status);
        });
        $show->field('inspector_id', __('Inspector'))->as(function ($id) 
        {
            $u = Administrator::find($id);
            if (!$u)
                return "Not assigned";
            return $u->name;
        });
        $show->field('status_comment', __('Status comment'));

        Utils::take_action($model, $id ,'form-crop-declarations',$show);

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FormCropDeclaration());
        $form->disableCreatingCheck();
        $form->tools(function (Form\Tools $tools) 
        {
            $tools->disableDelete();
            $tools->disableView();
        });
        $form->setWidth(8, 4);

        //callback after saving to redirect to table
        $form->saved(function (Form $form) 
        {
            return redirect(admin_url('form-crop-declarations'));
        });

        if ($form->isCreating()) 

        {
            $qds = FormQds::where('administrator_id',  Admin::user()->id)->where('valid_until','>=', Carbon::now())->first();
            if (!$qds) 
            {
                return admin_warning("Warning", "To apply for QDS Declaration, you must be an approved QDS Producer");
                return redirect(admin_url('form-crop-declarations'));
            }
        }


        if ($form->isCreating()) 
        {
            $user = Admin::user();
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else 
        {
            $form->hidden('administrator_id', __('Administrator id'));
        }

       

        //basic_user fields
        if (Admin::user()->isRole('basic-user')) 
        {
            $form->saving(function ($form) 
            {
                $qds_id = FormQds::where('administrator_id', Admin::user()->id)->where('status' , 5)
                          ->first()->id;
                $form->status = 1;
                $form->form_qd_id = $qds_id;
            });

            $form->hidden('form_qd_id', __('form_qd_id'));

            $form->text('source_of_seed', __('Enter source of seed'))->required();
            $form->text('field_size', __('Enter field size (in Acres)'))->attribute('type', 'number')->required();
            $form->text('seed_rate', __('Enter Seed rate(kgs per acre)'))->attribute('type', 'number')->required();

            $form->hasMany('form_crop_declarations_has_crop_varieties', __('Click on "NEW" to add Crop varieties'), function (NestedForm $form) {
               
                $form->select('crop_variety_id', __('Select Crop Variety'))->options(CropVariety::all()->pluck('name', 'id'))->required();
            });
            $form->divider();
            $form->text('amount', __('Enter the amount enclosed'))->attribute('type', 'number')->required();
            $form->file('payment_receipt', __('Upload Payment receipt'))->required();

            $form->footer(function ($footer) 
            {

                $footer->disableViewCheck();
                $footer->disableReset();
                $footer->disableCreatingCheck();
            });
            $form->hidden('status', __('Status'))->value(1)->attribute('value', 1);
        }

     
        //admin form fields
        if (Admin::user()->isRole('admin')) 
        {

            $form->display('id', __('Crop Declaration Form ID:'))->required();
            $form->display('field_size', __('Field (in Acres)'))->required();
            $form->display('seed_rate', __('Seed rate(kgs per acre)'))->required();
            $form->divider();
            $form->radio('status', __('Action'))
                ->options([
                    '2' => 'Assign Inspector',
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
                        $_items[$item->id] = $item->name ;
                    }
                    $form->select('inspector_id', __('Inspector'))
                        ->options($_items)
                        ->help('Please select inspector')
                        ->rules('required');
                });
              
        }


       //inspector form fields
        if (Admin::user()->isRole('inspector')) 
        {
            $form->display('id', __('Crop Declaration Form ID:'))->disable();
            $form->display('field_size', __('Field size (in Acres)'))->disable();
            $form->display('seed_rate', __('Seed rate(kgs per acre)'))->disable();

            $form->radio('status', __('Status'))
                ->options([
                    '16' => 'Initialized',
                ])
                ->required();
                
        }

        //disable checkboxes
        $form->disableViewCheck();
        $form->disableEditingCheck();
        $form->disableCreatingCheck();

      
        return $form;
    }
}
