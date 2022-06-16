<?php

use App\Models\Crop;
use App\Models\SeedLab;
use App\Models\SeedLabel;
use App\Models\SeedLabelPackage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\PassportController;
use App\Http\Controllers\Api\UserAPIController;
use App\Http\Controllers\Api\FormSr4ApiController;
use Illuminate\Routing\Router;
// use App\Http\Controllers\Api\FormSr6ApiController;
use App\Http\Middleware\EnsureTokenIsValid;


// Authentication APIs
// Route::post('/register', [AuthController::class, 'register']);
// Route::post('/login', [AuthController::class, 'login']);
// Route::post('/logout', [AuthController::class, 'logout']);

// Route::post('register', [PassportController::class, 'register']);
// Route::post('login', [PassportController::class, 'login']);
    // Route::post('user-detail', [PassportController::class, 'userDetail']);
    // Route::post('logout', [PassportController::class, 'logout']);

// All api protected routes here
Route::middleware('auth:api')->group(function () {
    Route::post("/logout", [PassportController::class, "logout"])->name('logout.api');
});


// User workflow  https://www.toptal.com/laravel/passport-tutorial-auth-user-access
Route::group(['middleware' => ['cors', 'json.response']], function () {
    // public routes
    Route::post("/register", [PassportController::class, "register"])->name('register.api');
    Route::post("/login", [PassportController::class, "login"])->name('login.api');

    Route::get("user/list", [UserAPIController::class, "index"]);
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
    Route::get("user/{id}", [UserAPIController::class, "show"]);


// Data access APIs
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


    return $_vals;
});

Route::get('/seed_label_packages', function () {
    $id = 0;
    if (isset($_GET['q'])) {
        $id = (int)($_GET['q']);
    }
    if ($id > 0) {
        $crops = SeedLabelPackage::where('crop_variety_id', $id)->get();
    } else {
        $crops = SeedLabelPackage::all();
    }
    $vals = [];
    foreach ($crops as $key => $value) {
        $vals[$value->id] = $value->$value . " Kgs @ " . $value->package_price . " UGX";
    }
    return $vals;
});

Route::get('/crops', function () {
    $id = 0;
    if (isset($_GET['q'])) {
        $id = (int)($_GET['q']);
    }
    if ($id > 0) {
        $crops = Crop::find($id);
    } else {
        $crops = Crop::all();
    }
    return $crops;
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
