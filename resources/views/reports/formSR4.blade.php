<?php
$link = public_path('css/bootstrap-print.css');
$form = App\Models\formSr4::find($_GET['id']);

$date = date("j F Y");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Report Card</title>
    <style>
        .card {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 400px;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
        }
        table td {
            padding: 5px;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Report Card</h1>
        <table>
            <tr>
                <td><strong>Serial No.</strong></td>
                <td>15(1)</td>
            </tr>
            <tr>
                <td><strong>Registration Number</strong></td>
                <td>{{ $form->seed_board_registration_number }}</td>
            </tr>
            <tr>
                <td><strong>For the year</strong></td>
                <td>{{ $form->valid_from }}</td>
            </tr>
            <tr>
                <td><strong>Until the year</strong></td>
                <td>{{ $form->valid_until }}</td>
            </tr>
            <tr>
                <td><strong>Company</strong></td>
                <td>{{ $form->company_initials }}</td>
            </tr>
            <tr>
                <td><strong>Address</strong></td>
                <td>{{ $form->address }}</td>
            </tr>
            <tr>
                <td><strong>Tel No</strong></td>
                <td>{{ $form->phone_number }}</td>
            </tr>
            <tr>
                <td><strong>Location of premises</strong></td>
                <td>{{ $form->premises_location }}</td>
            </tr>
            <tr>
                <td><strong>For the category of</strong></td>
                <td>{{ $form->marketing_of }}</td>
               
            </tr>
        </table>
    </div>
</body>
</html>
