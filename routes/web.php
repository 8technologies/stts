<?php

use App\Http\Controllers\Dashboard;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Middleware\Authenticate;

Route::get('/', [MainController::class, 'index']);
Route::get('/about', [MainController::class, 'about']);
Route::get('/register', [MainController::class, 'register'])->name("register");
Route::match(['get', 'post'], '/login', [MainController::class, 'login'])->name("login");
Route::post('/register', [MainController::class, 'register'])->name("register");
Route::get('/dashboard', [Dashboard::class, 'index'])->name("dashboard")->middleware(Authenticate::class);
Route::get('/complete-profile-request', [Dashboard::class, 'complete_profile_request'])->name("complete_profile_request")->middleware(Authenticate::class);
Route::get('/membership', [Dashboard::class, 'membership'])->name("membership")->middleware(Authenticate::class);
Route::get('/favourites', [Dashboard::class, 'favourites'])->name("favourites");
Route::match(['get', 'post'], '/post-ad', [Dashboard::class, 'postAdCategpryPick'])->name("post-ad")->middleware(Authenticate::class);
Route::get('/post-ad/{id}', [Dashboard::class, 'postAd'])->middleware(Authenticate::class);
Route::match(['get', 'post'], '/profile-edit/{id}', [Dashboard::class, 'profileEdit'])->name("profile-edit");
Route::get('/profile', [Dashboard::class, 'profile'])->middleware(Authenticate::class);
Route::get('/logout', [Dashboard::class, 'logout'])->middleware(Authenticate::class);
Route::match(['get', 'post'],'/messages/', [Dashboard::class, 'messages'])->name("messages")->middleware(Authenticate::class);
Route::match(['get', 'post'],'/messages/{thread}', [Dashboard::class, 'messages'])->name("messages")->middleware(Authenticate::class);
Route::match(['get', 'post'],'/{id}', [MainController::class, 'slugSwitcher']);

/*Route::get('/', function () {
    return view('welcome');
});*/
