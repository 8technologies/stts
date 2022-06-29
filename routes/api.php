<?php

use App\Models\Crop;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
<<<<<<< HEAD

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::get('/seed_label_packages_by_seed_lab', function () {
    $id = 0;
    if (isset($_GET['q'])) {
        $id = (int)($_GET['q']);
    }
    $labs = SeedLab::where('id', $id)->get();
    $vals = [];
    $_vals = [];

    if (count($labs) < 1) {
        return $vals;
    }
    $lab = $labs[0];

    if ($lab->crop_variety != null) {
        if ($lab->crop_variety->seed_label_packages != null) {
            if (count($lab->crop_variety->seed_label_packages) > 0) {
                foreach ($lab->crop_variety->seed_label_packages as $key => $value) {
                    $vals['id'] = $value->id;
                    $vals['text'] = $value->package_size . " Kgs @ " . $value->package_price . " UGX";
                    $_vals[] = $vals;
                }
            }
        }
    }
=======
use App\Http\Controllers\Api\FormSr4ApiController;
use App\Http\Controllers\Api\FormSr6ApiController;
use App\Http\Controllers\Api\FormQDSApiController;
use App\Http\Controllers\Api\JWTAuthApiController;
use App\Http\Controllers\Api\UserAPIController;
use Illuminate\Routing\Router;
use App\Http\Middleware\EnsureTokenIsValid;
>>>>>>> dev-1


// Route::group(['prefix' => 'api', 'namespace' => 'Api'], function () {
    Route::post("/register", [JWTAuthApiController::class, "register"]);

    /* ------------------------ For Personal Access Token ----------------------- */
    Route::post("/login", [JWTAuthApiController::class, "login"]);
    /* -------------------------------------------------------------------------- */

    Route::group(['middleware' => 'jwt.verify'], function () {
        Route::post("/logout", [JWTAuthApiController::class, "logout"]);
        Route::get("/profile", [JWTAuthApiController::class, "profile"]);
        Route::post('/refresh', [JWTAuthApiController::class, 'refresh']);
        
        Route::get("/user/list", [UserAPIController::class, "index"]);
        Route::get("/user/{id}", [UserAPIController::class, "show"]);
        Route::put("/user/{id}", [UserAPIController::class, "update"]);
        Route::delete("/user/{id}", [UserAPIController::class, "destroy"]);
        Route::get("/user/search/{name}", [UserAPIController::class, "where"]);

    });
// });

    
        // sr4 forms
        Route::post("/forms/sr4/new", [FormSr4ApiController::class, "new_sr4_form"]);
        // sr6 forms
        Route::post("/forms/sr6/new", [FormSr6ApiController::class, "new_sr6_form"]);
//        // QDS forms
//        Route::post("/forms/qds/new", [FormQDSApiController::class, "form"]);
//        // sr10 forms
//        Route::post("/forms/sr10/new", [FormSr10ApiController::class, "form"]);

     