<?php

use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;


Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('users', UserController::class);
    $router->resource('products', ProductController::class);
    $router->resource('categories', CategoryController::class);
    $router->resource('attributes', AttributeController::class);
    $router->resource('countries', CountryController::class);
    $router->resource('cities', CityController::class);
    $router->resource('profiles', ProfileController::class);

    $router->resource('form-sr4s', FormSr4Controller::class);
    $router->resource('form-sr6s', FormSr6Controller::class);
    $router->resource('form-qds', FormQdsController::class);
    $router->resource('crops', CropController::class);
    $router->resource('import-export-permits', ImportExportPermitController::class);
    $router->resource('import-export-permits-2', ImportExportPermitController2::class);
    
    $router->resource('test1s', Test1Controller::class);
});
