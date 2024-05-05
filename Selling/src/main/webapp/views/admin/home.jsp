<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin</title>
<!--FONTAWESOME-->
<link
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css"
	rel="stylesheet" type="text/css" />

<!--FONT GOOGLE-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;600;700&dsplay=swap"
	rel="stylesheet">

<!--MAIN CSS-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script src="js/admin.js"></script>
</head>
<body>

	<div class="d-flex mt-4">
		<div
			style="margin-left: 50px; margin-right: 50px; border-right: 1px solid #b7bbbf;"
			class="col-2">
			<ul
				class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
				id="menu">
				<li class="nav-item"><a href="home"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="fal fas fa-home" style="color: #7097db; font-size: 30px"></i>
						<span class="d-none d-sm-inline" style="margin-left: 10px;">Trang
							chủ</span>
				</a></li>

				<li><a href="listuser"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="fal fas fa-users" style="color: #c77070; font-size: 30px"></i>
						<span class="d-none d-sm-inline"
						style="margin-left: 9px; color: #212529">Khách hàng</span>
				</a></li>

				<li><a href="listseller"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="far fas fa-user" style="color: #178254; font-size: 30px;"></i>
						<span class="d-none d-sm-inline"
						style="margin-left: 19px; color: #212529">Nhân Viên</span>
				</a></li>

				<li><a href="listshipper"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="fal fas fa-shipping-fast"
						style="color: #592731; font-size: 30px;"></i> <span
						class="d-none d-sm-inline"
						style="margin-left: 9px; color: #212529">Shipper</span>
				</a></li>
			</ul>
		</div>
		<div class="col-11">
			<div class="col-lg-9 mt-3">
				<!-- Content Row -->
				<div class="row">

					<!-- thong ke-->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-primary text-uppercase mb-1">
											Doanh Thu Hàng Tháng</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${earningmonthly}
											VNĐ</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-calendar fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-success shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-success text-uppercase mb-1">
											Doanh Thu Hàng Năm</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${earningannual}
											VNĐ</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-success shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-danger text-uppercase mb-1">
											Tổng Giá Trị Đơn Hàng</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${totalearning}
											VNĐ</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-box fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Pending Requests Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-warning shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-warning text-uppercase mb-1">
											Đang chuẩn bị hàng</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${orderrequest}</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-comments fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Content Row -->

				<div class="row">

					<!-- Area Chart -->
					<div class="col-xl-8 col-lg-7">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Earnings
									Overview</h6>
								<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-area">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<canvas id="myAreaChart" width="977" height="400"
										style="display: block; height: 320px; width: 782px;"
										class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>
					</div>

					<!-- Pie Chart -->
					<div class="col-xl-4 col-lg-5">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Revenue
									Sources</h6>
								<div class="dropdown no-arrow">
									<a class="dropdown-toggle" href="#" role="button"
										id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
										class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
									</a>
									<div
										class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
										aria-labelledby="dropdownMenuLink">
										<div class="dropdown-header">Dropdown Header:</div>
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<canvas id="myPieChart" width="447" height="306"
										style="display: block; height: 245px; width: 358px;"
										class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Content Row -->
				<div class="row">

					<!-- Content Column -->
					<div class="col-lg mb-4">

						<!-- Project Card Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Thông tin
									Hàng Hóa</h6>
							</div>
							<div class="card-body">
								<!-- Đây có thể là DataTable -->
								<table id="example" class="display" style="width: 100%">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011-04-25</td>
											<td>$320,800</td>
										</tr>
										<tr>
											<td>Garrett Winters</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011-07-25</td>
											<td>$170,750</td>
										</tr>
										<tr>
											<td>Ashton Cox</td>
											<td>Junior Technical Author</td>
											<td>San Francisco</td>
											<td>66</td>
											<td>2009-01-12</td>
											<td>$86,000</td>
										</tr>
										<tr>
											<td>Cedric Kelly</td>
											<td>Senior Javascript Developer</td>
											<td>Edinburgh</td>
											<td>22</td>
											<td>2012-03-29</td>
											<td>$433,060</td>
										</tr>
										<tr>
											<td>Airi Satou</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>33</td>
											<td>2008-11-28</td>
											<td>$162,700</td>
										</tr>
										<tr>
											<td>Brielle Williamson</td>
											<td>Integration Specialist</td>
											<td>New York</td>
											<td>61</td>
											<td>2012-12-02</td>
											<td>$372,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<script src="<c:url value='/templates/seller/jsjquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/templates/seller/jsjquery.min.js'/>"></script>
	<script src="<c:url value='/templates/seller/jsjszip.min.js'/>"></script>
	<script src="<c:url value='/templates/seller/jspdfmake.min.js'/>"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%-- 	<script
		src="${pageContext.request.contextPath}/templates/seller/js/index.js"></script> --%>
	<script>
	$(document).ready(function() {
	    $('#example').dataTable( {
	        "pageLength": 3,
	        "lengthMenu": [ 3, 10, 25, 50, 100 ]
	    } );
	});
	 function createChart(statistisData) {
		 	var revenueJSON = decodeURIComponent('<c:out value="${revenueJSON}" />');
		 	var revenue = JSON.parse(revenueJSON)
		 
		    // Get the canvas element
		    let ctx = document.getElementById('myAreaChart').getContext('2d');
		   
		    // Sample data
		    let data = {
		        labels: ['Jan', 'Feb', 'March', 'April', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		        datasets: [{
		            label: 'My Data',
		            backgroundColor: 'rgba(75,192,192,0.4)',
		            borderColor: 'rgba(75,192,192,1)',
		            borderWidth: 1,
		            data: [...revenue]
		        }]
		    };

		    // Chart options
		    let options = {
		        responsive: true,
		        maintainAspectRatio: false
		    };

		    // Create the area chart
		    let myAreaChart = new Chart(ctx, {
		        type: 'line',
		        data: data,
		        options: options
		    });
		}
	// JavaScript code to set up the chart
	document.addEventListener('DOMContentLoaded',function() {
		createChart(JSON.parse('[10, 20, 15, 25, 30, 45, 75, 55, 100, 66, 47, 78]'));
	});

	$(document).ready(function () {
	    // Sample data
	    let data = {
	        labels: ['Asia', 'North America', 'EU', 'Australia'],
	        datasets: [{
	            data: [300, 150, 100, 220],
	            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#D7F9F9'],
	            hoverOffset: 4
	        }]
	    };

	    // Chart options
	    let options = {
	        responsive: true,
	        maintainAspectRatio: false,
	    };

	    // Get the canvas element
	    let ctx = document.getElementById('myPieChart').getContext('2d');

	    // Create the pie chart
	    let myPieChart = new Chart(ctx, {
	        type: 'pie',
	        data: data,
	        options: options
	    });
	});
</script>

</body>
</html>