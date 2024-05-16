<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/html5-qrcode@0.4.0/dist/html5-qrcode.min.js"></script>
    <style>
        .details {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">{{ __('Please enter a lot number') }}</div>

                    <div class="panel-body">
                        <form id="myform" method="POST">
                            {{ csrf_field() }}
                            <div class="input-group">
                                <input type="text" name="lot_number" id="lot_number" class="form-control" placeholder="Enter lot number">
                            </div>
                                <div class="button-container">
                                <button type="button" class="btn btn-primary mt-3" data-toggle="modal"
                                    data-target="#trackModal" onclick="openModal('trackModal')">Track</button>
                                <button type="button" class="btn btn-primary mt-3" data-toggle="modal"
                                    data-target="#traceModal" onclick="openModal('traceModal')">Trace</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/html5-qrcode/dist/html5-qrcode.min.js"></script>
        <script>
           
            let selectedModal;

            function openModal(modal) {
        
                // Determine which modal to open based on the selected button
                if (modal === "traceModal") {
                 console.log('hi im tracking');
                    // Submit to track endpoint and load data into the modal
                  // Send the AJAX request
                    $.ajax({
                    url: "/trace", 
                    type: "POST",
                    data: new FormData($("#myform")[0]), 
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        // Handle the response from the backend
                        console.log(response);

                        // Access and use the returned data  
                       
                        document.getElementById("crop").textContent = response.crop;
                        document.getElementById("crop_variety").textContent = response.crop_variety;
                        document.getElementById("seed_class").textContent = response.seed_class;
                        document.getElementById("lab_test_number").textContent = response.lab_test_number;
                        document.getElementById("lot_number2").textContent = response.lot_number;
                        document.getElementById("mother_lot").textContent = response.mother_lot;
                        document.getElementById("germination_capacity").textContent = response.germination_capacity;
                        document.getElementById("purity").textContent= response.purity;
                        document.getElementById("p_x_g").textContent = response.p_x_g;
                        document.getElementById("testing_methods").textContent = response.testing_methods;
                        document.getElementById("moisture").textContent = response.moisture;

                        var timestamp = response.test_date;
                        var date = new Date(timestamp);

                        // Get the individual components of the date
                        var year = date.getFullYear();
                        var month = date.getMonth() + 1
                        var day = date.getDate();

                        var dateString = year + "-" + month + "-" + day;

                        document.getElementById("test_date").textContent = dateString;


                        if (response.report_recommendation == 11) {
                            document.getElementById("status").textContent = "Marketable";
                        } else {
                            document.getElementById("status").textContent = "Not Marketable";
                        }
                        document.getElementById("test").textContent = response.tests_required;
                    },
                    error: function(error) {
                        // Handle the error
                        console.error(error);
                    }
                });


                } else if (modal === "trackModal") {
                console.log('hi im tracing');
                    // Submit to track endpoint and load data into the modal
                    lot_number = new FormData($("#myform")[0]);
                    $.ajax({
                        url: "/track", 
                        type: "POST",
                        data: lot_number, 
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            // Handle the response from the backend and populate the modal
                            console.log(response);
                            var lot_number = $("#lot_number").val(); 
                            var tableHTML = "<table>";
                        
                            tableHTML += "<tbody>";
                            
                            response.forEach(function(item) {
                                tableHTML += "<tr>";
                                tableHTML += "<td>"+ lot_number + "</td>";
                                tableHTML += "<td><a href='https://stts.8technologies.cloud/admin/seed-labs/" + item.id + "' onclick='closeModalAndRedirect(this)' data-dismiss='modal'>" + item.lot_number + "</a></td>";

                                tableHTML += "</tr>";
                            });
                            
                            tableHTML += "</tbody></table>";
                            
                            document.getElementById("trace_result-container").innerHTML = tableHTML;
                        },
                            
                        error: function(error) {
                            // Handle the error
                            console.error(error);
                        }
                    });
                }
            }
            function closeModalAndRedirect(link) {
                window.location.href = link.href; // Redirect to the link
            }

      
        </script>

    </div>

    <!-- Trace Modal -->
    <div class="modal fade" id="traceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <!-- Trace Modal content goes here -->
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Batch details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">Seed Details</a></li>
                        <li><a data-toggle="tab" href="#profile">Seed Lab Details</a></li>
                        <li><a data-toggle="tab" href="#contact">Mother Lot</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <div class="card">
                                <div class="card-body">

                                    <div class="details">
                                        <strong>Crop:</strong>
                                        <p class="text-muted" id="crop"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Crop Variety:</strong>
                                        <p class="text-muted" id="crop_variety"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Seed Class:</strong>
                                        <p class="text-muted" id="seed_class"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Lot Number:</strong>
                                        <p class="text-muted" id="lot_number2"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="profile">
                            <div class="card">
                                <div class="card-body">
                                    <div class="details">
                                        <strong>Lab Test Number:</strong>
                                        <p class="text-muted" id="lab_test_number"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Germination capacity:</strong>
                                        <p class="text-muted" id="germination_capacity"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Purity:</strong>
                                        <p class="text-muted" id="purity"></p>
                                    </div>
                                    <div class="details">
                                        <strong>P_x_G:</strong>
                                        <p class="text-muted" id="p_x_g"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Testing Method:</strong>
                                        <p class="text-muted" id="testing_methods"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Moisture content:</strong>
                                        <p class="text-muted" id="moisture"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Test date:</strong>
                                        <p class="text-muted" id="test_date"></p>
                                    </div>
                                    <div class="details">
                                        <strong>Status:</strong>
                                        <p class="text-muted" id="status"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="contact">
                            <div class="card">
                                <div class="card-body">
                                    <div class="details">
                                        <strong>Mother Lot:</strong>
                                        <p class="text-muted" id="mother_lot"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<!-- Track Modal -->
<div class="modal fade" id="trackModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Batch details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Mother Lot</th>
                            <th>Child Lot</th>
                        </tr>
                    </thead>
                    <tbody id="trace_result-container">
                        <!-- Table rows will be dynamically populated here -->
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


</body>

</html>


          