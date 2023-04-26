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
 
        
        // $s = SubGrower::find(3);
        // $s->crop = 9;
        // $s->size = rand(10000,1000000000);
        // $s->save();
        // dd("done");
        $grid = new Grid(new SubGrower());

        //as an inspector, view only subgrowers assigned to you
          //check if the role is an inspector and has been assigned that form
          if (Admin::user()->isRole('inspector'))  
          {
              $grid->model()->where('inspector', '=', Admin::user()->id);
              //return an empty table if the inspector has not been assigned any forms
              if (Subgrower::where('inspector', '=', Admin::user()->id)->count() == 0) 
              { 
                  //return an empty table if the inspector has not been assigned an
                  $grid->model(0);       
              }
          }
      

        if (Admin::user()->isRole('admin')) {
            $grid->batchActions(function ($batch) {
                $batch->add(new BatchReplicate()); 
            });
            $grid->actions(function ($actions) {
                    $actions->disableDelete();
                    $actions->disableEdit();    
        
            });
            $grid->disableCreateButton();
        }

        if (Admin::user()->isRole('inspector')) {
            $grid->disableCreateButton();
            $grid->disableBatchActions();
        }
        
        /*

 
        $grid->filter(function ($filter) {
            $filter->equal('status', "Filter by Status")->select([
                '1' => 'Pending',
                '2' => 'Inspection assigned',
                '3' => 'Halted',
                '4' => 'Rejected',
                '5' => 'Accepted',
            ]);
            $filter->equal('crop', "Filter by crop crop")->select(Crop::all()->pluck('name', 'name'));
            $filter->equal('variety', "Filter by crop variety")->select(CropVariety::all()->pluck('name', 'name'));
            $filter->like('district', 'District');
            $filter->like('subcourty', 'Subcouty');
        });


  return $grid;*/

        /*
        
                    return '<span class="badge badge-info">Pending</span>';
        if ($status == 1)
            return '<span class="badge badge-info"></span>';
        if ($status == 2)
            return '<span class="badge badge-primary"></span>';
        if ($status == 3)
            return '<span class="badge badge-warning"></span>';
        if ($status == 4)
            return '<span class="badge badge-danger"></span>';
        if ($status == 5)
            return '<span class="badge badge-success"></span>';
        if ($status == 6)
            return '<span class="badge badge-danger"></span>';
        if ($status == 7)
            return '<span class="badge badge-warning">Provisional</span>';
        if ($status == 8)


        
        for ($i = 0; $i < 300; $i++) {
            # code...

            $sub_g = new SubGrower();
            $faker = \Faker\Factory::create();
            $sub_g->administrator_id = 3;
            $sub_g->name = $faker->name();
            $sub_g->size = $faker->numberBetween(3, 50);
            $sub_g->quantity_planted = $faker->numberBetween(100, 1000);
            $sub_g->expected_yield = $faker->numberBetween(100, 1000);
            $sub_g->phone_number = "0782" . $faker->numberBetween(1000000, 10000000);
            $sub_g->gps_latitude = "0" . $faker->numberBetween(10000, 100000);
            $sub_g->detail = $faker->sentence(100);
            $crops = ['Bush Beans', 'Climbing Beans', 'Ground Nuts,Maize (OPV)'];
            $varieties = ['NABE1', 'NABE2', 'NABE15', 'NABE16', 'NABE17',];
            $districts = ['Kasese', 'Kampala', 'Jinja', 'Mbale', 'Mbarara',];
            shuffle($crops);
            shuffle($varieties);
            shuffle($districts);
            $sub_g->crop = $crops[0];
            $sub_g->variety = $varieties[0];
            $sub_g->district = $districts[0];
            $sub_g->subcourty = $districts[0];
            $sub_g->planting_date = Carbon::now();
            $sub_g->save();
        }*/




        if (Admin::user()->isRole('basic-user')) {
            $grid->model()->where('administrator_id', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
                if ($status == 4) {
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
        } else if (Admin::user()->isRole('inspector') || Admin::user()->isRole('admin')) {
           // $grid->model()->where('inspector', '=', Admin::user()->id);
            $grid->actions(function ($actions) {
                $status = ((int)(($actions->row['status'])));
            
                    $actions->disableDelete();
                    $actions->disableEdit();
                

            }); 
        } else if (Admin::user()->isRole('basic-user')) {
            $grid->actions(function ($actions) {

                $status = ((int)(($actions->row['status'])));
                if ($status == 4) {
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




        $grid->column('id', __('Id'))->sortable();

        $grid->column('created_at', __('Created'))->display(function ($item) {
            return Carbon::parse($item)->diffForHumans();
        })->sortable();


        $grid->column('administrator_id', __('Applicant'))->display(function ($user) {
            $_user = Administrator::find($user);
            if (!$_user) {
                return "-";
            }
            return $_user->name;
        });
        
        

        $grid->column('field_name', __('Field Name'))->sortable();
        $grid->column('name', __('Person responisble'))->sortable();
        $grid->column('size', __('Size'))->sortable();
        $grid->column('crop', __('Crop'))->display(function(){
            return $this->get_crop_name();
        })->sortable();
        $grid->column('variety', __('variety'))->sortable();
        $grid->column('district', __('District'))->sortable();
        $grid->column('subcourty', __('Subcouty'))->sortable();
        $grid->column('quantity_planted', __('Quantity planted'))->sortable();
        $grid->column('expected_yield', __('Expected yield'))->hide();
        $grid->column('phone_number', __('Phone number'))->hide();
        $grid->column('gps_latitude', __('Gps latitude'))->hide();
        $grid->column('gps_longitude', __('Gps longitude'))->hide();
        $grid->column('detail', __('Detail'))->hide();

        $grid->column('status_comment', __('Status comment'));

        $grid->column('inspector', __('Inspector'))->display(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        })->sortable();

        $grid->column('status_comment', __('Status comment'))->hide();

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
        //remove delete from show panels
        $show->panel()
            ->tools(function ($tools) use($id) 
            {
            
                $tools->disableDelete();
            
            });
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
        $show->field('crop', __('Crop'));
        $show->field('variety', __('Variety'));
        $show->field('district', __('District'));
        $show->field('subcourty', __('Subcouty'));
        $show->field('planting_date', __('Planting date'));
        $show->field('quantity_planted', __('Quantity planted'));
        $show->field('expected_yield', __('Expected yield'));
        $show->field('phone_number', __('Phone number'));
        $show->field('gps_latitude', __('Gps latitude'));
        $show->field('gps_longitude', __('Gps longitude'));
        $show->field('detail', __('Detail'));
        $show->field('status', __('Status'))->unescape()->as(function ($status) {
            return Utils::tell_status($status);
        });
        $show->field('inspector', __('Inspector'))->as(function ($userId) {
            if (Admin::user()->isRole('basic-user')) {
                return "-";
            }
            $u = Administrator::find($userId);
            if (!$u)
                return "Not assigned";
            return $u->name;
        });

        $show->field('status_comment', __('Status comment'));
 
        if (!Admin::user()->isRole('basic-user')){
            //button link to the show-details form
            $show->field('id','Action')->unescape()->as(function ($id) {
                return "<a href='/admin/sub-growers/$id/edit' class='btn btn-primary'>Take Action</a>";
            });
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
        $form = new Form(new SubGrower());

        //disable delete button
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
        });

        $user = Admin::user();
        $sr4 = Utils::has_valid_sr6();
        if ($form->isCreating()) {
            if (!$sr4) {
                return admin_error("Alert", "You need to be a registered and approved seed grower to apply for field inspection.");
                // return redirect(admin_url('planting-returns'));
            }
        }

        //callback to return to table after form has been saved
        $form->saved(function (Form $form) {
            return redirect(admin_url('sub-growers'));
        });

        if ($form->isCreating()) {
            $form->hidden('administrator_id')->default($user->id);
        };

        if (Admin::user()->isRole('basic-user')) {

            $form->text('name', __('Name'))->default($user->name)->readonly();
            $form->text('size', __('Garden Size (in Accre)'))->required();

            // $form->select('crop', 'Crop')->options(Crop::all()->pluck('name', 'name'))
            //     ->required();

            $form->select('variety', 'Crop Variety')->options(CropVariety::all()->pluck('name', 'name'))
                ->required();
            $form->text('field_name', __('Field name'))->required();
            $form->text('district', __('District'))->required();
            $form->text('subcourty', __('Subcourty'))->required();
            $form->text('village', __('Village'))->required();
            $form->text('planting_date', __('Planting date'))->required();
            $form->text('quantity_planted', __('Quantity planted'));
            $form->text('expected_yield', __('Expected yield'));
            $form->text('phone_number', __('Phone number'))->required();
            $form->text('gps_latitude', __('Gps latitude'))->required();
            $form->text('gps_longitude', __('Gps longitude'))->required();
            $form->textarea('detail', __('Detail'));
        }

        if (Admin::user()->isRole('inspector')) {

            $id = request()->route()->parameters['sub_grower'];
            $model = $form->model()->find($id);
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
            $form->display('', __('Crop'))->default($model->crop)->readonly();
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

            /*
           
            => null
            "id" => 5
            "created_at" => "2022-03-21 10:20:20"
            "updated_at" => "2022-03-21 11:06:55"
            "administrator_id" => 3
            "name" => "Christ"
            "size" => 11
            "planting_date" => "44176"
            "quantity_planted" => "12"
            "expected_yield" => null
            "phone_number" => "0779755798"
            "gps_latitude" => "0.233"
            "gps_longitude" => "0.111"
            "detail" => null
            "status" => "2"
            "inspector" => 20
            "status_comment" => null
            "field_name" => null


            $form->select('seed_class', 'Select Seed Class')->options([
                'Pre-Basic' => 'Pre-Basic',
                'Certified seed' => 'Certified seed',
                'Basic seed' => 'Basic seed',
            ])
                ->required(); 

            $form->text('crop_cultivar', __('Crop cultivar characteristics: (Off Types)'));
            $form->text('size_of_field', __('Enter size of field: (acres)'));
            $form->text('cultivar_characteristics_types', __('Crop cultivar characteristics: (Off Types)'));
            $form->text('cultivar_characteristics_disease', __('Crop cultivar characteristics: (Diseases)'));
            $form->text('cultivar_characteristics_features', __('Crop cultivar characteristics: (Other features)'));
            $form->text('cultivar_characteristics_noxious_weeds', __('Crop cultivar characteristics: (Noxious Weeds)'));
            $form->text('isolation_distance', __('Enter isolation distance: (meters)'))->attribute('type', 'number');
            $form->text('proposed_distance', __('Status of proposed distance:'));
            $form->text('isolation_time', __('Enter isolation time: (days)'))->attribute('type', 'number');
            $form->text('proposed_isolation', __('Status of proposed isolation time:'));
            $form->textarea('general_condition_of_the_crop', __('Please enter general condition of the crop: (drought, crop husbandry, etc)'));
            $form->textarea('further_remarks', __('Enter any further remarks'));
            $form->text('estimated_yield', __('Enter estimated yield: (metric tonnes)'))->attribute('type', 'number');
            $form->radio('status', __('Review application'))
                ->options([
                    '7' => 'Provisional',
                    '4' => 'Rejected',
                    '5' => 'Accepted',
                ])
                ->required()
                ->when('in', [3, 4], function (Form $form) {
                    $form->textarea('status_comment', 'Enter status comment (Remarks)')
                        ->help("Please specify with a comment");
                }); */

            //$form->number('inspector', __('Inspector'));
            //$form->textarea('status_comment', __('Status comment'));
        }

        return $form;
    }
}
