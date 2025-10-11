// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const ctx = document.getElementById('myChart');
const amountSold = JSON.parse(ctx.dataset.amountSold)

new Chart(ctx, {
  type: 'bar',
  data: {
    labels: Object.keys(amountSold),
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
