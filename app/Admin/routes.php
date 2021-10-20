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
});
