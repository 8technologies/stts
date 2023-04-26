<?php

/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

use App\Models\Utils;
 use App\Models\MyNotification;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;

Encore\Admin\Form::forget(['map', 'editor']);
Admin::css('./assets/css/custom/admin.css');


Admin::navbar(function (\Encore\Admin\Widgets\Navbar $navbar) {
    $navbar->left(view('search-bar'));

    $notifications = [];
    $u =  Auth::user();
    if($u!=null){
       $notifications = Utils::get_notifications($u);
    } 
 

    $navbar->right(view('notification-bell',['notifications' => $notifications]));
    $navbar->right(new \App\Admin\Extensions\Nav\Links());
   

});

// https://laravel-admin.org/docs/en/custom-chart
Admin::js('/vendor/chartjs/dist/Chart.min.js');
