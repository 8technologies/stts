@php
use App\Models\Utils;
@endphp

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

  @media print {
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
    @isset($_SERVER['HTTP_REFERER'])
      <a href="{{ $_SERVER['HTTP_REFERER'] }}" class="print-button btn btn-secondary btn-sm">
        <i class="fa fa-chevron-left"></i> HOME
      </a>
    @endisset
    <a href="{{ admin_url('form-sr6s/' . $form->id . '/edit') }}" class="print-button btn btn-warning btn-sm">
      <i class="fa fa-edit"></i> EDIT
    </a>
    <a href="#" onclick="window.print();return false;" class="print-button btn btn-primary btn-sm">
      <i class="fa fa-print"></i> PRINT
    </a>
  </div>
  <div class="header">
    <img src="{{ asset('assets/images/maaif.png') }}" alt="Header Image" width="450" height="95">
  </div>
  <div class="card">
    
    <div class="details-container">      
      <div class="details-column">     
        <h3 class="text-uppercase h4 p-0 m-0"><b>COMPANY DETAILS</b></h3>
        <hr class="my-1 my-md-3">
        <div class="border border-1 rounded bg-">
                @if($form->receipt == null)
                    <img class="img-fluid" src="{{ asset('assets/images/avatar/04.jpg') }}" width="200" height="200">
                @else
                <img class="img-fluid" src="{{ asset('uploads/' . $form->receipt) }}" width="200" height="200">
                @endif
        </div>
        <hr class="my-1 my-md-3">
        @include('components.detail-item', [
            't' => 'Application Category',
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


        <!-- Include other company detail items here -->

      </div>
      <div class="details-column">
        <h3 class="text-uppercase h4 p-0 m-0"><b>LICENSE DETAILS</b></h3>
        <hr class="my-1 my-md-3">

        @include('components.detail-item', [
            't' => 'Grower number',
            's' => $form->grower_number,
        ])


        @include('components.detail-item', [
            't' => 'Crops',
            's' => $form->form_sr6_has_crops ? $form->form_sr6_has_crops->pluck('crops.name')->implode(', ') : "None",
        ])

        @include('components.detail-item', [
            't' => 'Land histroy',
            's' => $form->cropping_histroy,
        ])

        
        @include('components.detail-item', [
            't' => 'Have adequate isolation',
            's' => $form->have_adequate_isolation ? "Yes" : "No",
        ])

        
@include('components.detail-item', [
    't' => 'Aware of minimum standards',
    's' => $form->aware_of_minimum_standards ? "Yes" : "No",
])

        @if($form->have_adequate_land == 1)
        @include('components.detail-item', [
                't' => 'Have adequate land', 
                's' => 'Yes',
                ])
        @elseif($form->have_adequate_land == 2)
        @include('components.detail-item', [
                't' => 'Land size', 
                's' => 'N/A',
                ])
        @else
        @include('components.detail-item', [
                't' => 'Land size', 
                's' => 'No',
                ])
        @endif

        @if($form->have_adequate_storage == 1)
        @include('components.detail-item', [
                't' => 'Have adequate storage', 
                's' => 'Yes',
                ])
        @elseif($form->have_adequate_storage == 2)
        @include('components.detail-item', [
                't' => 'Have adequate storage', 
                's' => 'N/A',
                ])
        @else
        @include('components.detail-item', [
                't' => 'have adequate storage', 
                's' => 'No',
                ])
        @endif

        @if($form->have_adequate_equipment == 1)
        @include('components.detail-item', [
                't' => 'Have adequate equipment', 
                's' => 'Yes',
                ])
        @elseif($form->have_adequate_equipment == 2)
        @include('components.detail-item', [
                't' => 'Have adequate equipment', 
                's' => 'N/A',
                ])
        @else
        @include('components.detail-item', [
                't' => 'have adequate equipment', 
                's' => 'No',
                ])
        @endif

        @if($form->eqipment != null)
        @include('components.detail-item', [
                't' => 'Equipment',
                's' => $form->eqipment,
            ])
        @endif

        @if($form->have_contractual_agreement == 1)
        @include('components.detail-item', [
                't' => 'Have contractual agreement', 
                's' => 'Yes',
                ])
        @elseif($form->have_contractual_agreement == 2)
        @include('components.detail-item', [
                't' => 'Have contractual agreement', 
                's' => 'N/A',
                ])
        @else
        @include('components.detail-item', [
                't' => 'have contractual agreement', 
                's' => 'No',
                ])
        @endif

        @if($form->have_adequate_field_officers == 1)
        @include('components.detail-item', [
                't' => 'Have adequate field officers', 
                's' => 'Yes',
                ])
        @elseif($form->have_adequate_field_officers == 2)
        @include('components.detail-item', [
                't' => 'Have adequate field officers', 
                's' => 'N/A',
                ])
        @else
        @include('components.detail-item', [
                't' => 'have adequate field officers', 
                's' => 'No',
                ])
        @endif

        @if($form->have_conversant_seed_matters == 1)
        @include('components.detail-item', [
                't' => 'Have conversant seed matters', 
                's' => 'Yes',
                ])
        @elseif($form->have_conversant_seed_matters == 2)
        @include('components.detail-item', [
                't' => 'Have conversant seed matters', 
                's' => 'N/A',
                ])
        @else
        @include('components.detail-item', [
                't' => 'have conversant seed matters', 
                's' => 'No',
                ])
        @endif

        
            @include('components.detail-item', [
                't' => 'source of seed',
                's' => $form->souce_of_seed,
            ])

            @if($form->have_adequate_land_for_production == 1)
            @include('components.detail-item', [
                    't' => 'Have adequate land for production', 
                    's' => 'Yes',
                    ])
            @elseif($form->have_adequate_land_for_production == 2)
            @include('components.detail-item', [
                    't' => 'Have adequate land for production', 
                    's' => 'N/A',
                    ])
            @else
            @include('components.detail-item', [
                    't' => 'have adequate land for production', 
                    's' => 'No',
                    ])
            @endif

            @if($form->have_internal_quality_program == 1)
            @include('components.detail-item', [
                    't' => 'Have internal quality program', 
                    's' => 'Yes',
                    ])
            @elseif($form->have_internal_quality_program == 2)
            @include('components.detail-item', [
                    't' => 'Have internal quality program', 
                    's' => 'N/A',
                    ])
            @else
            @include('components.detail-item', [
                    't' => 'have internal quality program', 
                    's' => 'No',
                    ])
            @endif
          
            @include('components.detail-item', [
                't' => 'validity',
                's' => $form->valid_from.' to '.$form->valid_until,
            ])

            @if($form->status != null)
            @include('components.detail-item', [
                't' => 'status',
                's' => Utils::tell_status($form->status),
            ])
            @endif
            
            @include('components.detail-item', [
                't' => 'status comment',
                's' => $form->status_comment,
            ])


        <!-- Include other license detail items here -->

      </div>
    </div>
  </div>
</body>
</html>
