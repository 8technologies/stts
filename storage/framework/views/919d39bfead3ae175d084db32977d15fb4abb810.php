<?php
use App\Models\Utils;
?>

<!DOCTYPE html>
<html>
<head>
  <title>Report</title>
  <style>
 .card {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin: 20px;
      width: 95%;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

  .details-container {
    display: flex;
  }

  .details-column {
    flex: 1;
    margin-right: 20px;
  }

  @media  print {
    .print-button {
      display: none;
    }
  }
  .form_buttons {
      text-align: right;
  }
  .header {
    text-align: center;
    margin-bottom: 20px;
  }
    
  </style>
</head>
<body>
  <div class="form_buttons mt-3 mt-md-0">
    <?php if(isset($_SERVER['HTTP_REFERER'])): ?>
      <a href="<?php echo e($_SERVER['HTTP_REFERER'], false); ?>" class="print-button btn btn-secondary btn-sm">
        <i class="fa fa-chevron-left"></i> HOME
      </a>
    <?php endif; ?>
    <a href="<?php echo e(admin_url('form-sr4s/' . $form->id . '/edit'), false); ?>" class="print-button btn btn-warning btn-sm">
      <i class="fa fa-edit"></i> EDIT
    </a>
    <a href="#" onclick="window.print();return false;" class="print-button btn btn-primary btn-sm">
      <i class="fa fa-print"></i> PRINT
    </a>
  </div>
  <div class="header">
    <img src="<?php echo e(asset('assets/images/maaif.png'), false); ?>" alt="Header Image" width="450" height="95">
  </div>
  <div class="card">
    
    <div class="details-container">      
      <div class="details-column">     
        <h3 class="text-uppercase h4 p-0 m-0"><b>COMPANY DETAILS</b></h3>
        <hr class="my-1 my-md-3">
        <div class="border border-1 rounded bg-">
                <?php if($form->receipt == null): ?>
                    <img class="img-fluid" src="<?php echo e(asset('assets/images/avatar/04.jpg'), false); ?>" width="200" height="200">
                <?php else: ?>
                <img class="img-fluid" src="<?php echo e(asset('uploads/' . $form->receipt), false); ?>" width="200" height="200">
                <?php endif; ?>
        </div>
        <hr class="my-1 my-md-3">
        <?php echo $__env->make('components.detail-item', [
            't' => 'Application Category',
            's' => $form->type,
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        
        <?php echo $__env->make('components.detail-item', [
                't' => 'Seed board registration numbe', 
                's' => $form->seed_board_registration_number,
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <?php echo $__env->make('components.detail-item', [
                't' => 'Name of applicant',
                's' => $form->name_of_applicant,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php echo $__env->make('components.detail-item', [
                't' => 'Address',
                's' => $form->address,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php echo $__env->make('components.detail-item', [
                't' => 'company initials',
                's' => $form->company_initials,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <?php echo $__env->make('components.detail-item', [
                't' => 'Premises location',
                's' => $form->premises_location,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <?php echo $__env->make('components.detail-item', [
                't' => 'Experience in',
                's' => $form->expirience_in,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php echo $__env->make('components.detail-item', [
                't' => 'years of experience',
                's' => $form->years_of_expirience,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


        <!-- Include other company detail items here -->

      </div>
      <div class="details-column">
        <h3 class="text-uppercase h4 p-0 m-0"><b>LICENSE DETAILS</b></h3>
        <hr class="my-1 my-md-3">
       <?php if($form->dealers_in == 'Other'): ?>
        <?php echo $__env->make('components.detail-item', [
            't' => 'Dealers in',
            's' => $form->dealers_in_other,
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
            't' => 'Dealers in',
            's' => $form->dealers_in,
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->marketing_of == 'Other'): ?>
        <?php echo $__env->make('components.detail-item', [
            't' => 'Marketing of',
            's' => $form->marketing_of_other,
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
            't' => 'Marketing of',
            's' => $form->marketing_of,
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->have_adequate_land == 1): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate land', 
                's' => 'Yes',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($form->have_adequate_land == 2): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Land size', 
                's' => 'N/A',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Land size', 
                's' => 'No',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->have_adequate_storage == 1): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate storage', 
                's' => 'Yes',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($form->have_adequate_storage == 2): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate storage', 
                's' => 'N/A',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'have adequate storage', 
                's' => 'No',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->have_adequate_equipment == 1): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate equipment', 
                's' => 'Yes',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($form->have_adequate_equipment == 2): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate equipment', 
                's' => 'N/A',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'have adequate equipment', 
                's' => 'No',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->eqipment != null): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Equipment',
                's' => $form->eqipment,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->have_contractual_agreement == 1): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have contractual agreement', 
                's' => 'Yes',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($form->have_contractual_agreement == 2): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have contractual agreement', 
                's' => 'N/A',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'have contractual agreement', 
                's' => 'No',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->have_adequate_field_officers == 1): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate field officers', 
                's' => 'Yes',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($form->have_adequate_field_officers == 2): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have adequate field officers', 
                's' => 'N/A',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'have adequate field officers', 
                's' => 'No',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        <?php if($form->have_conversant_seed_matters == 1): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have conversant seed matters', 
                's' => 'Yes',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php elseif($form->have_conversant_seed_matters == 2): ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'Have conversant seed matters', 
                's' => 'N/A',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php else: ?>
        <?php echo $__env->make('components.detail-item', [
                't' => 'have conversant seed matters', 
                's' => 'No',
                ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>

        
            <?php echo $__env->make('components.detail-item', [
                't' => 'source of seed',
                's' => $form->souce_of_seed,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <?php if($form->have_adequate_land_for_production == 1): ?>
            <?php echo $__env->make('components.detail-item', [
                    't' => 'Have adequate land for production', 
                    's' => 'Yes',
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php elseif($form->have_adequate_land_for_production == 2): ?>
            <?php echo $__env->make('components.detail-item', [
                    't' => 'Have adequate land for production', 
                    's' => 'N/A',
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php else: ?>
            <?php echo $__env->make('components.detail-item', [
                    't' => 'have adequate land for production', 
                    's' => 'No',
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php endif; ?>

            <?php if($form->have_internal_quality_program == 1): ?>
            <?php echo $__env->make('components.detail-item', [
                    't' => 'Have internal quality program', 
                    's' => 'Yes',
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php elseif($form->have_internal_quality_program == 2): ?>
            <?php echo $__env->make('components.detail-item', [
                    't' => 'Have internal quality program', 
                    's' => 'N/A',
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php else: ?>
            <?php echo $__env->make('components.detail-item', [
                    't' => 'have internal quality program', 
                    's' => 'No',
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php endif; ?>
          
            <?php echo $__env->make('components.detail-item', [
                't' => 'validity',
                's' => $form->valid_from.' to '.$form->valid_until,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

            <?php if($form->status != null): ?>
            <?php echo $__env->make('components.detail-item', [
                't' => 'status',
                's' => Utils::tell_status($form->status),
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php endif; ?>
            
            <?php echo $__env->make('components.detail-item', [
                't' => 'status comment',
                's' => $form->status_comment,
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


        <!-- Include other license detail items here -->

      </div>
    </div>
  </div>
</body>
</html>
<?php /**PATH C:\Users\Cole\Desktop\stts\resources\views/reports/form_sr4_report.blade.php ENDPATH**/ ?>