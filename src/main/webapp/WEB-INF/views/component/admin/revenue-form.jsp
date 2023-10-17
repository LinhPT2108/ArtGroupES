<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<h2 class="text-primary fw-bold">Biểu đồ thống kê doanh thu</h2>

<canvas id="revenueDayChart"></canvas>
<div class="d-flex">
	<canvas class="w-50 h-50 m-3" id="revenueMonthChart"></canvas>
	<canvas class="w-50 h-50 m-3" id="revenueYearChart"></canvas>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(document).ready(
			function() {
				$.ajax({
					url : '/admin/statistical-revenue/daily-revenue',
					method : 'GET',
					success : function(response) {
						var data = {
							labels : response.labels,
							values : response.values
						}

						var ctx = document.getElementById('revenueDayChart')
								.getContext('2d');
						drawChart(data, ctx); // Vẽ biểu đồ với dữ liệu
					},

					error : function(error) {
						console.log(error);
					}
				});
				$.ajax({
					url : '/admin/statistical-revenue/monthly-revenue',
					method : 'GET',
					success : function(response) {
						var data = {
							labels : response.labels,
							values : response.values
						}

						var ctx = document.getElementById('revenueMonthChart')
								.getContext('2d');
						drawChart(data, ctx); // Vẽ biểu đồ với dữ liệu
					},

					error : function(error) {
						console.log(error);
					}
				});
				$.ajax({
					url : '/admin/statistical-revenue/yearly-revenue',
					method : 'GET',
					success : function(response) {
						var data = {
							labels : response.labels,
							values : response.values
						}
						var ctx = document.getElementById('revenueYearChart')
								.getContext('2d');
						drawChart(data, ctx); // Vẽ biểu đồ với dữ liệu
					},

					error : function(error) {
						console.log(error);
					}
				});

				// Hàm vẽ biểu đồ
				function drawChart(data, ctx) {
					var revenueChart = new Chart(ctx, {
						type : 'bar',
						data : {
							labels : data.labels,
							datasets : [ {
								label : 'Doanh thu',
								data : data.values,
								backgroundColor : 'rgba(0, 123, 255, 0.5)',
								borderColor : 'rgba(0, 123, 255, 1)',
								borderWidth : 1
							} ]
						},
						options : {
							responsive : true,
							scales : {
								y : {
									beginAtZero : true
								}
							}
						}
					});
				}
			});
</script>



