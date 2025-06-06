<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body{
          margin-top: 150px;
          background-color: #008140;
        }
        .error-main{
          background-color: #fff;
          box-shadow: 0px 10px 10px -10px #5D6572;
        }
        .error-main h1{
          font-weight: bold;
          color: #444444;
          font-size: 150px;
          text-shadow: 2px 4px 5px #6E6E6E;
        }
        .error-main h6{
          color: #42494F;
          font-size: 20px;
        }
        .error-main p{
          color: #9897A0;
          font-size: 15px; 
        }
    </style>
</head>
<body>
  
    <div class="container">
      <div class="row text-center">
        <div class="col-lg-6 offset-lg-3 col-sm-6 offset-sm-3 col-12 p-3 error-main">
          <div class="row">
            <div class="col-lg-8 col-12 col-sm-10 offset-lg-2 offset-sm-1">
              <h2 class="m-0">OOPS!!</h2>
              <h6>Data not found - STTS</h6>
              <p>The Data you are looking for doesnt seem to exist, check the address and reload the page again</p>
              <!-- a link to go back to the dashboard -->
              <a href="<?php echo e(url('admin'), false); ?>" class="nav-link"> Back</a>
            </div>
          </div>
        </div>
      </div>
    </div>
      
</body>
</html>
<?php /**PATH C:\Users\Cole\Desktop\8Projects\stts\resources\views/errors/data_not_found.blade.php ENDPATH**/ ?>