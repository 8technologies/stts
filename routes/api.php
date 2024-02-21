<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormSr4Controller;
use App\Http\Controllers\FormSr6Controller;
use App\Http\Controllers\QdsController;
use App\Http\Controllers\CropController;
use App\Http\Controllers\CropDeclarationController;
use App\Http\Controllers\ImportPermitController;
use App\Http\Controllers\ExportPermitController;
use App\Http\Controllers\SubgrowerController;
use App\Http\Controllers\SeedLabController;


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
Route::resource('form-sr4s', FormSr4Controller::class);
Route::get('assigned-sr4s/{id}', [FormSr4Controller::class, 'getAssignedForms']);

Route::resource('form-sr6s', FormSr6Controller::class);
Route::get('assigned-sr6s/{id}', [FormSr6Controller::class, 'getAssignedForms']);

Route::resource('form-qds', QdsController::class);
Route::get('assigned-qds/{id}', [QdsController::class, 'getAssignedForms']);

Route::resource('crops', CropController::class);
Route::get('crop-varieties', [CropController::class, 'getCropVarieties']);

Route::resource('import-export-permits', ImportPermitController::class);
Route::get('assigned-import-permit/{id}', [ImportPermitController::class, 'getAssignedForms']);

Route::resource('import-export-permits-2', ExportPermitController::class);
Route::get('assigned-import-permit-2/{id}', [ExportPermitController::class, 'getAssignedForms']);

Route::resource('sub-growers', SubgrowerController::class);
Route::get('assigned-sub-growers/{id}', [SubgrowerController::class, 'getAssignedForms']);

Route::resource('form-crop-declarations', CropDeclarationController::class);
Route::get('assigned-form-crop-declarations/{id}', [CropDeclarationController::class, 'getAssignedForms']);

Route::resource('seed-labs', SeedLabController::class);
Route::get('assigned-seed-labs/{id}', [SeedLabController::class, 'getAssignedForms']);
