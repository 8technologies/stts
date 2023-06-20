<!DOCTYPE html>
<html>
<head>
  <title>Report with Print Button</title>
  <style>
    .card {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin: 20px;
      width: 95%;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    @media print {
      .print-button {
        display: none;
      }
    }
    .form_buttons {
        text-align: right;
    }
    
  </style>
</head>
<body>
<div class="form_buttons mt-3 mt-md-0">
            @isset($_SERVER['HTTP_REFERER'])
                <a href="{{ $_SERVER['HTTP_REFERER'] }}" class=" print-button btn btn-secondary btn-sm"><i class="fa fa-chevron-left"></i>
                    BACK
                    TO ALL LIST</a>
            @endisset
            <a href="{{ admin_url('form-sr4s/' . $form->id . '/edit') }}" class=" print-button btn btn-warning btn-sm"><i class="fa fa-edit"></i>
                EDIT</a>
            <a href="#" onclick="window.print();return false;" class="print-button btn btn-primary btn-sm"><i
                    class="fa fa-print"></i> PRINT</a>
</div>
        
  <div class="card">
    
            <h3 class="text-uppercase h4 p-0 m-0"><b>COMPANY DETAILS</b></h3>
            <hr class="my-1 my-md-3">

            @include('components.detail-item', [
                't' => 'application Category',
                's' => $form->type,
            ])

            @include('components.detail-item', [
                't' => 'Seed board registration numbe', 
                's' => $form->seed_board_registration_number,
                ])

            @include('components.detail-item', [
                't' => 'Name of applicant',
                's' => $form->name_of_applicant,
            ])
            @include('components.detail-item', [
                't' => 'Address',
                's' => $form->address,
            ])
            @include('components.detail-item', [
                't' => 'company initials',
                's' => $form->company_initials,
            ])

            @include('components.detail-item', [
                't' => 'Premises location',
                's' => $form->premises_location,
            ])

            @include('components.detail-item', [
                't' => 'Experience in',
                's' => $form->expirience_in,
            ])
            @include('components.detail-item', [
                't' => 'years of experience',
                's' => $form->years_of_expirience,
            ])

            <hr class="my-1 my-md-3">
            <h3 class="text-uppercase h4 p-0 m-0"><b>LICENSE DETAILS</b></h3>
            <hr class="my-1 my-md-3">

            @include('components.detail-item', [
                't' => 'application Category',
                's' => $form->type,
            ])

            @include('components.detail-item', [
                't' => 'Seed board registration numbe', 
                's' => $form->seed_board_registration_number,
                ])

            @include('components.detail-item', [
                't' => 'Name of applicant',
                's' => $form->name_of_applicant,
            ])
            @include('components.detail-item', [
                't' => 'Address',
                's' => $form->address,
            ])
            @include('components.detail-item', [
                't' => 'company initials',
                's' => $form->company_initials,
            ])

            @include('components.detail-item', [
                't' => 'Premises location',
                's' => $form->premises_location,
            ])

            @include('components.detail-item', [
                't' => 'Experience in',
                's' => $form->expirience_in,
            ])
            @include('components.detail-item', [
                't' => 'years of experience',
                's' => $form->years_of_expirience,
            ])


    
  </div>
</body>
</html>
