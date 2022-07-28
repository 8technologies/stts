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
  <link rel="stylesheet" href="{{ admin_asset("vendor/laravel-admin/AdminLTE/bootstrap/css/bootstrap.min.css") }}">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ admin_asset("vendor/laravel-admin/font-awesome/css/font-awesome.min.css") }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ admin_asset("vendor/laravel-admin/AdminLTE/dist/css/AdminLTE.min.css") }}">
  <!-- iCheck -->
  <link rel="stylesheet" href="{{ admin_asset("vendor/laravel-admin/AdminLTE/plugins/iCheck/square/blue.css") }}">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page" @if(config('admin.login_background_image'))style="background: url({{config('admin.login_background_image')}}) no-repeat;background-size: cover;"@endif>
<div class="login-box">

  <!-- /.login-logo -->
  <div class="login-box-body">
      <div class="login-logo h6 pt-4">
    <a href="{{ admin_url('/') }}"><b>{{config('admin.name')}}</b></a>
  </div>


    @if (config('admin.login_background_image_2'))
        <img width="100%"  class="mb-3" src="{{config('admin.login_background_image_2')}}" alt="">
    @endif
    
    <p class="login-box-msg text-dark">Creating New Account</p>

    <form action="{{ url('register') }}" method="POST">

    
    
    <div class="form-group has-feedback {!! !$errors->has('username') ?: 'has-error' !!}">
        @if($errors->has('username'))
          @foreach($errors->get('username') as $message)
            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
          @endforeach
        @endif

        <input type="text" class="form-control" placeholder="Username"  required name="username" value="{{ old('username') }}">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group has-feedback {!! !$errors->has('first_name') ?: 'has-error' !!}">
                @if($errors->has('first_name'))
                  @foreach($errors->get('first_name') as $message)
                    <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
                  @endforeach
                @endif
                <input type="text" class="form-control" required placeholder="{{ trans('admin.first_name') }}" name="first_name" value="{{ old('first_name') }}">
              </div>
        </div>
        <div class="col-md-6">
            <div class="form-group has-feedback {!! !$errors->has('last_name') ?: 'has-error' !!}">
                @if($errors->has('last_name'))
                  @foreach($errors->get('last_name') as $message)
                    <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
                  @endforeach
                @endif
                <input type="text" required class="form-control" placeholder="{{ trans('admin.last_name') }}" name="last_name" value="{{ old('last_name') }}">
              </div>
        </div>
    </div>
    
      <div class="form-group has-feedback {!! !$errors->has('email') ?: 'has-error' !!}">
        @if($errors->has('email'))
          @foreach($errors->get('email') as $message)
            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
          @endforeach
        @endif

        <input type="email" class="form-control" placeholder="Email address"  required name="email" value="{{ old('email') }}">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback {!! !$errors->has('password') ?: 'has-error' !!}">

        @if($errors->has('password'))
          @foreach($errors->get('password') as $message)
            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
          @endforeach
        @endif
        <input type="password" required class="form-control" placeholder="{{ trans('admin.password') }}" name="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback {!! !$errors->has('password_confirmation') ?: 'has-error' !!}">

        @if($errors->has('password_confirmation'))
          @foreach($errors->get('password_confirmation') as $message)
            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>{{$message}}</label><br>
          @endforeach
        @endif
        <input type="password" required class="form-control" placeholder="Re-enter password" name="password_confirmation">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="row  mb-2">
        <div class="col-xs-8">
          @if(config('admin.auth.remember'))
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" required name="remember" value="1" {{ (!old('username') || old('remember')) ? 'checked' : '' }}>
              Agree to <a href="#">Terms of use</a>
            </label>
          </div>
          @endif
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
        </div>
        <!-- /.col -->
      </div>
      <p class="border mt-3 pt-3" style="border-top: 1px gray solid">Already have an account?  <a href="{{url("admin")}}">Login</a></p>
    </form>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.1.4 -->
<script src="{{ admin_asset("vendor/laravel-admin/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js")}} "></script>
<!-- Bootstrap 3.3.5 -->
<script src="{{ admin_asset("vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js")}}"></script>
<!-- iCheck -->
<script src="{{ admin_asset("vendor/laravel-admin/AdminLTE/plugins/iCheck/icheck.min.js")}}"></script>
<script>
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