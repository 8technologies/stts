<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Profile;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller {
    
    protected function create(Request $request){
        $this->validate($request, [
            'first_name' => 'required|max:24|min:2',
            'last_name' => 'required|max:24|min:2',
            'email' => 'required|unique::admin_users',
            'password' => 'required|confirmed|max:100|min:3',
        ]);

        $user = Administrator::create([
            'first_name' => $request->first_name,
            'name' => $request->first_name . " " . $request->last_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'username' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        if ($user->save()) {
            DB::table('admin_role_users')->insert([
                'role_id' => 3,
                'user_id' => $user->id
            ]);
        }
        
        $u['email'] = $request->email;
        $u['password'] = $request->password;

        $remember = $request->get('remember', true);

        // event(new Registered($u));

        if (Admin::guard()->attempt($u, $remember)) {
            admin_toastr(trans('admin.login_successful'));
            $request->session()->regenerate();
            return redirect('admin');
        }

        return view('main.register');

        // return back()->with(["status" => "success", "message" => "User Created!"]);
        // Accessible on the frontend via `session()->get("message", "");`
    }
}
