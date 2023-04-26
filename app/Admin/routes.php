<?php

use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;


Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    // $router->get('/', 'HomeControllerJEd@index')->name('home');
    $router->get('/', 'HomeController@myChart')->name('home');
    // $router->get('/', '\App\Admin\Controllers\Dashboard\HomeDashboardBarChartController@index_bar')->name('home');
    // $router->get('/', 'HomeController@tab')->name('home');
    $router->resource('users', UserController::class);
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
    $router->resource('planting-returns', PlantingReturnController::class);
    $router->resource('form-sr10s', FormSr10Controller::class);
    $router->resource('form-qds-inspection', FormQDSInspectionController::class);
    $router->resource('form-crop-declarations', FormCropDeclarationController::class);
    $router->resource('qds-crop-inspection-2', FormCropInspectionController::class);
    $router->resource('form-stock-examination-requests', FormStockExaminationRequestController::class);
    $router->resource('stock-records', FormStockRecordController::class);
    $router->resource('seed-labs', SeedLabController::class);
    $router->resource('seed-label-packages', SeedLabelPackageController::class);
    $router->resource('seed-labels', SeedLabelController::class);
    $router->resource('marketable-seeds', MarketableSeedController::class);
    $router->resource('products', ProductController::class);
    $router->resource('orders', OrderController::class);
    $router->resource('pre-orders', PreOrderController::class);
    $router->resource('quotations', QuotationController::class);
    $router->resource('track-and-trace', TrackAndTraceController::class);
    $router->resource('sub-growers', SubGrowerController::class);
    

    $router->resource('test-trees', TestTreeController::class);
        
    $router->resource('test1s', Test1Controller::class);

    Route::get('{any}', function() {
        return view('errors.404');
    })->where('any', '.*');

    Route::get('{any}', function() {
        return view('errors.405');
    })->where('any', '.*');

    Route::get('{any}', function() {
        return view('errors.500');
    })->where('any', '.*');
    
    
});
