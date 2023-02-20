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

use App\Models\Utils;


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
        }

        $pro = Product::where('slug', $seg)->first();
        if ($pro) {
            return view('main.display-ad');
        }

        // return ('page not found');
         return view('errors.404');
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
        if (isset($_POST['email'])) {

            $u['email'] = $_POST['email'];
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


    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => 'required|string|max:24|min:2',
            'last_name' => 'required|string|max:24|min:2',
            'email' => 'required|string|email|max:255|unique:admin_users',
            'password' => 'required|confirmed|max:100|min:3',
        ]);
    }


    /**
     * Create a new user instance after a valid registration.
     *
     * 
     */
    protected function registers(array $data, Request $request)
    {
        $user = Administrator::create([
            'first_name' => $data['first_name'],
            'name' => $data['name'],
            'last_name' => $data['last_name'],
            'email' => $data['email'],
            'username' => $data['username'],
            'password' => Hash::make($data['password']),
        ]);

        if ($user->save()) {
            DB::table('admin_role_users')->insert([
                'role_id' => 3,
                'user_id' => $user->id
            ]);
        }

        $u['email'] = $data['email'];
        $u['password'] = $data['password'];

        if (Admin::guard()->attempt($u)) {
            admin_toastr(trans('admin.login_successful'));
            $data[session()]->regenerate();
            return redirect()->intended('admin');
        }

        return back()->with(["status" => "success", "message" => "User Created!"]);
    }


    public function register(Request  $request)
    {
        $this->validate($request, [
            'first_name' => 'required|max:24|min:2',
            'last_name' => 'required|max:24|min:2',
            'email' => 'required|email|unique::admin_users',
            'password' => 'required|confirmed|max:100|min:3',
        ]);

        $user = Administrator::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'name' => $request->first_name . " " . $request->last_name,
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

        if (Admin::guard()->attempt($u)) {
            admin_toastr(trans('admin.login_successful'));
            $request->session()->regenerate();
            return redirect()->intended('admin');
        }

        // return redirect()->back()->withErrors(['error', 'has-error']);

        return back()->with(["status" => "success", "message" => "User Created!"]);
        // Accessible on the frontend via `session()->get("message", "");`
    }

    
    public function register111(Request  $request)
    {
        if (Auth::guard()->check()) {
            return redirect("/admin");
        }
        Utils::start_session();

        if (isset($_POST['password']) && isset($_POST['password_confirmation']) && isset($_POST['email'])) 
        {
            if ($request->input('password') !=  $request->input('password_confirmation')) {
                $errors['password_confirmation'] = "Passwords don't match";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
            }

            if (strlen($request->input('password')) < 6) {
                $errors['password_confirmation'] = "Password too short.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
            }

            $u['name'] = $request->first_name . " " . $request->last_name;
            $u['email'] = $request->email;
            $u['username'] = $request->email;

            $old_user = Administrator::where('email', $u['email'])->first();
            if ($old_user) {
                $errors['email'] = "User with same email already exists.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                die();
            }

            
            if ($u->save()) {
                DB::table('admin_role_users')->insert([
                    'role_id' => 3,
                    'user_id' => $u->id
                ]);
            }


            $u['password'] = Hash::make($request->input("password"));
            $users = Administrator::create($u);
            // $pro = new Administrator();
            // $pro->status = 0;
            // $pro->user_id = $users->id;
            $users->save();


            $credentials['email'] = $u['email'];
            $credentials['password'] = $request->input("password");


            if (Auth::attempt($credentials, true)) {
                $request->session()->regenerate();
                $_SESSION['credentials'] = $credentials;
                return redirect()->intended(admin_url('/auth/login'));
            } else {
                return redirect()->intended('login');
            }
        }
        return view('main.register');
    }
}
