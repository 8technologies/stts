<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductReview;
use App\Models\Profile;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\SubGrower;
use Excel;


class MainController extends Controller
{
    public function import()
    {

 
        $array = Excel::toArray([], $file);
        if (isset($array[0]))
            $i = 0;
        foreach ($array[0] as $key => $value) {
            $i++;
            if ($i <= 1) {
                continue;
            }
            if (count($value) > 11) {
                $sub = new SubGrower();

                if (isset($value[0]))
                    if ($value[0] != null) {
                        if (strlen($value[0]) > 2) {
                            $sub->name = $value[0];
                        }
                    }

                if (isset($value[1]))
                    if ($value[1] != null) {
                        if (strlen($value[1]) > 0) {
                            $sub->size = $value[1];
                        }
                    }

                if (isset($value[2]))
                    if ($value[2] != null) {
                        if (strlen($value[2]) > 2) {
                            $sub->crop = $value[2];
                        }
                    }

                if (isset($value[3]))
                    if ($value[3] != null) {
                        if (strlen($value[3]) > 2) {
                            $sub->variety = $value[3];
                        }
                    }

                if (isset($value[4]))
                    if ($value[4] != null) {
                        if (strlen($value[4]) > 2) {
                            $sub->district = $value[4];
                        }
                    }

                if (isset($value[5]))
                    if ($value[5] != null) {
                        if (strlen($value[5]) > 2) {
                            $sub->subcourty = $value[5];
                        }
                    }

                if (isset($value[6]))
                    if ($value[6] != null) {
                        if (strlen($value[6]) > 2) {
                            $sub->planting_date = $value[6];
                        }
                    }

                if (isset($value[7]))
                    if ($value[7] != null) {
                        if (strlen($value[7]) > 2) {
                            $sub->quantity_planted = $value[7];
                        }
                    }

                if (isset($value[8]))
                    if ($value[8] != null) {
                        if (strlen($value[8]) > 0) {
                            $sub->expected_yield = $value[8];
                        }
                    }

                if (isset($value[9]))
                    if ($value[9] != null) {
                        if (strlen($value[9]) > 0) {
                            $sub->expected_yield = $value[9];
                        }
                    }

                if (isset($value[10]))
                    if ($value[10] != null) {
                        if (strlen($value[10]) > 5) {
                            $sub->phone_number = $value[10];
                        }
                    }

                if (isset($value[11])) {
                    if ($value[11] != null) {
                        if (strlen($value[11]) > 2) {
                            $sub->gps_latitude = $value[11];
                        }
                    }
                }

                if (isset($value[12])) {
                    if ($value[12] != null) {
                        if (strlen($value[12]) > 2) {
                            $sub->gps_longitude = $value[12];
                        }
                    }
                }
                $sub->save();
            }
        }
    }

    public function index()
    {
        return redirect()->intended('login');
    }

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

    public function login(Request  $request)
    {
        if (isset($_POST['phone_number'])) {

            $u['email'] = $_POST['phone_number'];
            $u['password'] = $_POST['password'];

            // /dd(password_hash("269435158522",PASSWORD_DEFAULT));

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
        return view('main.login');
    }

    public function register(Request  $request)
    {
        // if (isset($_POST['username'])) {

            $request->validate([
                'first_name' => 'required|max:24|min:2',
                'first_name' => 'required|max:24|min:2',
                'last_name' => 'required|max:24|min:2',
                'password' => 'required|max:100|min:3',
                'password_confirmation' => 'required|max:100|min:3',
            ]);

            if (
                $request->input("password") !=
                $request->input("password_confirmation")
            ) {
                $errors['password_confirmation'] = "Passwords did not match.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                die();
            }

            $old_user = Administrator::where('username',  $request->input("username"))->first();
            if ($old_user) {
                $errors['username'] = "User with same email already exist.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                die();
            }

            $admin = new Administrator();
            $admin->first_name = $request->input("first_name");
            $admin->name = $request->input("first_name") . " " . $request->input("last_name");
            $admin->last_name = $request->input("last_name");
            $admin->username = $request->input("username");
            $admin->email = $request->input("email");
            $admin->password = Hash::make($request->input("password"));

            if ($admin->save()) {
                DB::table('admin_role_users')->insert([
                    'role_id' => 3,
                    'user_id' => $admin->id
                ]);
            } else {
                $errors['username'] = "Failed to created your account. Please try again.";
                return redirect('register')
                    ->withErrors($errors)
                    ->withInput();
                // die();
            }

            $u['email'] = $request->input("email");
            $u['password'] = $request->input("password");
            //$u['password'] = Hash::make($request->input("password"));
            $remember = $request->get('remember', true);

            if (Admin::guard()->attempt($u, $remember)) {
                admin_toastr(trans('admin.login_successful'));
                $request->session()->regenerate();
                return redirect()->intended('admin');
                die();
            }

            return back()->withErrors([
                'username' => 'The provided credentials do not match our records.',
            ]);
        // }
        return view('main.register');
    }

    public function about()
    {
        dd("about us!");
    }
}
