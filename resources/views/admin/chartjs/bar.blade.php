<canvas id="bar" style="width: 100%;"></canvas>
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

    var barChartData = {
        labels: [
            'Products', 
            'Orders', 
            'Pre-Orders', 
            'Quotations',
        ],
        datasets: [{
            label: 'Marketplace',
            borderWidth: 1,
            data: [
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor(),
                randomScalingFactor()
            ] ,
                backgroundColor: [
                    window.chartColors.ggreen,
                    window.chartColors.blue,
                    window.chartColors.purple,
                    window.chartColors.red,
                ],
        }]
    };

    var ctx = document.getElementById('bar').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: false,
                text: 'Chart.js Bar Chart'
            }
        }
    });
});
</script>