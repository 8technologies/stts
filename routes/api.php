<?php

use App\Models\Crop;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\FormSr4ApiController;
use App\Http\Controllers\Api\FormSr6ApiController;
use App\Http\Controllers\Api\FormQDSApiController;
use App\Http\Controllers\Api\JWTAuthApiController;
use App\Http\Controllers\Api\AuthApiController;
use App\Http\Controllers\Api\UserAPIController;
use App\Http\Controllers\Api\ResetPasswordController;
use App\Http\Controllers\Api\ProductApiController;
use App\Http\Controllers\Api\PProductApiController;
use Illuminate\Routing\Router;
use App\Http\Middleware\EnsureTokenIsValid;
use Encore\Admin\Facades\Admin;

Admin::routes();

Route::post("/register", [AuthApiController::class, "register"]);
Route::post("/login", [AuthApiController::class, "login"]);

Route::group(['middleware' => 'api'], function ($router) {
    Route::post("/logout", [AuthApiController::class, "logout"]);
    Route::get("/me", [AuthApiController::class, "me"]);
    
    Route::post('/refresh', [AuthApiController::class, 'refresh']);

    // password reset/ change
    Route::post('reset_password', [ResetPasswordController::class, 'sendEmail']);


    // users
    Route::get("/user/list", [UserAPIController::class, "index"]);
    Route::get("/user/{id}", [UserAPIController::class, "show"]);
    Route::put("/user/{id}", [UserAPIController::class, "update"]);
    Route::delete("/user/{id}", [UserAPIController::class, "destroy"]);
    Route::get("/user/search/{name}", [UserAPIController::class, "where"]);


    // form submission
    // sr4 forms
    Route::post("/forms/sr4/new", [FormSr4ApiController::class, "new_sr4_form"]);
    // sr6 forms
    Route::post("/forms/sr6/new", [FormSr6ApiController::class, "new_sr6_form"]);
    // // QDS forms
    // Route::post("/forms/qds/new", [FormQDSApiController::class, "form"]);
    // // sr10 forms
    // Route::post("/forms/sr10/new", [FormSr10ApiController::class, "form"]);



});

    // marketplace
    Route::get("/products/list", [PProductApiController::class, "products_list"]);
    
    $router->resource('products', ProductApiController::class);
