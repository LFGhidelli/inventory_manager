const chart_element = document.getElementById("productsByBrand");
const productsByBrand = JSON.parse(chart_element.dataset.productsBrand)

new Chart(chart_element, {
  type: 'doughnut',
  data: {
    labels: Object.keys(productsByBrand),
    datasets: [{
      data: Object.values(productsByBrand),
    borderColor: [
      'rgba(153, 102, 255, 1)',
      'rgba(255, 159, 64, 1)',
      'rgba(75, 192, 192, 1)',
      'rgba(255, 205, 86, 1)',
      'rgba(54, 162, 235, 1)',
      'rgba(255, 99, 132, 1)'
    ],
    backgroundColor: [
      'rgba(153, 102, 255, 0.2)',
      'rgba(255, 159, 64, 0.2)',
      'rgba(75, 192, 192, 0.2)',
      'rgba(255, 205, 86, 0.2)',
      'rgba(54, 162, 235, 0.2)',
      'rgba(255, 99, 132, 0.2)'
    ],
    hoverOffset: 4
    }]
  },
  options: {
    maintainAspectRatio: false,
  }
});
