<?php
use App\Models\Utils; 
Utils::start_session();
//session_start();
//$_SESSION['message'] = 'Romina';
?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo e(config('admin.title'), false); ?> | <?php echo e(trans('admin.login'), false); ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
  
  <?php if(!is_null($favicon = Admin::favicon())): ?>
  <link rel="shortcut icon" href="<?php echo e($favicon, false); ?>">
  <?php endif; ?>

  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="<?php echo e(admin_asset('vendor/laravel-admin/AdminLTE/bootstrap/css/bootstrap.min.css'), false); ?>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo e(admin_asset('vendor/laravel-admin/font-awesome/css/font-awesome.min.css'), false); ?>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo e(admin_asset('vendor/laravel-admin/AdminLTE/dist/css/AdminLTE.min.css'), false); ?>">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo e(admin_asset('vendor/laravel-admin/AdminLTE/plugins/iCheck/square/blue.css'), false); ?>">

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
<body class="hold-transition login-page" style="background: url(<?php echo e(asset('/assets/images/bg/background2.jpg'), false); ?>) no-repeat;background-size: cover;">
<div class="login-box">

  <!-- /.login-logo -->
  <div class="login-box-body" style="border-radius: 25px">
  <div class="login-logo">
    <a href="<?php echo e(admin_url('/'), false); ?>"><b><?php echo e(config('admin.name'), false); ?> Web Dashboard Login</b></a>
  <hr>
  </div>

  <?php if(isset($_SESSION['message'])): ?>
  <div class="alert alert-<?php echo e($_SESSION['type'], false); ?>"><?php echo e($_SESSION['message'], false); ?></div> 
  <?php
  unset($_SESSION['message']);
  unset($_SESSION['type']);
  ?>     
  <?php endif; ?>


    <!-- <p class="login-box-msg"><?php echo e(trans('admin.login'), false); ?></p> -->

    <form action="<?php echo e(admin_url('auth/login'), false); ?>" method="post">
      <div class="form-group has-feedback <?php echo !$errors->has('username') ?: 'has-error'; ?>">

        <input type="hidden" name="_token" value="<?php echo e(csrf_token(), false); ?>">

        <?php if($errors->has('username')): ?>
          <?php $__currentLoopData = $errors->get('username'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $message): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i><?php echo e($message, false); ?></label><br>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php endif; ?>

        <input type="text" class="form-control" placeholder="<?php echo e(trans('admin.username'), false); ?>" name="username" value="<?php echo e(old('username'), false); ?>" required>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback <?php echo !$errors->has('password') ?: 'has-error'; ?>">

        <?php if($errors->has('password')): ?>
          <?php $__currentLoopData = $errors->get('password'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $message): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i><?php echo e($message, false); ?></label><br>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php endif; ?>
<!-- 
        <input type="password" class="form-control" placeholder="<?php echo e(trans('admin.password'), false); ?>" name="password" required>
         <span class="glyphicon glyphicon-lock "></span> -->
        <!-- <span toggle="#password-field" class="fa fa-fw fa-eye form-control-feedback toggle-password"></span> -->
    
        <input id="password-field" type="password" class="form-control"  placeholder="<?php echo e(trans('admin.password'), false); ?>" name="password" required>
        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" ></span>
        
      </div>
      <div class="row">
        <div class="col-xs-8">
          <?php if(config('admin.auth.remember')): ?>
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="remember" value="1" <?php echo e((!old('username') || old('remember')) ? 'checked' : '', false); ?>>
              <?php echo e(trans('admin.remember_me'), false); ?>

            </label>
          </div>
          <?php endif; ?>
        </div>

        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat" style="border-radius: 5px;"><?php echo e(trans('admin.login'), false); ?></button>
        </div>
        <!-- /.col -->
      </div> 
      
      <!-- <hr>
      <div class="row">
        <div class="col-xs-12">
            <div class="form-group">
                <div class="custom-control custom-checkbox">Don't have an account? <a
                        href="<?php echo e(route('register'), false); ?>">Register</a> </div>
            </div>
        </div>
      </div> -->
    </form>
    <div>
      <a href="<?php echo e(route('password.reset'), false); ?>">Forgot Password?</a>
      <a href="<?php echo e(route('user.registration'), false); ?>" class="pull-right">Register</a>
      </div>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.1.4 -->
<script src="<?php echo e(admin_asset('vendor/laravel-admin/AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js'), false); ?>"></script>
<!-- Bootstrap 3.3.5 -->
<script src="<?php echo e(admin_asset('vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js'), false); ?>"></script>
<!-- iCheck -->
<script src="<?php echo e(admin_asset('vendor/laravel-admin/AdminLTE/plugins/iCheck/icheck.min.js'), false); ?>"></script>

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
<?php /**PATH C:\xampp\htdocs\stts\vendor\encore\laravel-admin\src/../resources/views/login.blade.php ENDPATH**/ ?>