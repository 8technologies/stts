<?php

namespace App\Admin\Controllers;

use App\Models\FormSr6;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class FormSr6Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FormSr6';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FormSr6());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('administrator_id', __('Administrator id'));
        $grid->column('name_of_applicant', __('Name of applicant'));
        $grid->column('address', __('Address'));
        $grid->column('company_initials', __('Company initials'));
        $grid->column('premises_location', __('Premises location'));
        $grid->column('years_of_expirience', __('Years of expirience'));
        $grid->column('dealers_in', __('Dealers in'));
        $grid->column('previous_grower_number', __('Previous grower number'));
        $grid->column('cropping_histroy', __('Cropping histroy'));
        $grid->column('have_adequate_isolation', __('Have adequate isolation'));
        $grid->column('have_adequate_labor', __('Have adequate labor'));
        $grid->column('aware_of_minimum_standards', __('Aware of minimum standards'));
        $grid->column('signature_of_applicant', __('Signature of applicant'));
        $grid->column('grower_number', __('Grower number'));
        $grid->column('registration_number', __('Registration number'));
        $grid->column('valid_from', __('Valid from'));
        $grid->column('valid_until', __('Valid until'));
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
        $show = new Show(FormSr6::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('administrator_id', __('Administrator id'));
        $show->field('name_of_applicant', __('Name of applicant'));
        $show->field('address', __('Address'));
        $show->field('company_initials', __('Company initials'));
        $show->field('premises_location', __('Premises location'));
        $show->field('years_of_expirience', __('Years of expirience'));
        $show->field('dealers_in', __('Dealers in'));
        $show->field('previous_grower_number', __('Previous grower number'));
        $show->field('cropping_histroy', __('Cropping histroy'));
        $show->field('have_adequate_isolation', __('Have adequate isolation'));
        $show->field('have_adequate_labor', __('Have adequate labor'));
        $show->field('aware_of_minimum_standards', __('Aware of minimum standards'));
        $show->field('signature_of_applicant', __('Signature of applicant'));
        $show->field('grower_number', __('Grower number'));
        $show->field('registration_number', __('Registration number'));
        $show->field('valid_from', __('Valid from'));
        $show->field('valid_until', __('Valid until'));
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
        $form = new Form(new FormSr6());


        // callback before save
        $form->saving(function (Form $form) {
            if (isset($_POST['group-a'])) {
                $form->dealers_in = json_encode($_POST['group-a']);
                //echo($form->dealers_in);
            }
        });


        $form->setWidth(8, 4);
        Admin::style('.form-group  {margin-bottom: 25px;}');
        $user = Auth::user();
        if ($form->isCreating()) {
            $form->hidden('administrator_id', __('Administrator id'))->value($user->id);
        } else {
            $form->hidden('administrator_id', __('Administrator id'));
        }


        $form->hidden('dealers_in', __('dealers_in'));

        if (Admin::user()->isRole('basic-user')) {
            $form->text('name_of_applicant', __('Name of applicant'))->default($user->name)->required()->required();
            $form->text('address', __('Address'))->required();
            $form->text('company_initials', __('Company initials'))->required();
            $form->text('premises_location', __('Premises location'))->required();
            $form->text('years_of_expirience', __('Years of expirience as seed grower'))
                ->rules('min:1')
                ->attribute('type', 'number')
                ->required();

            $repeat = "";
            if($form->isEditing()){
                $sec  = ((int)(request()->segment(3)));
                if($sec > 0){
                    $da = FormSr6::findOrFail($sec);
                    if($da){
                        if(isset($da->dealers_in)){
                            if(strlen($da->dealers_in)>3){
                                $_reapeat_data = json_decode($da->dealers_in);

                                foreach ($_reapeat_data as $key => $val) {
                                    $repeat .= '<tr data-repeater-item>
                                    <td><input value="'.$val->crop.'" class="form-control" required name="crop" type="text"></td>
                                    <td><input value="'.$val->variety.'" class="form-control" required name="variety" type="text"></td>
                                    <td><input value="'.$val->ha.'" class="form-control" required name="ha" type="text"></td>
                                    <td><input value="'.$val->origin.'" class="form-control" required name="origin" type="text"></td>
                                    <td><button class="btn btn-danger btn-sm" data-repeater-delete type="button">
                                    <span>Delete</span>
                                  </button></td>
                                    </tr>';
                                } 
                            }
                        }
                    }
                } 
            }
            
          
            $form->html('<h3>I/We wish to apply for a license to produce seed as indicated below:</h3>');
            $form->html('<div class="repeater">
            <table class="table">
                <thead>
                    <tr>
                        <th>Crops(s)</th>
                        <th>Vatiety</th>
                        <th>Ha</th>
                        <th>Origin/Source</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody data-repeater-list="group-a">
                    '.$repeat.'
                </tbody>
            </table>
            <input data-repeater-create class="btn btn-success btn-sm" type="button" value="Add" />
        </div>');



            // $form->table('dealers_in', function ($table) {
            //     $table->text('key');
            //     $table->text('value');
            //     $table->text('desc');
            //     $table->text('romina');
            // });

            //URL::asset('/assets/js/vendor/nice-select.min.js')
            Admin::js('/assets/js/vendor/jquery.repeater.min.js');
            Admin::js('/assets/js/vendor/form-repeater.min.js');


            //$form->textarea('dealers_in', __('Dealers in'));
            $form->text('previous_grower_number', __('Previous grower number'));
            $form->textarea('cropping_histroy', __('Cropping histroy'));
            $form->switch('have_adequate_isolation', __('Have adequate isolation'));
            $form->switch('have_adequate_labor', __('Have adequate labor'));
            $form->switch('aware_of_minimum_standards', __('Aware of minimum standards'));
            $form->textarea('signature_of_applicant', __('Signature of applicant'));
            $form->text('grower_number', __('Grower number'));
            $form->text('registration_number', __('Registration number'));
            $form->datetime('valid_from', __('Valid from'))->default(date('Y-m-d H:i:s'));
            $form->datetime('valid_until', __('Valid until'))->default(date('Y-m-d H:i:s'));
            $form->text('status', __('Status'));
            $form->number('inspector', __('Inspector'));
            $form->textarea('status_comment', __('Status comment'));
        }

        return $form;
    }
}
