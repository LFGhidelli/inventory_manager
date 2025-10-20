const revenue_chart = document.getElementById('revenueChart');
const revenue = JSON.parse(revenue_chart.dataset.revenue)

const revenue_labels = Object.keys(revenue).map(dateStr => {
  const date = new Date(dateStr);
  return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
});

new Chart(revenue_chart, {
  type: 'line',
  data: {
    labels: revenue_labels,
    datasets: [{
      label: 'Number of sales',
      data: Object.values(revenue),
      borderColor: 'rgba(255, 127, 102, 1)',
      backgroundColor: 'rgba(255, 127, 102, 0.2)',
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
