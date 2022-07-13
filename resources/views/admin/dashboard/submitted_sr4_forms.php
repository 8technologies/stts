<canvas id="chartSR4" style="width: 100%;"></canvas>
<script>

$(function () {
    var ctx = document.getElementById("chartSR4");

    var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        datasets: [
            {
            label: 'Chart 1',
            data: [{x: 11, y: 25}, {x: 32, y: 24}, {x: 63, y: 81},{x: 54, y: 16}],
            showLine: true,
            fill: false,
            borderColor: 'rgba(0, 200, 0, 1)'
            },
        {
            label: 'Chart 2',
            data: [{x: 45, y: 33}, {x: 13, y: 47}, {x: 45, y: 64}, {x: 36, y: 89}],
            showLine: true,
            fill: false,
            borderColor: 'rgba(200, 0, 0, 1)'
            },
        {
            label: 'Chart 3',
            data: [{x: 1, y: 83}, {x: 43, y: 64}, {x: 4, y: 76}, {x: 69, y: 59}],
            showLine: true,
            fill: false,
            borderColor: 'rgba(0, 200, 0, 1)'
            },
        {
            label: 'Chart 4',
            data: [{x: 1, y: 3}, {x: 3, y: 4}, {x: 4, y: 6}, {x: 6, y: 9}],
            showLine: true,
            fill: false,
            borderColor: 'rgba(200, 0, 0, 1)'
            },
        {
            label: 'Chart 5',
            data: [{x: 1, y: 3}, {x: 3, y: 4}, {x: 4, y: 6}, {x: 6, y: 9}],
            showLine: true,
            fill: false,
            borderColor: 'rgba(0, 200, 0, 1)'
            },
        ]
    },
    options: {
        tooltips: {
        mode: 'index',
        intersect: false,
        },
        hover: {
        mode: 'nearest',
        intersect: true
        },
        scales: {
        yAxes: [{
            ticks: {
            beginAtZero:true
            }
        }]
        },
    }
    });

});
</script>





