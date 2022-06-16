<?php
$data['number'] = '04084';
$data['date_received'] = '12/02/2022';
$data['log_number'] = 'NHL...S4S/NRB3/2/21B';
$data['cold_room'] = '0050';
$data['country_of_origin'] = 'NAROHOLDIINGS (SEED FOR SEEBS)';
$data['wight_loss'] = '3,429kg';
$data['crop_species'] = 'PHASEOLUS VULGARIS NAROBEAN 3';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OFFICIAL SEE TEST RESULTS CERTIFICATE</title>
    <link href="<?= url('assets/css/bootsrtap.css') ?>" rel="stylesheet"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <style>
        * {
            font-size: 14px;
        }

        p,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            padding: 0%;
            margin: 0%;
        }

        .small-text {
            font-size: 10px !important;
        }

        .p-0,
        .p-0 td,
        .p-0 th {
            padding: 0%;
            margin: 0%;
        }


        .rotate {}

        .rotate p {
            -moz-transform: rotate(-90.0deg);
            /* FF3.5+ */
            -o-transform: rotate(-90.0deg);
            /* Opera 10.5 */
            -webkit-transform: rotate(-90.0deg);
            /* Saf3.1+, Chrome */
            filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083);
            /* IE6,IE7 */
            -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=0.083)";
            /* IE8 */

        }

    </style>

</head>

<body>
    <table class="table table-borderless ">
        <tr>
            <td>
                <p>FORM SR 12A</p>
                <p>NO. <b> {{ $data['number'] }} </b></p>
            </td>
            <td class="text-center">
                <img width="100" src="<?= url('assets/images/uganda.png') ?>" alt="">
                <p>REPUBLIC OF UGANDA</p>
                <p class="pb-0 mb-0">Ministry of Agriculture, Animal Industry & Fishuries</p>
                <p class="p-0 m-0"><b>National Seed Certification Service</b></p>
            </td>
            <td class="text-right">
                |r.14(4)|
            </td>
        </tr>
    </table>
    <h4 class="text-center pt-0 mt-0 mb-2">OFFICIAL SEE TEST RESULTS CERTIFICATE</h4>

    <table class="table table-bordered" style="border-color: black!important;">
        <tbody>
            <tr>
                <th width="20%" class="text-left">
                    <p>Date received</p>
                </th>
                <td>
                    <p class="text-center"> {{ $data['date_received'] }} </p>
                </td>
                <th width="25%">
                    TEST NUMBER
                </th>
            </tr>
            <tr>
                <th width="20%" class="text-left">
                    <p>Lot Number</p>
                </th>
                <td>
                    <p class="text-center"> {{ $data['log_number'] }} </p>
                </td>
                <th width="25%">
                    {{ $data['cold_room'] }}
                </th>
            </tr>

            <tr>
                <th width="20%" class="text-left">
                    <p>Crop Species and Variety:</p>
                </th>
                <td>
                    <p class="text-center"> {{ $data['crop_species'] }} </p>
                </td>
                <td width="25%">
                    <p><b>Wight of Lot:</b></p>
                    <p>{{ $data['wight_loss'] }}</p>
                </td>
            </tr>

            <tr>
                <th width="20%" class="text-left">
                    <p>Country of origin</p>
                </th>
                <td colspan="2">
                    <p class="text-center"> {{ $data['country_of_origin'] }} <small>(As stated by Seed
                            Inspector)</small></p>
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
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
                <td>...</td>
            </tr>
        </tbody>
    </table>
    <p>* incl........% abnormal sprouts of which,. nil.......% broken germs.</p>
    <h4>NOTE: Marketable</h4>

    <table class="table table-borderless ">
        <tr>
            <td width="50%" class="border border-2 mt-2 p-1 pl-2" style="height: 10%;">
           
            </td>
            <td>
                <div class=" mt-2 p-1 pl-2  w-100" style="height: 10%; width: 100%;">
                    <h2 style="border-bottom: dotted bottom 2px;" class=" h5 text-center">MOSES ERONGU</h2>
                    <h2  class=" h5 text-left"><i>Official Seed Tester</i></h2>

                    <h2 style="border-bottom: dotted bottom 2px;" class=" h5 text-left">DATE:  23<sup>rd</sup>/02/2022</h2>
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
    <small>Printed by Uganda Printig and Publishing Corporation</small>





</body>

</html>
