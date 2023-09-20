<?php
$link = public_path('css/bootstrap-print.css');
$form = App\Models\formSr6::find($_GET['id']);

$date = date("j F Y");
?>
<!DOCTYPE html>
<html>
<head>
    <style>
      body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            border: 1px solid #ccc;
            padding: 30px; /* Increase padding for a larger card */
            border-radius: 10px;
            width: 400px; /* Increase width for a larger card */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        .card p {
            margin: 10px 0; /* Increase margin for more spacing between elements */
        }
    </style>
</head>
<body>

<div class="card">
    <p><strong>Serial No.</strong> regulation 19(4)</p>
    <p><strong>Name:</strong> {{ $form->name_of_applicant }}</p>
    <p><strong>Grower Number (GN):</strong> {{ $form->grower_number }}</p>
    <p><strong>Registration number (RN):</strong>{{ $form->registration_number }}</p>
    <p><strong>Postal Address:</strong> {{ $form->address }}</p>
    <p><strong>Tel No:</strong>{{ $form->phone_number }}</p>
    <p><strong>Location of the farm:</strong> {{ $form->premises_location }}</p>
    <p><strong>Validity date:</strong> from {{ $form->valid_from }} to {{ $form->valid_until }}</p>
</div>

</body>
</html>
