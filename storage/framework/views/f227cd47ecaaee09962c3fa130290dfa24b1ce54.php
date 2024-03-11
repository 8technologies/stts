<?php
$permitNumber = mt_rand(1000, 9999);
$link = public_path('css/bootstrap-print.css');
$form = App\Models\FormStockExaminationRequest::find($_GET['id']);
$applicant = App\Models\User::find($form->administrator_id)->name;
$status = strip_tags(App\Models\Utils::tell_status($form->status));


$date = date("j F Y");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Stock examination report</title>
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
        <img src="<?php echo e(public_path('assets/images/coat.png'), false); ?>" alt="logo">
        <p>THE REPUBLIC OF UGANDA</p>
        <p>Ministry of Agriculture, Animal Industry and Fisheries</p>
        <p>P.O. Box 102, ENTEBBE</p>
        <h2>STOCK EXAMINATION REPORT</h2>
        <p class="permit-number"><strong>No.</strong> <?php echo $permitNumber; ?></p>
        <p class="r-number">[R.20(1)(c)]</p>
    </header>
    

    <p><strong>To:</strong> <?php echo e($applicant, false); ?></p>
    <p>Your <?php echo e($form->seed_class, false); ?> which was inspected and finalized on <?php echo e($form->updated_at, false); ?> of 
     weight <?php echo e($form->yield, false); ?> kgs of seeds and whose sample for stock approval analysis was taken on <?php echo e($form->date, false); ?> has been <?php echo e($status, false); ?></p>

    <h4><strong>The results were</strong></h4>
    
    <table>
    <tr>
                <td><strong>Purity</strong></td>
                <td><?php echo e($form->purity, false); ?> %</td>
            </tr>
            <tr>
                <td><strong>Germination</strong></td>
                <td><?php echo e($form->germination, false); ?> %</td>
            </tr>
            <tr>
                <td><strong>Moisture Content</strong></td>
                <td><?php echo e($form->moisture_content, false); ?> %</td>
            </tr>
            <tr>
                <td><strong>Insect damage</strong></td>
                <td><?php echo e($form->insect_damage, false); ?> %</td>
            </tr>
            <tr>
                <td><strong>Mouldiness</strong></td>
                <td><?php echo e($form->moldiness, false); ?> %</td>
            </tr>
            <tr>
                <td><strong>Noxious seeds observable</strong></td>
                <td><?php echo e($form->noxious_weeds, false); ?> %</td>
            </tr>
          
    </table>

    <p><strong>Recommendation:</strong> <?php echo e($form->status_comment, false); ?></p>
  
    <div class="signature-container">
        <div class="signature-text">
        <p>Signature of inspector: <span id="signaturePlaceholder">___________________________</span></p>
        <p>National Seed Certification Service</p>
        <p>Date: <span id="datePlaceholder"><?php echo e($date, false); ?></span></p>
        </div>
    </div>



</body>
</html>
<?php /**PATH C:\Users\Cole\Desktop\stts\resources\views/reports/examination.blade.php ENDPATH**/ ?>