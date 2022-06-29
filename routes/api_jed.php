<?php

use App\Models\Crop;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserAPIController;
// use App\Http\Controllers\Api\PassportApiAuthController;
use App\Http\Controllers\Api\SanctumAuthApiController;
use App\Http\Controllers\Api\FormSr4ApiController;
use Illuminate\Routing\Router;
// use App\Http\Controllers\Api\FormSr6ApiController;
use App\Http\Middleware\EnsureTokenIsValid;


// All API protected routes here
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post("/register", [SanctumAuthApiController::class, "register"])->name('register.api');
   
    Route::post("/login", [SanctumAuthApiController::class, "login"])->name('login.api');
    
    Route::get('/profile', function(Request $request) {
        if (!$request->user()){
            return response()->json([
                'success' => false,
                'message' => 'Sorry no user logged in.',
            ], 201);
        }
        return $request->user()->id;
    });

    Route::post("/logout", [SanctumAuthApiController::class, "logout"])->name('logout.api');
});


// User workflow
Route::group(['middleware' => ['cors', 'json.response']], function () {
    Route::get("user/list", [UserAPIController::class, "index"]);
    Route::get("user/{id}", [UserAPIController::class, "show"]);
    Route::put("user/{id}", [UserAPIController::class, "update"]);
    Route::delete("user/{id}", [UserAPIController::class, "destroy"]);
    Route::get("user/search/{name}", [UserAPIController::class, "where"]);

    // sr4 forms
    Route::post("forms/sr4/new/", [FormSr4piController::class, "form"])->middleware('auth');
    // sr6 forms
    Route::post("forms/sr6/new/", [FormSr6ApiController::class, "form"])->middleware('auth');
    // QDS forms
    Route::post("forms/qds/new/", [FormQDSApiController::class, "form"])->middleware('auth');
    // sr10 forms
    Route::post("forms/sr10/new/", [FormSr10ApiController::class, "form"])->middleware('auth');
});
