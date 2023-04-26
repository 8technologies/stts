<?php

namespace App\Admin\Controllers;

use App\Models\CropVariety;
use App\Models\SeedLab;
use App\Models\Product;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SeedLabelController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'SeedLabel';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SeedLabel());


        $grid->disableFilter();
    
        //view only labels with a status of 13 if the user is not an administrator
        if (Admin::user()->isRole('usta')) 
        {
            
            $grid->model()->where('status', '=', 13)
            ->orWhere('status', '=', 14);

        } 
        else if (Admin::user()->isRole('basic-user')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));

                if (
                    $status != 1 &&
                    $status != 3
                ) 
                {
                    
                    $actions->disableDelete();
                }
            });
        } 
        else if (Admin::user()->isRole('administrator')) 
        {
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));

                if (
                    $status != 1 &&
                    $status != 3
                ) 
                {
                    
                    $actions->disableDelete();
                }
            });
        }

        if (Admin::user()->isRole('usta')) 
        {
            $grid->disableCreateButton();
            $grid->disableExport();
            //$grid->model()->where('status', '=', 13);
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                $status = ((int)(($actions->row['status'])));
                if (
                    $status != 13
                ) {
                    $actions->disableEdit();
                }
            });
        } 
        else if (Admin::user()->isRole('basic-user')) 
        {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
              
                if (
                    $status != 1 &&
                    $status != 3
                ) 
                {
                    
                    $actions->disableDelete();
                }
            });
        } 
        else if (Admin::user()->isRole('admin')) 
        {
            $grid->disableCreateButton();
            $grid->actions(function ($actions) {
                $actions->disableDelete();
              
            });
        } 
      
     
        $grid->column('created_at', __('Created'))
            ->display(function ($item) {
                return Carbon::parse($item)->diffForHumans();
            })->sortable();
        
        $grid->column('administrator_id', __('Crated by'))->display(function ($user) 
        {
            $_user = Administrator::find($user);
            if (!$_user) 
            {
                return "-";
            }
            return $_user->name;
        })->sortable();
        
        $grid->column('crop_variety_id', __('Crop variety'))->display(function () {
            return $this->crop_variety->name;
        })->sortable();

        $grid->column('seed_label_package_id', __('Label package'))->display(function ($user) {
            $value =  $this->seed_label_package;
            return $value->package_size . " Kgs @ " . $value->package_price . " UGX";
        })->sortable();

        $grid->column('quantity', __('Quantity'))->display(function ($var) {
            return number_format($var). " metric tons ";
        });

        $grid->column('status', __('Status'))->display(function ($status) {
            return Utils::tell_status($status);
        })->sortable();

        return $grid;
    }

    /**
     * Make a show builder.
     *=======USTA========
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {

        $show = new Show(SeedLabel::findOrFail($id));
        $seed_label = SeedLabel::findOrFail($id);
        //delete the notification once a user has viewed the form
        if(Admin::user()->isRole('basic-user') )
        {
            if($seed_label->status == 14 || $seed_label->status == 3)
            {
                \App\Models\MyNotification::where(['receiver_id' => Admin::user()->id, 'model_id' => $id, 'model' => 'SeedLabel'])->delete();
            }
        }

        $model = SeedLabel::findOrFail($id);
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'))->as(function ($user) {
            $_user = Administrator::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->name;
        });
        $show->field('seed_lab_id', __('Seed lab id'))->as(function ($seed) {
            return SeedLab::find($seed)->lab_test_number;
        });
        $show->field('crop_variety_id', __('Crop variety id'))->as(function ($crop) {
            return CropVariety::find($crop)->name;
        });
        $show->field('seed_label_package_id', __('Seed label package id'))->as(function ($seed) {
            return SeedLabelPackage::find($seed)->package_price;
        });
        $show->field('quantity', __('Quantity (metric tons)'));
        $show->field('applicant_remarks', __('Applicant remarks'));
        $show->field('receipt', __('Receipt'))->file();
        $show->field('status', __('Status'))->unescape()->as(function ($status) 
        {
            return Utils::tell_status($status);
        });
        //check if the status comment is null
        if($model->status_comment != null)
        {
            $show->field('status_comment', __('Status comment'));
        }
        else
        {
            $show->field('status_comment', __('Status comment'))->as(function ($status) 
            {
                return "No comment";
            });
        }

        if (!Admin::user()->isRole('basic-user'))
        {
            //button link to the show-details form
            //check the status of the form being shown
            if($model->status == 1 || $model->status == 2 || $model->status == null || $model->status == 13)
            {
                $show->field('id','Action')->unescape()->as(function ($id) 
                {
                    return "<a href='/admin/seed-labels/$id/edit' class='btn btn-primary'>Take Action</a>";
                });
            }
        }
    
        

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new SeedLabel());
        $user = Admin::user();
        $seed_labs = [];

        if ($form->isCreating()) 
        {
            
            $form->hidden('administrator_id', __('Administrator id'))
                ->default($user->id);

            //access the seedlab test number for the seed labels
            $res = SeedLab::where([
                'administrator_id' => $user->id,
                'status' => 5
            ])->get();
            foreach ($res as $key => $sl) 
            { 
                if ($sl->quantity < 1) 
                {
                    continue;
                } 
                
                $seed_labs[$sl->id] = "Lab Test Number: " . $sl->lab_test_number;
            }

            if (count($seed_labs) < 1) 
            {
                return admin_error("Alert", "You don't have any  valid LAB TEST NUMBER. Apply for seed lab to aquire a LAB TEST NUMBER.");
                
            }     

        } 

        $form->saved(function (Form $form) 
        {
            return redirect('/admin/seed-labels');
        });
       
        $form->setWidth(8, 4);
        if (Admin::user()->isRole('basic-user')) 
        {

             //access the seed labels from the database
             $_lables = SeedLabelPackage::all();

             $lables = [];
             foreach ($_lables as $key => $val) 
             {
                 $lables[$val->id] = "Package Size: {$val->package_size} Kgs @ : {$val->package_price} UGX";
             }

             

            //callback when the form is being checked to check the quantity being sent in
                  
            $form->saving(function ($form) 
            {
               $package_id = $form->seed_label_package_id;
               $package_size = SeedLabelPackage::find($package_id)->package_size;
               //convert the quantity entered into kgs
                $quantity = intval($form->quantity);
                $quantity *= 1000;
                $available_stock =  intval($quantity / $package_size);   
                $seed_lab = SeedLab::find($form->seed_lab_id);
                
                if (!$seed_lab) 
                {
                    die("seed_label not found");
                }
                if ($form->quantity > $seed_lab->quantity) 
                {
                    return  response(' <p class="alert alert-warning"> You have a less amount of this variety compared to ' . $seed_lab->quantity . ' metric tons that you have in stock. <a href="/admin/seed-labels/create"> Ok </a></p> ');
                          
                }

                $form->crop_variety_id = $seed_lab->crop_variety->id;
                $form->available_stock = $available_stock;
                $form->status = 1;
            });
        


            //callback after the form has saved to calculate the total amount by multiplying the total quantity by the price per unit
            $form->saved(function(Form $form)
            {
                $seed_label = $form->seed_label_package_id;
                $price = SeedLabelPackage::find($seed_label)->package_price;
                $stock = $form->available_stock;
                $total_amount = $price * $stock;

                return  response(' <p class="alert alert-success"> Your total amount is ' . $total_amount . ' Shillings . <a href="/admin/seed-labels"> Ok </a></p> ');
            });

            //form fields
            $form->select('seed_lab_id', __('Select lab test number'))
                ->options($seed_labs)
                ->required();
            $form->select('seed_label_package_id', __('Select Seed label package'))
            ->options($lables)
            ->required();
            $form->hidden('crop_variety_id')->default(1);
            $form->hidden('images')->default("[]");
            $form->hidden('available_stock');
            $form->hidden('status')->default(1)->attribute('value', '1');
            $form->text('quantity', __('Quantity  (metric tons)'))->attribute('type', 'number')->required()
            ->help("The quantity entered shouldnt be more than the quantity you have in stock");
            $form->text('price', __('Enter your selling unit price (Price per KG)'))->attribute('type', 'number')->required();
            $form->image('image', __('Thumbnail Image'))->required();
            $form->textarea('applicant_remarks', __('Remarks'));
            $form->file('receipt', __('Attach receipt'))->required();
        }

        if (Admin::user()->isRole('admin')) 
        {
            $form->display('available_stock', __('Number of Labels'));
            $form->display('applicant_remarks', __('Remarks'));

            $form->radio('status', __('Inspection decision'))
                ->options([
                    '3' => 'Halt',
                    '13' => 'Accepted',
                ])
                ->required()
                ->when('in', [3], function (Form $form) 
                {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                });
        }

        if ( Admin::user()->isRole('usta')) 
        {
            $form->saving(function ($form) 
            {
                   $id = request()->route()->parameters['seed_label'];
                   $model = $form->model()->find($id);
                if ($model->is_processed) 
                {
                    die("This form is already processed.");
                }

                $new_product = new Product();
                $new_product->administrator_id = $model->administrator_id;
                $new_product->available_stock = $model->available_stock;
                $new_product->crop_variety_id = $model->crop_variety_id;
                $new_product->name = $model->crop_variety->name;
                $new_product->detail = $model->applicant_remarks;
                $new_product->price = $model->price;
                $new_product->quantity = $model->quantity;
                $new_product->image_url = $model->image;
                $new_product->seed_label_id = $model->id;
                $new_product->lab_test_number = $model->seed_lab->lab_test_number;
                $new_product->lot_number = $model->lot_number;
                $new_product->seed_class = $model->seed_lab->seed_class;
                $new_product->save();

            });
            $form->display('available_stock', __('Number of Labels'));

            $form->radio('status', __('Set as printed'))
                ->options([
                    '14' => 'Printed',
                ])
                ->required();
        }


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

       

        return $form;
    }
}
