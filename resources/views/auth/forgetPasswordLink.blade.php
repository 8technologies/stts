<?php
use App\Models\Utils; 
Utils::start_session();
//session_start();
//$_SESSION['message'] = 'Romina';
?>
<!DOCTYPE html>
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
      top: 20%;
      right: 8.5%;
      cursor: pointer;

    }

  </style>

</head>
<body class="hold-transition login-page" style="background: url({{ asset('/assets/images/bg/background2.jpg') }}) no-repeat;background-size: cover;">
<div class="login-box">
    

  <!-- /.login-logo -->
  <div class="login-box-body" style="border-radius: 25px">
  <div class="login-logo">
    <a href="{{ admin_url('/') }}"><b>{{config('admin.name')}} Reset Password</b></a>
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

    <form method="POST" action="{{ url('resets/password') }}">
        @csrf

        <input type="hidden" name="token" value="{{ $token }}">

       
        <div class="form-group">
            <label for="password" class="control-label">{{ __('Password') }}</label>

            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" style="border-radius: 5px;" autofocus >
            
                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
        </div>
        <div class="form-group">
            <label for="password-confirm" class="control-label">{{ __('Confirm Password') }}</label>

            <input id="password-confirm" type="password" class="form-control @error('password') is-invalid @enderror" name="password_confirmation" required autocomplete="new-password" style="border-radius: 5px;" autofocus >
      
                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
        </div>

        <div class="row">
        <div class="col-xs-8">
        <div class="form-group text-end">
           <a href="{{ url('admin/auth/login') }}" class="nav-link"> Back to Login</a>
       </div>
        </div>

        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat" style="border-radius: 5px;">  {{ __('Reset') }}</button>
        </div>
        <!-- /.col -->
      </div> 
    </form>
   

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

