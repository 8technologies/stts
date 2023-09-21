<?php
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
    </style>
</head>
<body>
    <header>
        <img src="{{ public_path('assets/images/coat.png') }}" alt="logo">
        <h1>Ministry of Agriculture, Animal Industry and Fisheries</h1>
        <p>P.O. Box 102, Entebbe</p>
        <h2>Certificate of Registration</h2>
    </header>
    
    <p>Orange Book Page 147</p>

    <table>
        <tr>
            <td>Serial No.</td>
            <td><span>regulation 6(1)</span></td>
        </tr>
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
            <td>Geographical boundary of operation:</td>
            <td><span id="boundaryPlaceholder">{{ $form->farm_location }}</span></td>
        </tr>
        <tr>
            <td>For the category of:</td>
            <td>Agricultural Crops</td>
        </tr>
    </table>

    <p>Note: If your annual renewal is not done for one year, you shall lose your status and shall have to reapply</p>

    <p>Signature: <span id="signaturePlaceholder">___________________________</span></p>
    <p>National Seed Certification Service</p>
    <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
</body>
</html>