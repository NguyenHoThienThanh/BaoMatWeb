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

<style>
.btn {
	display: inline-block;
	padding: 10px 20px;
	text-decoration: none;
	transition: background-color 0.3s ease;
	text-align: center;
	width: 100%;
}
.btn:hover {
	background-color: #333;
	color: #fff;
}
</style>
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
									href="insertpro" class="list-group-item list-group-item-action">Thêm
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
					<div class="card-body" style="width: 100%">
						<!-- Đây có thể là DataTable -->
						<table id="example" class="display" style="width: 100%">
							<thead>
								<tr>
									<th>Product Id</th>
									<th>Product Name</th>
									<th>Description</th>
									<th>Stock</th>
									<th>Amount</th>
									<th>Price</th>
									<th>Category Id</th>
									<th>ImageURL</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${list}">
									<tr>
										<td>${i.productId}</td>
										<td>${i.productName}</td>
										<td>${i.description}</td>
										<td>${i.stock}</td>
										<td>${i.amount}</td>
										<td>${i.price}</td>
										<td>${i.categoryId}</td>
										<td><img src="${i.imageURL}" alt="${i.productName}"
											width="100px" height="100px" /></td>
										<td><a
											href='<c:url value="/seller/updatepro?id=${i.productId}"/>'
											class="btn btn-success">Update</a> <a
											href='<c:url value="/seller/deletepro?id=${i.productId}"/>'
											class="btn btn-danger">Delete</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
<!-- 		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script> -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
			integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script
			src="${pageContext.request.contextPath}/templates/seller/js/index.js"></script>
</body>
</html>