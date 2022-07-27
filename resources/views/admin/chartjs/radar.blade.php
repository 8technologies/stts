<div class="chart-container">
<canvas id="radar-chart" height="100%" width="100%"></canvas>

<script>
    
$(function () {
  
new Chart(document.getElementById("radar-chart"), {
    type: 'radar',
    data: {
      labels: ["Accepted", "Halted", "Pending", "Rejected", "######"],
      datasets: [
        {
          label: "SR4",
          fill: true,
          backgroundColor: "#FFFFFF",
          borderColor: "rgba(179,181,198,1)",
          pointBorderColor: "#fff",
          pointBackgroundColor: "rgba(179,181,198,1)",
          data: [8.77,55.61,21.69,6.62,6.82]
        }, {
          label: "SR6",
          fill: true,
          backgroundColor: "#FFFFFF",
          borderColor: "rgba(255,99,132,1)",
          pointBorderColor: "#fff",
          pointBackgroundColor: "rgba(255,99,132,1)",
          pointBorderColor: "#fff",
          data: [25.48,54.16,7.61,8.06,4.45]
        }, {
          label: "SR10",
          fill: true,
          backgroundColor: "#FFFFFF",
          borderColor: "#008140",
          pointBorderColor: "#fff",
          pointBackgroundColor: "rgba(255,99,132,1)",
          pointBorderColor: "#fff",
          data: [15.48,53.16,43.61,8.06,4.45]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Radar on the status of the Forms'
      }
    }
});

});
</script>

</div>


