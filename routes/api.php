<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\FormSr4ApiController;
use App\Http\Controllers\Api\FormSr6ApiController;
use App\Http\Controllers\Api\FormQDSApiController;
use App\Http\Controllers\Api\AuthApiController;
use App\Http\Controllers\Api\UserAPIController;
use App\Http\Controllers\Api\ResetPasswordController;
use App\Http\Controllers\Api\ProductApiController;
use App\Http\Controllers\Api\OrderApiController;
use App\Http\Controllers\Api\PreOrderApiController;
use App\Http\Controllers\Api\QuotationApiController;
use App\Http\Controllers\Api\FormStockExaminationRequestApiController;
use App\Http\Controllers\Api\MarketableSeedApiController;
use App\Http\Controllers\Api\ImportPermitApiController;
use App\Http\Controllers\Api\ExportPermitApiController;
use App\Http\Controllers\Api\PlantingReturnsCompanyApiController;
use App\Http\Controllers\Api\PlantingReturnsGrowerApiController;
use App\Http\Controllers\Api\FormSr10ApiController;
use App\Http\Controllers\Api\QDSCropDeclarationApiController;
use App\Http\Controllers\Api\SeedLabApiController;
use App\Http\Controllers\Api\SeedLabelApiController;
use App\Http\Controllers\Api\FormStockRecordApiController;
use App\Http\Controllers\Api\CropApiController;
use App\Http\Controllers\Api\CropVarietyApiController;
use Encore\Admin\Facades\Admin;


Admin::routes();

Route::post("/register", [AuthApiController::class, "register"]);
Route::post("/login", [AuthApiController::class, "login"]);

Route::group(['middleware' => 'api'], function ($router) {

    // auth
    Route::get("/me", [AuthApiController::class, "me"]);
    Route::put("/me/update", [AuthApiController::class, "update"]);
    Route::post("/logout", [AuthApiController::class, "logout"]);
    
    // jwt
    Route::post('/refresh', [AuthApiController::class, 'refresh']);

    // password reset/ change
    Route::post('reset_password', [ResetPasswordController::class, 'sendEmail']);

    // users
    Route::get("/user/list", [UserAPIController::class, "index"]);
    Route::get("/user/{id}", [UserAPIController::class, "show"]);
    Route::put("/user/{id}", [UserAPIController::class, "update"]);
    Route::delete("/user/{id}", [UserAPIController::class, "destroy"]);
    Route::get("/user/search/{name}", [UserAPIController::class, "where"]);

    // Application forms
    Route::get("/form-sr4/list", [FormSr4ApiController::class, "form_sr4_list"]);
    Route::get("/form-sr6/list", [FormSr6ApiController::class, "form_sr6_list"]);
    Route::get("/form-qds/list", [FormQDSApiController::class, "form_qds_list"]);
    // post
    Route::post("/forms/sr4/new", [FormSr4ApiController::class, "form_sr4_create"]);
    Route::post("/forms/sr6/new", [FormSr6ApiController::class, "form_sr6_create"]);
    Route::post("/forms/qds/new", [FormQDSApiController::class, "form_qds_create"]);

    // Crops via the SR6 form submit form
    Route::get('/crops-list/', [CropApiController::class, "crops_list"]);
    Route::post('/crops-create/', [CropApiController::class, "crops_create"]);
    Route::get('/crop-varieties-list/', [CropVarietyApiController::class, "crop_varities_list"]);
    
    // Quality Assurance
    Route::get("/import-permit/list", [ImportPermitApiController::class, "import_permits_list"]);
    Route::get("/export-permit/list", [ExportPermitApiController::class, "export_permits_list"]);
    Route::get("/planting-returns-company/list", [PlantingReturnsCompanyApiController::class, "planting_returns_company_list"]);
    Route::get("/planting-returns-grower/list", [PlantingReturnsGrowerApiController::class, "planting_returns_grower_list"]);
    Route::get("/form-sr10/list", [FormSr10ApiController::class, "form_sr10_list"]);
    Route::get("/qds-crop-declarations/list", [QDSCropDeclarationApiController::class, "qds_crop_declarations_list"]);
    Route::get("/seed-labs/list", [SeedLabApiController::class, "seed_lab_list"]);
    Route::get("/seed-labels/list", [SeedLabelApiController::class, "seed_label_list"]);
    // post
    Route::post("/import-permit/list", [ImportPermitApiController::class, "import_permits_list"]);
    Route::post("/export-permit/list", [ExportPermitApiController::class, "export_permits_list"]);
    Route::post("/planting-returns-company/list", [PlantingReturnsCompanyApiController::class, "planting_returns_company_list"]);
    Route::post("/planting-returns-grower/list", [PlantingReturnsGrowerApiController::class, "planting_returns_grower_list"]);
    Route::post("/form-sr10/list", [FormSr10ApiController::class, "form_sr10_list"]);
    Route::post("/qds-crop-declarations/list", [QDSCropDeclarationApiController::class, "qds_crop_declarations_list"]);
    Route::post("/seed-labs/list", [SeedLabApiController::class, "seed_lab_list"]);
    Route::post("/seed-labels/list", [SeedLabelApiController::class, "seed_label_list"]);


    // marketplace
    Route::get("/products/list", [ProductApiController::class, "products_list"]);
    Route::get("/orders/list", [OrderApiController::class, "order_list"]);
    Route::get("/pre-orders/list", [PreOrderApiController::class, "pre_order_list"]);
    Route::get("/quotations/list", [QuotationApiController::class, "quotations_list"]);
    // post
    Route::post("/pre-order/new", [PreOrderApiController::class, "pre_order_create"]);



    // Seed Stock
    Route::get("/form-stock-examination-requests/list", [FormStockExaminationRequestApiController::class, "form_stock_examination_requests_list"]);
    Route::get("/form-stock-records/list", [FormStockRecordApiController::class, "form_stock_records_list"]);
    Route::get("/marktable-seed/list", [MarketableSeedApiController::class, "marktable_seed_list"]);

    
});
