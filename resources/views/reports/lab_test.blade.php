<?php
$permitNumber = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\SeedLab::find($_GET['id']);
$applicant = App\Models\User::find($form->administrator_id)->name;
$crop_variety = App\Models\CropVariety::find($form->crop_variety_id)->name;
$status = strip_tags(App\Models\Utils::tell_status($form->report_recommendation));


$date = date("j F Y");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Lab Test Report</title>
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
            margin-left: 400px; 
            
        }
    </style>
</head>
<body>
    <header>
        <img src="{{ public_path('assets/images/coat.png') }}" alt="logo">
        <p>THE REPUBLIC OF UGANDA</p>
        <p>Ministry of Agriculture, Animal Industry and Fisheries</p>
        <p>P.O. Box 102, ENTEBBE</p>
        <h2>LAB TEST REPORT</h2>
        <p class="permit-number"><strong>No.</strong> <?php echo $permitNumber; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    
<p><strong>Lab Test Number:</strong>{{$form->lab_test_number}}</p>
    <p><strong>To:</strong> {{$applicant}}</p>
    <p>Your {{$crop_variety}} of lot {{$form->lot_number}} which was tested and finalized on {{$form->updated_at}} of 
    sample weight {{$form->quantity}} kgs is <strong> {{$status}}</strong></p>

    <h4><strong>RESULTS OF ANALYSIS</strong></h4>
    
    <table>
    <tr>
                <td><strong>Purity</strong></td>
                <td>{{ $form->purity }} %</td>
            </tr>
         
            <tr>
                <td><strong>Inert Matter</strong></td>
                <td>{{ $form->inert_matter }} %</td>
            </tr>
            <tr>
                <td><strong>Other crop seeds</strong></td>
                <td>{{ $form->other_crop_seeds }} %</td>
            </tr>
            <tr>
                <td><strong>Weed Seeds</strong></td>
                <td>{{ $form->weed_seed }} %</td>
            </tr>
            <tr>
                <td><strong>1st Count</strong></td>
                <td>{{ $form->first_count }} %</td>
            </tr>
            <tr>
                <td><strong>Final Count</strong></td>
                <td>{{ $form->final_count }} %</td>
            </tr>
            <tr>
                <td><strong>Hard</strong></td>
                <td>{{ $form->hard }} %</td>
            </tr>
            <tr>
                <td><strong>Fresh ungerminated</strong></td>
                <td>{{ $form->fresh }} %</td>
            </tr>
            <tr>
                <td><strong>Rotten or dead</strong></td>
                <td>{{ $form->dead }} %</td>
            </tr>
            <tr>
                <td><strong>Moisture</strong></td>
                <td>{{ $form->moisture }} %</td>
            </tr>
            <tr>
             
          
    </table>
    

    <p><strong>Recommendation:</strong> {{ $status }}</p>
  
    <div class="signature-container">
        <div class="signature-text">
        <p>Signature of inspector: <span id="signaturePlaceholder">___________________________</span></p>
        <p>National Seed Certification Service</p>
        <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
        </div>
    </div>



</body>
</html>

