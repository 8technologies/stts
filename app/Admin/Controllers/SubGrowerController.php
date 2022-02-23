<?php

namespace App\Admin\Controllers;

use App\Models\SubGrower;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
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
    protected $title = 'Sub-growers';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SubGrower());



        /*for ($i = 0; $i < 300; $i++) {
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



        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created'))->sortable();
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('name', __('Name'))->editable();
        $grid->column('size', __('Size'));
        $grid->column('crop', __('Crop'));
        $grid->column('variety', __('Variety'));
        $grid->column('district', __('District'));
        $grid->column('subcourty', __('Subcourty'));
        $grid->column('planting_date', __('Planting date'));
        $grid->column('quantity_planted', __('Quantity planted'));
        $grid->column('expected_yield', __('Expected yield'));
        $grid->column('phone_number', __('Phone number'));
        $grid->column('gps_latitude', __('Gps latitude'));
        $grid->column('gps_longitude', __('Gps longitude'));
        $grid->column('detail', __('Detail'))->hide();

        $grid->column('status', __('Status'));
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
        $show = new Show(SubGrower::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('name', __('Name'));
        $show->field('size', __('Size'));
        $show->field('crop', __('Crop'));
        $show->field('variety', __('Variety'));
        $show->field('district', __('District'));
        $show->field('subcourty', __('Subcourty'));
        $show->field('planting_date', __('Planting date'));
        $show->field('quantity_planted', __('Quantity planted'));
        $show->field('expected_yield', __('Expected yield'));
        $show->field('phone_number', __('Phone number'));
        $show->field('gps_latitude', __('Gps latitude'));
        $show->field('gps_longitude', __('Gps longitude'));
        $show->field('detail', __('Detail'));
        $show->field('status', __('Status'));
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
        $form = new Form(new SubGrower());

        $form->number('administrator_id', __('Administrator id'))->default(1);
        $form->textarea('name', __('Name'));
        $form->number('size', __('Size'));
        $form->textarea('crop', __('Crop'));
        $form->textarea('variety', __('Variety'));
        $form->textarea('district', __('District'));
        $form->textarea('subcourty', __('Subcourty'));
        $form->textarea('planting_date', __('Planting date'));
        $form->textarea('quantity_planted', __('Quantity planted'));
        $form->textarea('expected_yield', __('Expected yield'));
        $form->textarea('phone_number', __('Phone number'));
        $form->textarea('gps_latitude', __('Gps latitude'));
        $form->textarea('gps_longitude', __('Gps longitude'));
        $form->textarea('detail', __('Detail'));
        $form->textarea('status', __('Status'));
        $form->number('inspector', __('Inspector'));
        $form->textarea('status_comment', __('Status comment'));

        return $form;
    }
}
