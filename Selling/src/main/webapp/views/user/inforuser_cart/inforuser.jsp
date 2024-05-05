<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin người dùng</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/user/css/style.css">

</head>
<body>

	<link href='<c:url value="/templates/user/css/style.css"/>'
		rel="stylesheet" type="text/css">
	<!-- content -->
	<div class="container">
		<div class="user__list" style="margin-top: 35px;">
			<ul class="list-group">
				<a style="text-decoration: none;" href="editInfor">
					<li
					class="list-group-item list-group-item-action list-group-item-primary"><i
						class="fas fa-user"></i>Tài khoản của tôi</li>
				</a>
				<a style="text-decoration: none;" href="mypurchase">
				<li
					class="list-group-item list-group-item-action list-group-item-secondary"><i
					class="fas fa-shopping-cart"></i>Đơn mua</li>
				</a>

				<li
					class="list-group-item list-group-item-action list-group-item-success"><i
					class="fas fa-bell"></i> Thông báo</li>

				<a style="text-decoration: none;" href="findCartByCartID"><li
					class="list-group-item list-group-item-action list-group-item-primary"><i
						class="fas fa-gift"></i>Giỏ hàng</li> </a>
				<li
					class="list-group-item list-group-item-action list-group-item-danger"><i
					class="fas fa-gift"></i>Kho Voucher</li>
			</ul>

		</div>
		<div class="user-details">
			<div class="user-details-title">
				<h1>Hồ sơ của tôi</h1>
			</div>
			<div class="user-details-content">
				<div class="user-details-left">
					<form action="updateuser" method="post">
						<div class="row mb-3">
							<label for="inputPassword3" class="col-sm-2 col-form-label">Tên</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputtext3"
									name="customerName" value="${customer.customerName}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail3"
									name="mail" value="${customer.mail}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputAddress" class="col-sm-2 col-form-label">Địa
								chỉ</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputAddress"
									name="address" value="${customer.address}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputPassword3" class="col-sm-2 col-form-label">Số
								điện thoại</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="inputphone3"
									name="phone" value="${customer.phone}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputBirthdate" class="col-sm-2 col-form-label">Ngày
								tháng năm sinh</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="inputBirthdate"
									name="birthday" value="${customer.birthday}">
							</div>
						</div>

						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">Giới tính</legend>
							<div class="col-sm-10">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="gridRadios1" value="Nam" ${customer.gender == 'Nam' ? 'checked' : ''}> <label
										class="form-check-label" for="gridRadios1">Nam</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="gridRadios2" value="Nữ" ${customer.gender == 'Nữ' ? 'checked' : ''}> <label
										class="form-check-label" for="gridRadios2">Nữ</label>
								</div>
							</div>

						</fieldset>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-outline-primary">Submit</button>
						</div>

					</form>
				</div>
				<div class="user-details-right">
					<div class="user-details-right-img">
						<img
							src="data:image/png;base64,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"
							alt="ảnh hồ sơ">
						<button type="button" class="btn btn-outline-primary">Chọn
							ảnh</button>
					</div>

				</div>
			</div>


		</div>

	</div>

	<!-- end content -->


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
		
	<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
		crossorigin="anonymous"
		></script>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
		integrity="sha512-TPh2Oxlg1zp+kz3nFA0C5vVC6leG/6mm1z9+mA81MI5eaUVqasPLO8Cuk4gMF4gUfP5etR73rgU/8PNMsSesoQ==" 
		crossorigin="anonymous"
		allowed-origin="*"></script> -->
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js" integrity="sha512-TPh2Oxlg1zp+kz3nFA0C5vVC6leG/6mm1z9+mA81MI5eaUVqasPLO8Cuk4gMF4gUfP5etR73rgU/8PNMsSesoQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


		
</body>
</html>
