<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormSr4Controller;
use App\Http\Controllers\FormSr6Controller;
use App\Http\Controllers\QdsController;


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
