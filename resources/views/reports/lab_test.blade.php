<?php
$permitNumber = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\SeedLab::find($_GET['id']);
$applicant = App\Models\User::find($form->administrator_id)->name;
$status = strip_tags(App\Models\Utils::tell_status($form->status));


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
    

    <p><strong>To:</strong> {{$applicant}}</p>
    <p>Your {{$form->seed_class }} which was inspected and finalized on {{$form->updated_at}} of 
     weight {{$form->yield}} kgs of seeds and whose sample for stock approval analysis was taken on {{$form->date}} has been {{$status}}</p>

    <h4><strong>The results were</strong></h4>
    
    <table>
    <tr>
                <td><strong>Purity</strong></td>
                <td>{{ $form->purity }} %</td>
            </tr>
            <tr>
                <td><strong>Germination</strong></td>
                <td>{{ $form->germination}} %</td>
            </tr>
            <tr>
                <td><strong>Moisture Content</strong></td>
                <td>{{ $form->moisture_content }} %</td>
            </tr>
            <tr>
                <td><strong>Insect damage</strong></td>
                <td>{{ $form->insect_damage }} %</td>
            </tr>
            <tr>
                <td><strong>Mouldiness</strong></td>
                <td>{{ $form->moldiness }} %</td>
            </tr>
            <tr>
                <td><strong>Noxious seeds observable</strong></td>
                <td>{{ $form->noxious_weeds }} %</td>
            </tr>
          
    </table>

    <p><strong>Recommendation:</strong> {{ $form->status_comment }}</p>
  
    <div class="signature-container">
        <div class="signature-text">
        <p>Signature of inspector: <span id="signaturePlaceholder">___________________________</span></p>
        <p>National Seed Certification Service</p>
        <p>Date: <span id="datePlaceholder">{{ $date }}</span></p>
        </div>
    </div>



</body>
</html>
