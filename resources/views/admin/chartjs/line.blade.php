<div class="chart-container">

<canvas id="line" style="width: 100%;"></canvas>
<script>
    
$(function () {

    function randomScalingFactor() {
        return Math.floor(Math.random() * 10)
    }

    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)',
        ccc: '#318db4',
        ggreen: '#008140'
    };

    var config = {
        type: 'line',
        data: {
            labels: [
                'Stock examination', 
                'My Stock', 
                'Marketable seed'
            ],
            datasets: [{
                label: 'Stock examination',
                backgroundColor: window.chartColors.ggreen,
                borderColor: window.chartColors.ggreen,
                data: [
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ],
                fill: false,
                backgroundColor: [
                    window.chartColors.ggreen
                ],
            }, {
                label: 'My Stock',
                fill: false,
                backgroundColor: window.chartColors.orange,
                borderColor: window.chartColors.orange,
                data: [
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ] ,
                backgroundColor: [
                    window.chartColors.orange,
                ],
            }, {
                label: 'Marketable seed\n',
                fill: false,
                backgroundColor: window.chartColors.red,
                borderColor: window.chartColors.red,
                data: [
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]  ,
                backgroundColor: [
                    window.chartColors.red,
                ],
            }]
        },
        options: {
            responsive: true,
            title: {
                display: false,
                text: 'Seed Stock Line Chart'
            },
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Seed Stock'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Value'
                    }
                }]
            }
        }
    };

    var ctx = document.getElementById('line').getContext('2d');
    new Chart(ctx, config);
});
</script>

</div>
