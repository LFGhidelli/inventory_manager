const ctx = document.getElementById('numberOfSales');
const amountSold = JSON.parse(ctx.dataset.amountSold)

const labels = Object.keys(amountSold).map(dateStr => {
  const date = new Date(dateStr);
  return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
});

new Chart(ctx, {
  type: 'bar',
  data: {
    labels: labels,
    datasets: [{
      label: 'Number of sales',
      data: Object.values(amountSold),
      borderColor: 'rgba(75, 192, 192, 1)',
      backgroundColor: 'rgba(75, 192, 192, 0.2)',
      borderWidth: 2,
      fill: true,
      tension: 0.2 // curve the line
    }]
  },
  options: {
    maintainAspectRatio: false,
    scales: {
      y: {
        beginAtZero: true,
        min: 0
      }
    }
  }
});
