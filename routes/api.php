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
    // AUTH -----------------------------------------------------------------------------------------------------------*/
    // auth
    Route::get("/me", [AuthApiController::class, "me"]);
    Route::put("/me/update", [AuthApiController::class, "update"]);
    Route::post("/logout", [AuthApiController::class, "logout"]);
    
    // jwt
    Route::post('/refresh', [AuthApiController::class, 'refresh']);

    // password reset/ change
    Route::post('reset_password', [ResetPasswordController::class, 'sendEmail']);

    // USERS -----------------------------------------------------------------------------------------------------------*/
    // users
    Route::get("/user/list", [UserAPIController::class, "index"]);
    Route::get("/user/{id}", [UserAPIController::class, "show"]);
    Route::put("/user/{id}", [UserAPIController::class, "update"]);
    Route::delete("/user/{id}", [UserAPIController::class, "destroy"]);
    Route::get("/user/search/{name}", [UserAPIController::class, "where"]);

    // APPLICATION FORMS ------------------------------------------------------------------------------------------------*/
    // sr4
    Route::post("/forms/sr4/new", [FormSr4ApiController::class, "form_sr4_create"]);
    Route::get("/form-sr4/list", [FormSr4ApiController::class, "form_sr4_list"]);
    Route::post("/forms/sr4/delete", [FormSr4ApiController::class, "form_sr4_delete"]);
    // sr6
    Route::post("/forms/sr6/new", [FormSr6ApiController::class, "form_sr6_create"]);
    Route::get("/form-sr6/list", [FormSr6ApiController::class, "form_sr6_list"]);
    Route::post("/forms/sr6/delete", [FormSr6ApiController::class, "form_sr6_delete"]);
    // qds
    Route::post("/forms/qds/new", [FormQDSApiController::class, "form_qds_create"]);
    Route::get("/form-qds/list", [FormQDSApiController::class, "form_qds_list"]);
    Route::post("/forms/qds/delete", [FormQDSApiController::class, "form_qds_delete"]);

    // Crops via the SR6 form submit form
    Route::get('/crops-list/', [CropApiController::class, "crops_list"]);
    Route::post('/crops-create/', [CropApiController::class, "crops_create"]);
    Route::get('/crop-varieties-list/', [CropVarietyApiController::class, "crop_varities_list"]);

    // QUALITY ASSURANCE ------------------------------------------------------------------------------------------------*/
    // import / export permits    ['is_import'=1  => 'import_permit'  |  'is_import'=0 => 'export_permit' ]
    Route::post("/import-permit/new", [ImportPermitApiController::class, "import_permits_create"]);
    Route::get("/import-permit/list", [ImportPermitApiController::class, "import_permits_list"]);
    Route::post("/import-permit/delete", [ImportPermitApiController::class, "import_permit_delete"]);

    // export permits
    // Route::post("/export-permit/new", [ImportExportPermitApiController::class, "import_permits_create"]);
    Route::get("/export-permit/list", [ExportPermitApiController::class, "export_permits_list"]);
    Route::post("/export-permit/delete", [ExportPermitApiController::class, "export_permit_delete"]);

    // planting returns company
    Route::post("/planting-returns-company/new", [PlantingReturnsCompanyApiController::class, "planting_returns_company_create"]);
    Route::get("/planting-returns-company/list", [PlantingReturnsCompanyApiController::class, "planting_returns_company_list"]);
    Route::post("/planting-returns-company/delete", [PlantingReturnsCompanyApiController::class, "planting_returns_company_delete"]);

    // planting returns grower
    Route::post("/planting-returns-grower/new", [PlantingReturnsGrowerApiController::class, "planting_returns_grower_create"]);
    Route::get("/planting-returns-grower/list", [PlantingReturnsGrowerApiController::class, "planting_returns_grower_list"]);
    Route::post("/planting-returns-grower/delete", [PlantingReturnsGrowerApiController::class, "planting_returns_grower_delete"]);

    // sr10 plant inspection
    Route::get("/form-sr10/list", [FormSr10ApiController::class, "form_sr10_list"]);

    // qds crop declarations
    Route::post("/qds-crop-declarations/new", [QDSCropDeclarationApiController::class, "qds_crop_declarations_create"]);
    Route::get("/qds-crop-declarations/list", [QDSCropDeclarationApiController::class, "qds_crop_declarations_list"]);
    Route::post("/qds-crop-declarations/delete", [QDSCropDeclarationApiController::class, "qds_crop_declarations_delete"]);

    // seed lab analysis
    Route::post("/seed-labs/new", [SeedLabApiController::class, "seed_lab_create"]);
    Route::post("/seed-labs/new", [SeedLabApiController::class, "seed_lab_create"]);
    Route::get("/seed-labs/list", [SeedLabApiController::class, "seed_lab_list"]);
    Route::post("/seed-labs/delete", [SeedLabApiController::class, "seed_lab_delete"]);

    // seed label
    Route::post("/seed-labels/new", [SeedLabelApiController::class, "seed_label_create"]);
    Route::get("/seed-labels/list", [SeedLabelApiController::class, "seed_label_list"]);
    Route::get("/seed-labels-packages/list", [SeedLabelApiController::class, "seed_label_packages"]);
    Route::post("/seed-labels/delete", [SeedLabelApiController::class, "seed_label_delete"]);

    // Route::post("/form-sr10/new", [FormSr10ApiController::class, "form_sr10_create"]);

    // SEED STOCK ------------------------------------------------------------------------------------------------*/
    // stock examination requests
    Route::post("/form-stock-examination-requests/new", [FormStockExaminationRequestApiController::class, "form_stock_examination_requests_create"]);
    Route::get("/form-stock-examination-requests/list", [FormStockExaminationRequestApiController::class, "form_stock_examination_requests_list"]);
    Route::post("/form-stock-examination-requests/delete", [FormStockExaminationRequestApiController::class, "form_stock_examination_requests_delete"]);
    
    // my stock  / stock record
    Route::get("/form-stock-records/list", [FormStockRecordApiController::class, "form_stock_records_list"]);
    Route::post("/form-stock-record/delete", [FormStockRecordApiController::class, "form_stock_record_delete"]);

    // marketable seed
    Route::get("/marktable-seed/list", [MarketableSeedApiController::class, "marktable_seed_list"]);
    Route::post("/marktable-seed/delete", [MarketableSeedApiController::class, "marktable_seed_delete"]);

    // MARKETPLACE ------------------------------------------------------------------------------------------------*/
    // marketplace (all products)
    Route::get("/products/list", [ProductApiController::class, "products_list"]);
    Route::post("/product/delete", [ProductApiController::class, "product_delete"]);

    // orders
    Route::get("/orders/list", [OrderApiController::class, "order_list"]);
    Route::post("/order/delete", [OrderApiController::class, "order_delete"]);
    Route::post("/order/new", [OrderApiController::class, "order_create"]);

    // pre-oders
    Route::get("/pre-orders/list", [PreOrderApiController::class, "pre_order_list"]);
    Route::post("/pre-order/new", [PreOrderApiController::class, "pre_order_create"]);
    Route::post("/pre-order/delete", [PreOrderApiController::class, "pre_order_delete"]);

    // quotations
    Route::get("/quotations/list", [QuotationApiController::class, "quotations_list"]);
    Route::post("/quotation/delete", [QuotationApiController::class, "quotation_delete"]);
    /* -----------------------------------------------------------------------------------------------------------*/



    
    Route::get('/admin/1e24tt00X24/crops', [FormSr6CropQueryController::class, 'import']);



});
