
<?php
$link = public_path('css/bootstrap-print.css');
$form = App\Models\FormSr4::find($_GET['id']);

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
    


    <table>
    <tr>
                <td><strong>Serial No.</strong></td>
                <td>15(1)</td>
            </tr>
            <tr>
                <td><strong>Registration Number</strong></td>
                <td>{{ $form->seed_board_registration_number }}</td>
            </tr>
            <tr>
                <td><strong>For the year</strong></td>
                <td>{{ $form->valid_from }}</td>
            </tr>
            <tr>
                <td><strong>Until the year</strong></td>
                <td>{{ $form->valid_until }}</td>
            </tr>
            <tr>
                <td><strong>Company</strong></td>
                <td>{{ $form->company_initials }}</td>
            </tr>
            <tr>
                <td><strong>Address</strong></td>
                <td>{{ $form->address }}</td>
            </tr>
            <tr>
                <td><strong>Tel No</strong></td>
                <td>{{ $form->phone_number }}</td>
            </tr>
            <tr>
                <td><strong>Location of premises</strong></td>
                <td>{{ $form->premises_location }}</td>
            </tr>
            <tr>
                <td><strong>For the category of</strong></td>
                <td>{{ $form->marketing_of }}</td>
               
            </tr>
    </table>

   

    <p>Signature: <span id="signaturePlaceholder">___________________________</span></p>
    <p>National Seed Certification Service</p>
    <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
</body>
</html>