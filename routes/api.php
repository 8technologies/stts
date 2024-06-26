<?php

use App\Admin\Controllers\MarketableSeedController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\TrackAndTraceController;
use App\Http\Controllers\ApiAuthController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormSr4Controller;
use App\Http\Controllers\FormSr6Controller;
use App\Http\Controllers\QdsController;
use App\Http\Controllers\CropController;
use App\Http\Controllers\CropDeclarationController;
use App\Http\Controllers\ImportPermitController;
use App\Http\Controllers\ExportPermitController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\SubgrowerController;
use App\Http\Controllers\SeedLabController;
use App\Http\Controllers\SeedLabelController;
use App\Http\Controllers\StockExaminationController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\PreOrderController;
use App\Http\Controllers\QDSPlantInspectionController;
use App\Http\Controllers\QuotationController;
use App\Http\Controllers\RegistrationController;
use App\Http\Controllers\SR10Controller;
use App\Http\Middleware\JwtMiddleware;
use Illuminate\Http\Request;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
//Route::middleware([JwtMiddleware::class])->group(function () {
//  Route::middleware('auth:api')->group(function () {
    
        Route::resource('form-sr4s', FormSr4Controller::class);
        Route::get('assigned-sr4s/{id}', [FormSr4Controller::class, 'getAssignedForms']);

        Route::resource('form-sr6s', FormSr6Controller::class);
        Route::get('assigned-sr6s/{id}', [FormSr6Controller::class, 'getAssignedForms']);

        Route::resource('form-qds', QdsController::class);
        Route::get('assigned-qds/{id}', [QdsController::class, 'getAssignedForms']);

        Route::resource('crops', CropController::class);
        Route::get('crop-varieties', [CropController::class, 'getCropVarieties']);
        Route::get('seed-label-packages', [CropController::class, 'getSeedLabelPackages']);

        Route::resource('import-export-permits', ImportPermitController::class);
        Route::get('assigned-import-permit/{id}', [ImportPermitController::class, 'getAssignedForms']);

        Route::resource('import-export-permits-2', ExportPermitController::class);
        Route::get('assigned-import-permit-2/{id}', [ExportPermitController::class, 'getAssignedForms']);

        Route::resource('sub-growers', SubgrowerController::class);
        Route::get('assigned-sub-growers/{id}', [SubgrowerController::class, 'getAssignedForms']);

        Route::resource('form-crop-declarations', CropDeclarationController::class);
        Route::get('assigned-form-crop-declarations/{id}', [CropDeclarationController::class, 'getAssignedForms']);

        Route::resource('seed-labs', SeedLabController::class);

  
        //     Route::resource('seed-labs', SeedLabController::class);
        // });
        Route::get('assigned-seed-labs/{id}', [SeedLabController::class, 'getAssignedForms']);
        Route::get('forms-sent-to-lab', [SeedLabController::class, 'getFormsSentToLab']);
        Route::put('lab-results/{id}', [SeedLabController::class, 'updateLabResults']);



        Route::resource('seed-labels', SeedLabelController::class);
        Route::get('get-lab-test-number/{id}', [SeedLabelController::class, 'getLabTestNumber']);
        Route::get('get-seed-label-packages', [SeedLabelController::class, 'getSeedLabelPackages']);


        Route::get('assigned-seed-labels/{id}', [SeedLabelController::class, 'getAssignedForms']);

        Route::resource('form-stock-examination-requests', StockExaminationController::class);
        Route::get('assigned-form-stock-examination-requests/{id}', [StockExaminationController::class, 'getAssignedForms']);
        Route::get('get-accepted-import-permits/{id}', [StockExaminationController::class, 'getAcceptedImportPermits']);
        Route::get('get-accepted-planting-returns/{id}', [StockExaminationController::class, 'getAcceptedPlantingReturns']);
        Route::get('get-accepted-qds-declarations/{id}', [StockExaminationController::class, 'getAcceptedQdsDeclarations']);
        Route::get('get-crop-varieties/{id}', [StockExaminationController::class, 'getCropVarieties']);

        Route::resource('stock-records', StockController::class);

        Route::resource('marketable-seeds', MarketableSeedController::class);

        Route::resource('products', ProductController::class);

        Route::resource('orders', OrderController::class);
        Route::get('assigned-orders/{id}', [OrderController::class, 'showOrdersToMe']);

        Route::resource('pre-orders', PreOrderController::class);

        Route::resource('quotations', QuotationController::class);

        Route::post('track', [TrackAndTraceController::class, 'track']);
        Route::get('track_details', [TrackAndTraceController::class, 'track']);

        Route::post('trace', [TrackAndTraceController::class, 'trace']);
        Route::get('trace', [TrackAndTraceController::class, 'trace']);

        Route::resource('form-sr10s', SR10Controller::class);
        Route::get('assigned-sr10s/{id}', [SR10Controller::class, 'getAssignedForms']);

        Route::resource('qds-crop-inspection-2', QDSPlantInspectionController::class);
        Route::get('assigned-qds-inspection/{id}', [QDSPlantInspectionController::class, 'getAssignedForms']);



// });

Route::get('test', [RegistrationController::class, 'index']);
Route::post('register', [RegistrationController::class, 'register']);
Route::get('profile', [RegistrationController::class, 'profile']);
Route::post('login', [RegistrationController::class, 'login']);

