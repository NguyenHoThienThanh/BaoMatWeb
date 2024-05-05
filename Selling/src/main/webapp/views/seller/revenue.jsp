<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller</title>
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
</head>
<body>
	<div class="container-fluid">
		<!--Menu-->
		<div class="row">
			<div class="col-lg-2 border-end">
				<div class="card mt-4">
					<div class="card-header" data-bs-toggle="collapse"
						href="#collapseExample1">Quản lý đơn hàng</div>
					<div class="collapse" id="collapseExample1">
						<div class="card-body">
							<div class="list-group">
								<a href="listorder" class="list-group-item list-group-item-action">Tất
									cả</a> <a href="#" class="list-group-item list-group-item-action">Đơn
									hủy</a> <a href="#" class="list-group-item list-group-item-action">Hoàn
									tiền</a>
							</div>
						</div>
					</div>
				</div>
				<div class="card mt-3">
					<div class="card-header" data-bs-toggle="collapse"
						href="#collapseExample2">Quản lý sản phẩm</div>
					<div class="collapse" id="collapseExample2">
						<div class="card-body">
							<div class="list-group">
								<a href="listproduct" class="list-group-item list-group-item-action">Tất
									cả</a> 
									<a href='<c:url value="/seller/insertpro"/>' class="list-group-item list-group-item-action">Thêm
									sản phẩm</a>
									 <a href="#"
									class="list-group-item list-group-item-action">Sản phẩm và
									vi phạm</a> 
									<a href="#"
									class="list-group-item list-group-item-action">Cài đặt sản
									phẩm</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9 mt-3">
			
				<div id="content"></div>
				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">Doanh Thu</h1>
					<a href="#"
						class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
						class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
				</div>

				<!-- Content Row -->
				<div class="row">

					<!-- Earnings (Monthly) Card Example -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-primary text-uppercase mb-1">
											Earnings (Monthly)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${earningmonthly} VNĐ</div>
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
											Earnings (Annual)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${earningannual} VNĐ</div>
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
						<div class="card border-left-info shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
										</div>
										<div class="row no-gutters align-items-center">
											<div class="col-auto">
												<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width: 50%" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
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
											Pending Order</div>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script
		src="${pageContext.request.contextPath}/templates/seller/js/index.js"></script>
</body>
</html>