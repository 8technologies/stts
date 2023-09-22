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
    <title>Import Permit Report</title>
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
        <h2>SEED IMPORT PERMIT</h2>
        <p class="permit-number"><strong>No.</strong> <?php echo $permitNumber; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    
    <h3>The Seeds and Plant Act, 2006</h3>
    <p><strong>Permit No:</strong> {{$form->permit_number}}</p>
    <p><strong>Date:</strong> {{$form->valid_from}}</p>
    <p><strong>Permission is hereby granted to:</strong> {{$form->name}}</p>
    <p><strong>of:</strong> {{$form->address}}</p>
    <p><strong>with NCSC Registration No:</strong>__</p>
    <p><strong>to import from:</strong> {{$form->supplier_name}}, {{$form->supplier_address}}</p>
    <p><strong>the following seeds</strong></p>
    
    <table>
        <thead>
            <tr>
                <th>Species</th>
                <th>Variety</th>
                <th>Category</th>
                <th>Weight in Kgs</th>
            </tr>
        </thead>
        <tbody>
        @foreach ($crop_varieties as $crop) 
            @php
            $crop_variety = App\Models\CropVariety::where('id', $crop->crop_variety_id)->first(); // Use first() instead of get()
            $crop_name = App\Models\Crop::where('id', $crop_variety->crop_id)->value('name');
            @endphp
            
            <tr>
                <td>{{$crop_name}}</td>
                <td>{{$crop_variety->name}}</td> <!-- Access name attribute directly -->
                <td>{{$crop->category}}</td>
                <td>{{$crop->weight}}</td>
            </tr>
        @endforeach
            <!-- Add more rows as needed -->
        </tbody>
    </table>
<p>Subject to the following conditions:</p>
<ol>
    <li>The consignment of seed shall be accompanied by:
        <ul>
            <li>Phytosanitary certificate</li>
        </ul>
    </li>
    <li>The consignment shall be subjected to Ugandan plant quarantine regulations and upon arrival in your stores shall be inspected by plant/seed inspectors</li>
    <li>The seeds shall not be distributed prior to the release of the result of the tests carried on samples unless with express permission of the head of NSCS</li>
    <li>Payment of sampling and testing fees as stipulated in the fifth schedule to seeds regulations shall be honored</li>
    <li>Fulfillment of commerce/customs requirements and adherence to regulations pertaining to importation of seed</li>
    <li>Additional Conditions<span> {{$form->additional_conditions}}</span></li>
</ol>
   
   
  
<div class="signature-container">
        <div class="signature-text">
            <p>Signature:___________________________</p>
            <p>Permanent Secretary</p>
            <p>Ministry of Agriculture, Animal Industry and Fisheries</p>
        </div>
    </div>


    <p>cc <span id="datePlaceholder">The Head</span></p>
    <p>National Seed Certification Services</p>
    <p>P.O.Box 7065</p>
    <p>KAMPALA</p>


</body>
</html>
