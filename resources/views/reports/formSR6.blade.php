<?php
$link = public_path('css/bootstrap-print.css');
$form = App\Models\formSr6::find($_GET['id']);

$date = date("j F Y");
?>
<!DOCTYPE html>
<html>
<head>
    <style>
      body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            border: 1px solid #ccc;
            padding: 30px; /* Increase padding for a larger card */
            border-radius: 10px;
            width: 400px; /* Increase width for a larger card */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        .card p {
            margin: 10px 0; /* Increase margin for more spacing between elements */
        }
    </style>
</head>
<body>

<div class="card">
    <p><strong>Serial No.</strong> regulation 19(4)</p>
    <p><strong>Name:</strong> {{ $form->name_of_applicant }}</p>
    <p><strong>Grower Number (GN):</strong> {{ $form->grower_number }}</p>
    <p><strong>Registration number (RN):</strong>{{ $form->registration_number }}</p>
    <p><strong>Postal Address:</strong> {{ $form->address }}</p>
    <p><strong>Tel No:</strong>{{ $form->phone_number }}</p>
    <p><strong>Location of the farm:</strong> {{ $form->premises_location }}</p>
    <p><strong>Validity date:</strong> from {{ $form->valid_from }} to {{ $form->valid_until }}</p>
</div>

</body>
</html>

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
           <td>Name:</td>
            <td><span id="yearPlaceholder">{{ $form->name_of_applicant }}</span></td>
        </tr>
        <tr>
            <td>For the year: </td>
            <td><span id="yearPlaceholder">{{ $form->valid_from }} to {{ $form->valid_until }}</span></td>
        </tr>
        <tr>
            <td>Grower Number (GN):</td>
            <td> <span id="yearPlaceholder">{{ $form->grower_number }}</span></td>
        </tr>
      
        <tr>
            <td>Registration number (RN):</td>
            <td><span id="emailPlaceholder">{{ $form->registration_number }}</span></td>
        </tr>
        <tr>
            <td>Postal Address:</td>
            <td><span id="boundaryPlaceholder">{{ $form->address }}</span></td>
        </tr>
        <tr>
            <td>Tel No:</td>
            <td><span id="boundaryPlaceholder">{{ $form->phone_number }}</span></td>
        </tr>
    </table>

    <p>Note: If your annual renewal is not done for one year, you shall lose your status and shall have to reapply</p>

    <p>Signature: <span id="signaturePlaceholder">___________________________</span></p>
    <p>National Seed Certification Service</p>
    <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
</body>
</html>
