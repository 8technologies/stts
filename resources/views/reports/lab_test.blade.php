<?php
$permitNumber = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\SeedLab::find($_GET['id']);
$applicant = App\Models\User::find($form->administrator_id)->name;
$crop = App\Models\CropVariety::find($form->crop_variety_id);
$analyst = App\Models\User::find($form->lab_technician)->name;

if ($crop !== null) {
    $crop_variety = $crop->name;
   
} else {
    $crop_variety = 'Crop variety not found';
    
}
$status = strip_tags(App\Models\Utils::tell_status($form->report_recommendation));


$date = date("j F Y");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OFFICIAL SEED TEST RESULTS CERTIFICATE</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <style>
        * {
            font-size: 14px;
        }
        
        p, h1, h2, h3, h4, h5, h6 {
            padding: 0;
            margin: 0;
        }

       .text-center {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .small-text {
            font-size: 10px !important;
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
        
        .p-0, .p-0 td, .p-0 th {
            padding: 0;
            margin: 0;
        }
        
        .rotate {}
        
        .rotate p {
            -moz-transform: rotate(-90.0deg);
            -o-transform: rotate(-90.0deg);
            -webkit-transform: rotate(-90.0deg);
            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083);
            -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083)";
        }
    </style>
</head>
<body>
    <table class="table table-borderless">
        <tr>
            <td>
               <p class="permit-number"><strong>No.</strong> <?php echo $permitNumber; ?></p>       
            </td>
            <td class="text-center">
                <img width="100" src="assets/images/coat.png" alt="">
                <p>REPUBLIC OF UGANDA</p>
                <p class="pb-0 mb-0">Ministry of Agriculture, Animal Industry & Fisheries</p>
                <p class="p-0 m-0"><b>P.O. Box 102, ENTEBBE</b></p>
            </td>
            <td class="text-right">
                |r.14(4)|
            </td>
        </tr>
    </table>
    <h2>LAB TEST REPORT</h2>
    <table class="table table-bordered" style="border-color: black!important;">
        <tbody>
            <tr>
                <th width="20%" class="text-left">
                    <p>Date received</p>
                </th>
                <td>
                    <p class="text-center">{{$form->updated_at}}</p>
                </td>
                <th width="25%">
                <p>Lab Test Number</p>
                </th>
                <td>
                    <p class="text-center">{{$form->lab_test_number}}</p>
                </td>
            </tr>
            <tr>
                <th width="20%" class="text-left">
                    <p>Lot Number</p>
                </th>
                <td>
                    <p class="text-center">{{$form->lot_number}} </p>
                </td>
                <th width="25%">
                    Status
                </th>
                <td>
                    <p class="text-center"> {{$status}}</p>
                </td>
            </tr>
            <tr>
                <th width="20%" class="text-left">
                    <p>Crop Variety:</p>
                </th>
                <td>
                    <p class="text-center"> {{$crop_variety}} </p>
                </td>
                <td width="25%">
                    <p><b>Weight of Lot:</b></p>
                </td>
                <td>
                    <p class="text-center">{{$form->quantity}} kgs</p>
                </td>
            </tr>
        </tbody>
    </table>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <td colspan="12">
                    <h5 class="text-center">RESULTS OF THE ANALYSIS</h5>
                </td>
            </tr>
            <tr>
                <th colspan="4" class="text-center">
                    <p>PURITY (P)</p>
                </th>
                <th colspan="4" class="text-center">
                    <p>GERMINATION CAPACITY (G)</p>
                </th>
                <td></td>
                <td rowspan="2" class="rotate pl-0 pr-0 pt-5" style="width: 10px!important">
                    <p>Abnormal</p>
                </td>
                <th class="text-center">
                    <p>PX5/100</p>
                </th>
                <th class="text-center">
                </th>
            </tr>
            <tr class="small-text p-0 text-center">
                <td>Pure Seed (p)</td>
                <td>Inert Matter</td>
                <td>Other Crop<br>Seeds</td>
                <td>Weed Seeds</td>
                <td>1st Count</td>
                <td>Final Count</td>
                <td>Hard</td>
                <td>Fresh Ungermi-<br>nated</td>
                <td>Rotten or Dead</td>
                <td>...</td>
                <td>Moisture</td>
            </tr>
            <tr class="p-0 text-center">
            <td>{{ $form->purity }} %</td>
                <td>{{ $form->inert_matter }} %</td>
                <td>{{ $form->other_crop_seeds }} %</td>
                <td>{{ $form->weed_seed }} %</td>
                <td>{{ $form->first_count }}</td>
                <td>{{ $form->final_count }}</td>
                <td>{{ $form->hard }} %</td>
                <td>{{ $form->fresh }} %</td>
                <td>{{ $form->dead }} %</td>
                <td>...</td>
                <td>...</td>
                <td>{{ $form->moisture }} %</td>
                
            </tr>
        </tbody>
    </table>
    <p>* incl........% abnormal sprouts of which,. nil.......% broken germs.</p>
    <h4>NOTE: Marketable</h4>
    <table class="table table-borderless">
        <tr>
            <td width="50%" class="border border-2 mt-2 p-1 pl-2" style="height: 10%;">
            </td>
            <td>
                <div class=" mt-2 p-1 pl-2  w-100" style="height: 10%; width: 100%;">
                    <h2 style="border-bottom: dotted bottom 2px;" class=" h5 text-center">{{$analyst}}</h2>
                    <h2  class=" h5 text-left"><i>Official Seed Tester</i></h2>
                    <h2 style="border-bottom: dotted bottom 2px;" class=" h5 text-left">DATE: {{$date}}</h2>
                    <h2  class=" h5 text-left"><i>For director of seeds</i></h2>
                </div>
            </td>
        </tr>
    </table>
    <div style="width: 50%" style="height: 7%">
        <table class="table table-bordered p-0 m-0">
             <tr class="small-text text-left p-0 m-0">
                 <th class="text-left" width="30%">Paid</th>
                 <th></th>
             </tr>
             <tr>
                 <th class="text-left">Deposit</th>
                 <th></th>
             </tr>
             <tr class="small-text">
                 <th class="text-left">Government</th>
                 <th></th>
             </tr>
             <tr class="small-text">
                 <th class="text-left">Unpaid</th>
                 <th></th>
             </tr>
        </table>
    </div>
    <h6>Any inquiries concerning this test must quote the test number</h6>
    <br>
    <p class="text-center">VALIDITY OF THIS REPORT IS AS SPECIFIED IN CLAUSE 16 OF THESE REGULATIONS</p>
    <small>Printed by Uganda Printing and Publishing Corporation</small>
</body>
</html>

