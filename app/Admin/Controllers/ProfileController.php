<?php

namespace App\Admin\Controllers;

use App\models\Profile;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\URL;

class ProfileController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Profile';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Profile());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));

        $grid->created_at()->display(function ($category_id) {
            return $category_id;
        });

        #$grid->column('updated_at', __('Updated at'));
        #$grid->column('user_id', __('User id'));
        $grid->column('first_name', __('First name'));
        $grid->column('last_name', __('Last name'));
        $grid->column('company_name', __('Company name'));
        #$grid->column('email', __('Email'));
        #$grid->column('phone_number', __('Phone number'));
        #$grid->column('location', __('Location'));
        #$grid->column('about', __('About'));
        #$grid->column('services', __('Services'));
        #$grid->column('longitude', __('Longitude'));
        #$grid->column('latitude', __('Latitude'));
        #$grid->column('division', __('Division'));
        #$grid->column('opening_hours', __('Opening hours'));
        #$grid->column('profile_photo', __('Profile photo'));
        #$grid->column('cover_photo', __('Cover photo'));
        #$grid->column('facebook', __('Facebook'));
        #$grid->column('twitter', __('Twitter'));
        #$grid->column('whatsapp', __('Whatsapp'));
        #$grid->column('youtube', __('Youtube'));
        #$grid->column('instagram', __('Instagram'));
        #$grid->column('last_seen', __('Last seen'));
        $grid->column('status', __('Status'));

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
        $show = new Show(Profile::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('user_id', __('User id'));
        $show->field('first_name', __('First name'));
        $show->field('last_name', __('Last name'));
        $show->field('company_name', __('Company name'));
        $show->field('email', __('Email'));
        $show->field('phone_number', __('Phone number'));
        $show->field('location', __('Location'));
        $show->field('about', __('About'));
        $show->field('services', __('Services'));
        $show->field('longitude', __('Longitude'));
        $show->field('latitude', __('Latitude'));
        $show->field('division', __('Division'));
        $show->field('opening_hours', __('Opening hours'));


        $show->profile_photo()->unescape()->as(function ($profile_photo) {
            $pic = json_decode($profile_photo);

            return '<img width="200" src=' . URL::asset('storage/' . str_replace("public/", "", $pic->thumbnail)) . ' />';
        });
        $show->cover_photo()->unescape()->as(function ($cover_photo) {
            $pic = json_decode($cover_photo);

            return '<img width="200" src=' . URL::asset('storage/' . str_replace("public/", "", $pic->thumbnail)) . ' />';
        });

 
        $show->field('facebook', __('Facebook'));
        $show->field('twitter', __('Twitter'));
        $show->field('whatsapp', __('Whatsapp'));
        $show->field('youtube', __('Youtube'));
        $show->field('instagram', __('Instagram'));
        $show->field('last_seen', __('Last seen'));
        $show->field('status', __('Status'));



        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Profile());

        $form->number('user_id', __('User id'));
        $form->text('first_name', __('First name'));
        $form->text('last_name', __('Last name'));
        $form->text('company_name', __('Company name'));
        $form->email('email', __('Email'));
        $form->text('phone_number', __('Phone number'));
        $form->text('location', __('Location'));
        $form->textarea('about', __('About'));
        $form->text('services', __('Services'));
        $form->text('longitude', __('Longitude'));
        $form->text('latitude', __('Latitude'));
        $form->text('division', __('Division'));
        $form->text('opening_hours', __('Opening hours'));
        $form->text('profile_photo', __('Profile photo'));
        $form->text('cover_photo', __('Cover photo'));
        $form->text('facebook', __('Facebook'));
        $form->text('twitter', __('Twitter'));
        $form->text('whatsapp', __('Whatsapp'));
        $form->text('youtube', __('Youtube'));
        $form->text('instagram', __('Instagram'));
        $form->text('last_seen', __('Last seen'));
        $form->text('status', __('Status'));

        $options["active"] = "active";
        $options["pending"] = "pending";
        $options["blocked"] = "blocked";
        $form->select('status')->options($options)->rules('required');

        return $form;
    }
}
