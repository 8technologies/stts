<?php

namespace App\Http\Controllers;

use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Profile;
use Illuminate\Support\Facades\Validator;


class MainController extends Controller
{
    public function slugSwitcher(Request  $request)
    {
        //echo "<pre>"; 
        //dd($request);
        //die();
        if (
            isset($_POST['reason']) &&
            isset($_POST['product_id']) &&
            isset(
                $_POST['comment']
            )
        ) {
            $review = new ProductReview();
            $review->rating = $_POST['rating'];
            $review->reason = $_POST['reason'];
            $review->comment = $_POST['comment'];
            $review->product_id = $_POST['product_id'];
            $review->user_id =  Auth::id();

            $url = $_SERVER['REQUEST_URI'];

            if ($review->save()) {
                $errors['success'] = "Review was submitted successfully!";
                return redirect($url)
                    ->withErrors($errors)
                    ->withInput();
            } else {
                $errors['password'] = "Failed to submit review, please try again.";
                return redirect($url)
                    ->withErrors($errors)
                    ->withInput();
            }
        }

        $seg = request()->segment(1);
        $profile = Profile::where('username', $seg)->first();
        if ($profile) {
            return view('main.display-profile');
            return;
        }

        $pro = Product::where('slug', $seg)->first();
        if ($pro) {
            return view('main.display-ad');
            return;
        }
        return view('main.index');
    }


    public function index()
    {
        return redirect()->intended('login');
    }


    public function register_get()
    {        
        return view('main.register');
    }


    public function login(Request  $request)
    {
        if (isset($_POST['phone_number'])) {

            $u['email'] = $_POST['phone_number'];
            $u['password'] = $_POST['password'];

            if (Auth::attempt($u)) {
                $errors['success'] = "Account created successfully!";
                return redirect('dashboard')
                    ->withErrors($errors)
                    ->withInput();
            } else {
                $errors['password'] = "Wrong password";
                return redirect('login')
                    ->withErrors($errors)
                    ->withInput();
            }
        }
        return redirect()->intended('admin');
        // return view('main.login');
    }

    //   /**
    //  * Get a validator for an incoming registration request.
    //  *
    //  * @param  array  $data
    //  * @return \Illuminate\Contracts\Validation\Validator
    //  */
    // protected function validator(array $data)
    // {
    //     return Validator::make($data, [
    //         'first_name' => 'required|max:24|min:2',
    //         'last_name' => 'required|max:24|min:2',
    //         'email' => 'required|unique::admin_users',
    //         'password' => 'required|confirmed|max:100|min:3',
    //     ]);
    // }


    public function register(Request  $request)
    {
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
            return redirect()->intended('admin');
        }

        return view('main.register');

        // return back()->with(["status" => "success", "message" => "User Created!"]);
        // Accessible on the frontend via `session()->get("message", "");`
    }
}
