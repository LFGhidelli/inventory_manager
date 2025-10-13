// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

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

const revenue_chart = document.getElementById('revenueChart');
const revenue = JSON.parse(revenue_chart.dataset.revenue)

const revenue_labels = Object.keys(revenue).map(dateStr => {
  const date = new Date(dateStr);
  return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
});

new Chart(revenue_chart, {
  type: 'bar',
  data: {
    labels: revenue_labels,
    datasets: [{
      label: 'Number of sales',
      data: Object.values(revenue),
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
