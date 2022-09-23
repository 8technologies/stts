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
  <![endif]-->


  <style>
    input[type="text"]{
      border-radius: 5px;
      color: #008140;
    }
    
    input[type="email"]{
      border-radius: 5px;
      color: #008140;
    }

    input[type="password"]{
      border-radius: 5px;
      color: #008140;
    }

    input[type="checkbox"]{
      border-radius: 5px;
      color: #008140;
    }

  </style>


</head>
<body class="hold-transition login-page" style="background: url({{ asset('/assets/images/bg/background2.jpg') }}) no-repeat; background-size: cover">
<div class="login-box">

  <!-- /.login-logo -->
  <div class="login-box-body" style="border-radius: 25px">
      <div class="login-logo">
    <a href="{{ admin_url('/') }}"><b>{{config('admin.name')}} Web Create New Account</b></a>
  <hr>
  </div>


        <!-- <img width="100%"  class="mb-3" src="{{ asset('/assets/images/bg/background2.jpg') }}" alt=""> -->

        
    <!-- <p class="login-box-msg text-dark">Creating New Account</p> -->

    <div>
      @if ($errors->any())
      <div class="bg-red-500 text-white font-bold rounded-t px-4 py-2" >
        Something went wrong...
      </div>
      <ul class="boarder boarder-t-0 boarder-red-400 rounded-b bg-red-100 px-4 py-3 text-red-700">
        @foreach(errors->all() as $error)
          <li>{{ $error }}</li>
        @endforeach
      </ul>
      @endif
    </div>

    <form action="{{ url('register') }}" method="POST">


    <div class="row">
        <div class="col-md-6">
            <div class="form-group has-feedback {!! !$errors->has('first_name') ?: 'has-error' !!}">
                <input type="text" class="form-control"  placeholder="{{ trans('admin.first_name') }}" name="first_name" value="{{ old('first_name') }}"></div>
          </div>

        <div class="col-md-6">
            <div class="form-group has-feedback {!! !$errors->has('last_name') ?: 'has-error' !!}">
               
                <input type="text"  class="form-control" placeholder="{{ trans('admin.last_name') }}" name="last_name" value="{{ old('last_name') }}">
              </div>
        </div>
    </div>
    
    
      <div class="form-group has-feedback {!! !$errors->has('email') ?: 'has-error' !!}">
      

        <input type="email" class="form-control" placeholder="Email address"   name="email" value="{{ old('email') }}">
      
        
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback {!! !$errors->has('password') ?: 'has-error' !!}">

      
        <input type="password"  class="form-control" placeholder="{{ trans('admin.password') }}" name="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback {!! !$errors->has('password_confirmation') ?: 'has-error' !!}">

      
        <input type="password"  class="form-control" placeholder="Re-enter password" name="password_confirmation">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="row  mb-2">
        <div class="col-xs-8">
          @if(config('admin.auth.remember'))
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"  name="remember" value="1" {{ (!old('email') || old('remember')) ? 'checked' : '' }}>
              Agree to <a href="#">Terms of use</a>
            </label>
          </div>
          @endif
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <button type="submit" class="btn btn-primary btn-block btn-flat" style="border-radius: 5px;">Register</button>
        </div>
        <!-- /.col -->

        

      </div>
      <hr>
      <div class="row">
        <div class="col-xs-12">
            <div class="form-group">
                <div class="custom-control custom-checkbox">Already have an account? <a
                        href="{{ route('login') }}">Login</a> </div>
            </div>
        </div>
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