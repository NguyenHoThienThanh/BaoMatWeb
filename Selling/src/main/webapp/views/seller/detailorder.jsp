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
	<%@ include file="/common/manager/header.jsp"%>
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
								<a href="listorder"
									class="list-group-item list-group-item-action">Tất cả</a> <a
									href="#" class="list-group-item list-group-item-action">Đơn
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
								<a href="listproduct"
									class="list-group-item list-group-item-action">Tất cả</a> <a
									href="#" class="list-group-item list-group-item-action">Thêm
									sản phẩm</a> <a href="#"
									class="list-group-item list-group-item-action">Sản phẩm và
									vi phạm</a> <a href="#"
									class="list-group-item list-group-item-action">Cài đặt sản
									phẩm</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9 mt-3">
				<div class="card">
					<div class="card-header">Thông tin Order Seller</div>
					<div class="card-body">
						<form action="updateorderSeller" method="post">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="orderId">Order ID</label> <input type="text"
												class="form-control" id="orderId" name="orderId"
												value="${i.orderID}" placeholder="Enter Order ID" readonly>
										</div>
										<div class="form-group">
											<label for="orderValue">Order Value</label> <input
												type="text" class="form-control" id="orderValue"
												name="orderValue" value="${i.orderValue}"
												placeholder="Enter Order Value" readonly>
										</div>
										<div class="form-group">
											<label for="orderDate">Order Date</label> <input type="text"
												class="form-control" id="orderDate" name="orderDate"
												value="${i.orderDate}" placeholder="Enter Order Date"
												readonly>
										</div>
										<div class="form-group">
											<label for="cardId">Card ID</label> <input type="text"
												class="form-control" id="cardId" name="cardId"
												value="${i.cartID}" placeholder="Enter Card ID" readonly>
										</div>
										<div class="form-group">
											<label for="customerId">Customer ID</label> <input
												type="text" class="form-control" id="customerId"
												name="customerId" value="${i.customerID}"
												placeholder="Enter Customer ID" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paymentStatus">Payment Status</label> <input
												type="text" class="form-control" id="paymentStatus"
												name="paymentStatus" placeholder="Enter Payment Status"
												value="${i.paymentStatus}" readonly>
										</div>
										<div class="form-group">
											<label for="orderStatus">Order Status</label> <select
												class="form-control" id="orderStatus" name="orderStatus">
												<option value="${i.orderStatus} selected">${i.orderStatus}</option>
												<option value="Chưa giao cho shipper">Chưa giao cho
													shipper</option>
												<option value="Đã giao cho shipper">Đã giao cho
													shipper</option>
												<option value="Đã giao khách hàng">Đã giao khách
													hàng</option>
											</select>
										</div>
										<div class="form-group">
											<label for="paymentMethod">Payment Method</label> <input
												type="text" class="form-control" id="paymentMethod"
												name="paymentMethod" placeholder="Enter Payment Method"
												value="${i.paymentMethod}" readonly>
										</div>
										<div class="form-group">
											<label for="deliveryMethod">Delivery Method</label> <input
												type="text" class="form-control" id="deliveryMethod"
												name="deliveryMethod" placeholder="Enter Delivery Method"
												value="${i.deliveryMethod}" readonly>
										</div>
										<div class="form-group">
											<label for="employeeId">Employee ID</label> <input
												type="text" class="form-control" id="employeeId"
												name="employeeId" value="${i.employeeId}"
												placeholder="Enter Employee ID" readonly>
										</div>
									</div>
									<div class="text-center mt-3">
										<button type="submit" class="btn btn-primary">
											submit
										</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
			<%@ include file="/common/manager/footer.jsp"%>
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
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<script
				src="${pageContext.request.contextPath}/templates/seller/js/index.js"></script>
</body>
</html>