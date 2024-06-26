<canvas id="bar-line" style="width: 100%;"></canvas>


<script>
$(function () {

    function randomScalingFactor() {
        return Math.floor(Math.random() * 1000)
    }

    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)'
    };

    var chartData = {
        labels: [
            'Import Permits',
            'Export Permits',
            'Planting Returns Company',
            'Planting Returns Grower',
            'Form SR10s',
            'Form QDS',
            'Total Seed Labs',
            'Seed Labels',
        ],
        datasets: [{
            type: 'line',
            label: 'Dataset 1',
            borderColor: window.chartColors.blue,
            borderWidth: 2,
            fill: false,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ]
        }, {
            type: 'bar',
            label: 'Dataset 2',
            backgroundColor: window.chartColors.red,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ],
            borderColor: 'white',
            borderWidth: 2
        }, {
            type: 'bar',
            label: 'Dataset 3',
            backgroundColor: window.chartColors.green,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ]
        }]

    };

    var ctx = document.getElementById('bar-line').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
            plugins: {
                legend: {
                    display: false,
                    position: 'left',
                }
            },
            responsive: true,
            title: {
                display: true,
                text: 'Chart.js Combo Bar Line Chart'
            },
            tooltips: {
                mode: 'index',
                intersect: true
            }
        }
    });
});
</script><?php /**PATH C:\Users\Cole\Desktop\8Projects\stts\resources\views/admin/chartjs/combo-bar-line.blade.php ENDPATH**/ ?>