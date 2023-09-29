
<?php
$sr6Number = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\FormSr10::find($_GET['id']);
$crop_variety = App\Models\CropVariety::find($form->crop_variety_id)->name;
$inspection_stage = App\Models\CropInspectionType::find($form->stage)->inspection_stage;
$status = strip_tags(App\Models\Utils::tell_status($form->status));
$applicant = App\Models\User::find($form->applicant_id)->name;


$date = date("j F Y");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inspection Report</title>
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
        <h2>Inspection Report</h2>
        <p class="permit-number"><strong>No.</strong> <?php echo $sr6Number; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    

    <p>Applicant Name: {{$applicant}}</p>
    <table>
     
           <td>Crop Variety:</td>
            <td><span id="yearPlaceholder">{{ $crop_variety }}</span></td>
        </tr>
        <tr>
            <td>Seed Class:</td>
            <td> <span id="yearPlaceholder">{{ $form->seed_class }}</span></td>
        </tr>
      
        <tr>
            <td>Inspection Stage:</td>
            <td><span id="emailPlaceholder">{{ $inspection_stage}}</span></td>
        </tr>
        <tr>
            <td>Inspection Decision:</td>
            <td><span id="boundaryPlaceholder">{{ $status }}</span></td>
        </tr>
        <tr>
            <td>Diseases:</td>
            <td><span id="boundaryPlaceholder">{{ $form->diseases }}</span></td>
        </tr>
        <tr>
            <td>Noxious weeds:</td>
            <td><span id="boundaryPlaceholder">{{ $form->noxious_weeds }}</span></td>
        </tr>
        <tr>
            <td>Other weeds:</td>
            <td><span id="boundaryPlaceholder">{{ $form->other_weeds}}</span></td>
        </tr>
        @if($inspection_stage == "Flowering")
        <tr>
            <td>Female shedding tassels%:</td>
            <td><span id="boundaryPlaceholder">{{ $form->female_shedding}}</span></td>
        </tr>
        <tr>
            <td>Female receptive silks% :</td>
            <td><span id="boundaryPlaceholder">{{ $form->female_receptive}}</span></td>
        </tr>
        <tr>
            <td>Female off-type%:</td>
            <td><span id="boundaryPlaceholder">{{ $form->female_off_type}}</span></td>
        </tr>
        <tr>
            <td>Male off-type%:</td>
            <td><span id="boundaryPlaceholder">{{ $form->male_off_type}}</span></td>
        </tr>
        @endif
        <tr>
            <td>Estimated yield:</td>
            <td><span id="boundaryPlaceholder">{{ $form->estimated_yield}}</span></td>
        </tr>
        <tr>
            <td>General crop conditions:</td>
            <td><span id="boundaryPlaceholder">{{ $form->general_conditions_of_crop}}</span></td>
        </tr>
        <tr>
            <td>Comments:</td>
            <td><span id="boundaryPlaceholder">{{ $form->status_comment}}</span></td>
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
