
<?php
$sr4Number = mt_rand(1000, 9999);
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
        <p class="permit-number"><strong>Serial No.</strong> <?php echo $sr4Number; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    


    <table>
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

   
    <div class="signature-container">
        <div class="signature-text">
        <p>Signature: <span id="signaturePlaceholder">___________________________</span></p>
        <p>National Seed Certification Service</p>
        <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
        </div>
    </div>
</body>
</html>