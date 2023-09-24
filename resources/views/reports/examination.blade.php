<?php
$permitNumber = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\ImportExportPermit::where('id', $_GET['id'])->where('is_import' , 1)->first();

$crop_varieties = App\Models\ImportExportPermitsHasCrops::where('import_export_permit_id', $form->id)->get();



$date = date("j F Y");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Stock examination Report</title>
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
        <p>THE REPUBLIC OF UGANDA</p>
        <p>Ministry of Agriculture, Animal Industry and Fisheries</p>
        <p>P.O. Box 102, ENTEBBE</p>
        <h2>STOCK EXAMINATION REPORT</h2>
        <p class="permit-number"><strong>No.</strong> <?php echo $permitNumber; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    

    <p><strong>To:</strong> {{$form->permit_number}}</p>
    <p><strong>Address:</strong> {{$form->valid_from}}</p>
    <p><strong>Your seed(seed class):</strong> {{$form->name}} which was inspected and finalized on {{}} of 
     weight {{}} kgs of seeds and whose sample for stock approval analysis was taken on {{}} has been {{}}</p>

    <h5><strong>The results were</strong></h5>
    
    <table>
    <tr>
                <td><strong>Purity</strong></td>
                <td>{{ $form->purity }}</td>
            </tr>
            <tr>
                <td><strong>Germination</strong></td>
                <td>{{ $form->germination}}</td>
            </tr>
            <tr>
                <td><strong>Moisture</strong></td>
                <td>{{ $form->moisture }}</td>
            </tr>
            <tr>
                <td><strong>Insect damage</strong></td>
                <td>{{ $form->insect_damage }}</td>
            </tr>
            <tr>
                <td><strong>Mouldiness</strong></td>
                <td>{{ $form->mouldiness }}</td>
            </tr>
            <tr>
                <td><strong>Noxious seeds observable</strong></td>
                <td>{{ $form->phone_number }}</td>
            </tr>
          
    </table>

   
  
    <div class="signature-container">
        <div class="signature-text">
        <p>Signature of inspector: <span id="signaturePlaceholder">___________________________</span></p>
        <p>National Seed Certification Service</p>
        <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
        </div>
    </div>



</body>
</html>
