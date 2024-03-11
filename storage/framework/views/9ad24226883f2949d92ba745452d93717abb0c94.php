<?php
$link = public_path('css/bootstrap-print.css');
$form = App\Models\formQds::find($_GET['id']);

$date = date("j F Y");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificate of Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        #logo {
            width: 100px; /* Adjust the width as needed */
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <header>
        <img src="<?php echo e(public_path('assets/images/coat.png'), false); ?>" alt="logo">
        <h1>Ministry of Agriculture, Animal Industry and Fisheries</h1>
        <p>P.O. Box 102, Entebbe</p>
        <h2>Certificate of Registration</h2>
    </header>
    
    <p>Orange Book Page 147</p>

    <table>
        <tr>
            <td>Serial No.</td><span>regulation 6(1)</span>
        </tr>
           <td>Registration Number: </td>
            <td><span id="yearPlaceholder"><?php echo e($form->registration_number, false); ?></span></td>
        </tr>
        <tr>
            <td>For the year: </td>
            <td><span id="yearPlaceholder"><?php echo e($form->valid_from, false); ?> to <?php echo e($form->valid_until, false); ?></span></td>
        </tr>
        <tr>
            <td>Producer:</td>
            <td> <span id="yearPlaceholder"><?php echo e($form->name_of_applicant, false); ?></span></td>
        </tr>
      
        <tr>
            <td>Address:</td>
            <td><span id="emailPlaceholder"><?php echo e($form->address, false); ?></span></td>
        </tr>
        <tr>
            <td>Geographical boundary of operation:</td>
            <td><span id="boundaryPlaceholder"><?php echo e($form->farm_location, false); ?></span></td>
        </tr>
        <tr>
            <td>For the category of:</td>
            <td>Agricultural Crops</td>
        </tr>
    </table>

    <p>Note: If your annual renewal is not done for one year, you shall lose your status and shall have to reapply</p>

    <p>Signature: <span id="signaturePlaceholder">___________________________</span></p>
    <p>National Seed Certification Service</p>
    <p>Date: <span id="datePlaceholder"><?php echo e($date, false); ?></span></p>
</body>
</html>
<?php /**PATH C:\Users\Cole\Desktop\stts\resources\views/reports/qds.blade.php ENDPATH**/ ?>