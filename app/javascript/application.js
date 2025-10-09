// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const ctx = document.getElementById('myChart');
const amountSold = ctx.dataset.amountSold

console.log(JSON.parse(amountSold))
console.log(ctx);


new Chart(ctx, {
  type: 'line',
  data: {
    labels: Object.keys(amountSold),
    datasets: [{
      label: '# of sales',
      data: Object.values(amountSold),
      borderColor: 'rgba(75, 192, 192, 1)', // teal line
      backgroundColor: 'rgba(75, 192, 192, 0.2)', // light fill under line
      borderWidth: 2,
      fill: true, // fill area under line
      tension: 0.3 // curve the line a bit
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
