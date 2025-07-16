{{-- <?php
use App\Models\Utils; 
Utils::start_session();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration form</title>
  <link href="form.css" rel="stylesheet">
</head>
<style>
    *{
    margin: 0;
    padding: 0;
}
.fl{
    float: left;
}
.warpper{
    width: 100%;
    height: 100vh;
    background-image: url('/assets/images/bg/background2.jpg');
   
    background-repeat: no-repeat;
    background-size: cover;
}
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 30%;
  min-height: 550px;
  background-color: #ffffff;
  margin: 50px auto;
  padding-bottom: 50px;
  border-radius: 20px 20px 30px 30px;
}

.head{
    width: 100%;
    background-color: #008140;
    height: 50px;
    border-radius: 20px 20px 0 0;
}
.head p{
    line-height: 40px;
    text-align: center;
    font-size: 25px;
    font-weight: bold;
    color: #fff;
}
.form{
    width: 100%;
    height: 500px;
}
.name{
    font-size: 16px;
    color: #fff;
    margin: 15px 0 0 5%;
}
.name-inp{
    width: 90%;
    height: 30px;
    margin: 5px 0 0 5%;
    font-size: 16px;
    padding: 2px;
    color: rgb(114, 111, 111);
    border: 1px solid rgb(211, 211, 211);
    border-radius: 5px;
    background-color: rgb(231, 232, 250);
}
.name-inp:hover{
    background-color: rgb(211, 212, 230);
    color: rgb(173, 167, 167);
    border: 1px solid rgb(139, 139, 139);
}
.pass{
    margin: 5px 0 0 5%;
    height: 30px;
    width: 41%;
    padding: 2px;
    background-color: rgb(231, 232, 250);
    border: 1px solid rgb(17, 67, 107);
}
.pass:hover{
    background-color: rgb(0, 23, 41);
    color: #008140;
    border: 1px solid rgb(139, 139, 139);
}
.gender{
    margin: 15px 0 0 5%;
    color: #fff;
    font-size: 16px;
}
.gen{
    font-size: 18px;
}
.genm{
    margin-left: 5%;
}
.sub{
    width: 90%;
    margin: 15px 0 0 5%;
    font-size: 16px;
    height: 40px;
    background-color: #008140;
    border: 1px solid rgb(17, 67, 107);
    color: #fff;
}
.sub:hover{
    background-color: #00462b;
    color: #fff;
}
.error-message {
  width: 90%;
  /* center the div */
  margin: 0 auto;
    height: 30px;
    font-size: 16px;
    padding: 2px;
    border: 1px solid rgb(211, 211, 211);
    border-radius: 5px;
    background-color: #f00;
    }
</style>

<body>

  <div class="warpper fl">
    <div class="main">
      <div class="head">
        <p>
          Registration Form</p>
      </div>
        <!-- /.card-header -->
        @isset($_SESSION['message'])
        <div class="alert alert-{{ $_SESSION['type'] }}">{{ $_SESSION['message'] }}</div>
        @if($_SESSION['errors'] != null)
        <div class="error-message">
            <div class="alert alert-{{ $_SESSION['type'] }}">{{ $_SESSION['errors'] }}</div>
        </div>
        @endif
        @php
        unset($_SESSION['message']);
        unset($_SESSION['type']);
        @endphp
        @endisset
  
      <div class="form fl">
        <form action="{{ route ('user.registration') }}" enctype="multipart/form-data" method="post">
          @csrf
          <p class="name">
            First name :</p>
          <p>
            <input type="text" name="fname" placeholder="First Name" class="name-inp" required>
          </p>
          <p class="name">
            Last name :</p>
          <p>
            <input type="text" name="lname" placeholder="Last Name" class="name-inp" required>
          </P>
          <p class="name">
            Username :</p>
          <p>
            <input type="text" name="username" placeholder="Username" class="name-inp" required>
          </P>
          <p class="name">
            Email :</p>
          <p>
            <input type="email" name="email" placeholder="Email" class="name-inp" required>
          </p>
          
          <p class="name">
            Password :</p>
          <p>
            <input type="password" name="password" placeholder="Password" class="name-inp" required>
            </p>
            <p class="name">
              Confirm Password :</p>
            <input type="password" name="password_confirmation" placeholder="Confirm Password" class="name-inp">
          </p>
        
          <p>
            <input type="submit" name="sb" value="SUBMIT" class="sub">
          </p>
          <!-- back to login -->
          <p class="name">
             <a href="{{ url('admin/auth/login') }}">Already have an account? Login</a></p>
        </form>
      </div>
    </div>
  </div>
</body>

</html> --}}


<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{config('admin.title')}} | {{ trans('admin.login') }}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
  
  @if(!is_null($favicon = Admin::favicon()))
  <link rel="shortcut icon" href="{{$favicon}}">
  @endif

  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/AdminLTE/bootstrap/css/bootstrap.min.css') }}">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/font-awesome/css/font-awesome.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/AdminLTE/dist/css/AdminLTE.min.css') }}">
  <!-- iCheck -->
  <link rel="stylesheet" href="{{ admin_asset('vendor/laravel-admin/AdminLTE/plugins/iCheck/square/blue.css') }}">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif] -->

  <style>
    input[type="text"]{
      border-radius: 5px;
      color: #008140;
    }
    
    input[type="password"]{
      border-radius: 5px;
      color: #008140;
    }
    .field-icon {
      position: absolute;
      top: 29%;
      right: 2%;
      cursor: pointer;

    }

  </style>

</head>
  <body class="hold-transition login-page" style="background: url({{ asset('/assets/images/bg/background2.jpg') }}) no-repeat;background-size: cover;">
    <div class="login-box">

      <!-- /.login-logo -->
      <div class="login-box-body" style="border-radius: 25px">
      <div class="login-logo">
        <img src="{{ asset('/assets/images/maaif.png') }}" style="width: 50%" alt="MAAIF">
        <br>
        <a href="{{ admin_url('/') }}"><b>{{config('admin.name')}} Login</b></a>
      <hr>
      </div>

      @isset($_SESSION['message'])
      <div class="alert alert-{{ $_SESSION['type'] }}">{{ $_SESSION['message'] }}</div> 
      @php
      unset($_SESSION['message']);
      unset($_SESSION['type']);
      @endphp     
      @endisset


        <!-- <p class="login-box-msg">{{ trans('admin.login') }}</p> -->

        <form action="{{ route ('user.registration') }}" enctype="multipart/form-data" method="post">
          @csrf
          <div class="form-group has-feedback {!! !$errors->has('fname') ?: 'has-error' !!}">

            {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}

            @if($errors->has('fname'))
              @foreach($errors->get('fname') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif

            <input type="text" class="form-control" placeholder="First Name" name="fname" value="{{ old('fname') }}" required>
            {{-- <span class="glyphicon glyphicon-envelope form-control-feedback"></span> --}}
          </div>
          <div class="form-group has-feedback {!! !$errors->has('lname') ?: 'has-error' !!}">

            {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}

            @if($errors->has('lname'))
              @foreach($errors->get('lname') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif

            <input type="text" class="form-control" placeholder="Last Name" name="lname" value="{{ old('lname') }}" required>
            {{-- <span class="glyphicon glyphicon-envelope form-control-feedback"></span> --}}
          </div>
          <div class="form-group has-feedback {!! !$errors->has('username') ?: 'has-error' !!}">

            {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}

            @if($errors->has('username'))
              @foreach($errors->get('username') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif

            <input type="text" class="form-control" name="username" placeholder="Username" value="{{ old('username') }}" required>
            {{-- <span class="glyphicon glyphicon-envelope form-control-feedback"></span> --}}
          </div>
          <div class="form-group has-feedback {!! !$errors->has('email') ?: 'has-error' !!}">

            {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}

            @if($errors->has('email'))
              @foreach($errors->get('email') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif

            <input class="form-control" type="email" name="email" placeholder="Email" value="{{ old('email') }}" required>
            {{-- <span class="glyphicon glyphicon-envelope form-control-feedback"></span> --}}
          </div>
          <div class="form-group has-feedback {!! !$errors->has('email') ?: 'has-error' !!}">

            {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}

            @if($errors->has('district'))
              @foreach($errors->get('district') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif

            <input class="form-control" type="district" name="district" placeholder="District" value="{{ old('district') }}" required>
            {{-- <span class="glyphicon glyphicon-envelope form-control-feedback"></span> --}}
          </div>
          
          <div class="form-group has-feedback {!! !$errors->has('password') ?: 'has-error' !!}">

            @if($errors->has('password'))
              @foreach($errors->get('password') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif
            <!-- 
            <input type="password" class="form-control" placeholder="{{ trans('admin.password') }}" name="password" required>
            <span class="glyphicon glyphicon-lock "></span> -->
            <!-- <span toggle="#password-field" class="fa fa-fw fa-eye form-control-feedback toggle-password"></span> -->
        
            <input id="password-field" type="password" class="form-control"  placeholder="{{ trans('admin.password') }}" name="password" required>
            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" ></span>
            
          </div>
          <div class="form-group has-feedback {!! !$errors->has('password_confirmation') ?: 'has-error' !!}">

            {{-- <input type="hidden" name="_token" value="{{ csrf_token() }}"> --}}

            @if($errors->has('password_confirmation'))
              @foreach($errors->get('password_confirmation') as $message)
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
              @endforeach
            @endif

            <input type="password" id="password-confirm-field" class="form-control" name="password_confirmation" placeholder="Confirm Password"  required>
            <span toggle="#password-confirm-field" class="fa fa-fw fa-eye field-icon toggle-password" ></span>
          </div>
          <div class="row">
            {{-- <div class="col-xs-8">
              @if(config('admin.auth.remember'))
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox" name="remember" value="1" {{ (!old('username') || old('remember')) ? 'checked' : '' }}>
                  {{ trans('admin.remember_me') }}
                </label>
              </div>
              @endif
            </div> --}}

            <!-- /.col -->
            <div class="col-xs-12">
              <button type="submit" class="btn btn-primary btn-block btn-flat" value="submit" style="border-radius: 5px;">{{ trans('admin.submit') }}</button>
            </div>
            <!-- /.col -->
          </div> 
          
        </form>
        <div>
          <a href="{{ url('admin/auth/login') }}">Already have an account? Login</a>
        </div>

      </div>
      <!-- /.login-box-body -->
    </div>
  <!-- /.login-box -->

  <!-- jQuery 2.1.4 -->
  <script src="{{ admin_asset('vendor/laravel-admin/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js')}}"></script>
  <!-- Bootstrap 3.3.5 -->
  <script src="{{ admin_asset('vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js')}}"></script>
  <!-- iCheck -->
  <script src="{{ admin_asset('vendor/laravel-admin/AdminLTE/plugins/iCheck/icheck.min.js')}}"></script>

  <script>
    $(".toggle-password").click(function() {

  $(this).toggleClass("fa-eye fa-eye-slash");
  var input = $($(this).attr("toggle"));
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
  }); 
      
    $(function () {
      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
      });
    });
  </script>
  </body>
</html>