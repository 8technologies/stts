
<?php
$sr6Number = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\FormSr6::find($_GET['id']);

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
        <p class="permit-number"><strong>No.</strong> <?php echo $sr6Number; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    


    <table>
     
           <td>Name:</td>
            <td><span id="yearPlaceholder">{{ $form->name_of_applicant }}</span></td>
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
        <tr>
            <td>Location of the farm:</td>
            <td><span id="boundaryPlaceholder">{{ $form->premises_location }}</span></td>
        </tr>
        <tr>
            <td>Validity date:</td>
            <td><span id="boundaryPlaceholder">{{ $form->valid_from }} to {{ $form->valid_until }}</span></td>
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
