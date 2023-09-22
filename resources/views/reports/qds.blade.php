<?php
$qdsNumber = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\FormQds::find($_GET['id']);

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
        .permit-number {
            position: absolute;
            top: 10px; /* Adjust the top value to position it vertically */
            left: 10px; /* Adjust the left value to position it horizontally */
        }
        .r-number {
            position: absolute;
            top: 10px; /* Adjust the top value to position it vertically */
            right: 10px; /* Adjust the right value to position it horizontally */
        }
        .signature-container {
            text-align: right;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .signature-text {
            text-align: left; 
            margin-left: 300px; 
            
        }
    </style>
</head>
<body>
    <header>
        <img src="{{ public_path('assets/images/coat.png') }}" alt="logo">
        <h1>Ministry of Agriculture, Animal Industry and Fisheries</h1>
        <p>P.O. Box 102, Entebbe</p>
        <h2>Certificate of Registration</h2>
        <p class="permit-number"><strong>Serial No.</strong> <?php echo $qdsNumber; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>

    <table>
      
           <td>Registration Number: </td>
            <td><span id="yearPlaceholder">{{ $form->registration_number }}</span></td>
        </tr>
        <tr>
            <td>For the year: </td>
            <td><span id="yearPlaceholder">{{ $form->valid_from }} to {{ $form->valid_until }}</span></td>
        </tr>
        <tr>
            <td>Producer:</td>
            <td> <span id="yearPlaceholder">{{ $form->name_of_applicant }}</span></td>
        </tr>
      
        <tr>
            <td>Address:</td>
            <td><span id="emailPlaceholder">{{ $form->address }}</span></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><span id="emailPlaceholder">{{ $form->phone_number }}</span></td>
        </tr>
        <tr>
            <td>Geographical boundary of operation:</td>
            <td><span id="boundaryPlaceholder">{{ $form->farm_location }}</span></td>
        </tr>
        <tr>
            <td>For the category of:</td>
            <td>Agricultural Crops</td>
        </tr>
    </table>

    <p>Note: If your annual renewal is not done for one year, you shall lose your status and shall have to reapply</p>

    <div class="signature-container">
        <div class="signature-text">
        <p>Signature: <span id="signaturePlaceholder">___________________________</span></p>
        <p>National Seed Certification Service</p>
        <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
        </div>
    </div>
</body>
</html>
