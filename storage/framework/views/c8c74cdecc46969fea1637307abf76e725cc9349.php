<?php
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
        <?php if(isset($_SESSION['message'])): ?>
        <div class="alert alert-<?php echo e($_SESSION['type'], false); ?>"><?php echo e($_SESSION['message'], false); ?></div>
        <?php if($_SESSION['errors'] != null): ?>
        <div class="error-message">
            <div class="alert alert-<?php echo e($_SESSION['type'], false); ?>"><?php echo e($_SESSION['errors'], false); ?></div>
        </div>
        <?php endif; ?>
        <?php
        unset($_SESSION['message']);
        unset($_SESSION['type']);
        ?>
        <?php endif; ?>
  
      <div class="form fl">
        <form action="<?php echo e(route ('user.registration'), false); ?>" enctype="multipart/form-data" method="post">
          <?php echo csrf_field(); ?>
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
             <a href="<?php echo e(url('admin/auth/login'), false); ?>">Already have an account? Login</a></p>
        </form>
      </div>
    </div>
  </div>
</body>

</html><?php /**PATH C:\Users\Cole\Desktop\8Projects\stts\resources\views/registration/register.blade.php ENDPATH**/ ?>