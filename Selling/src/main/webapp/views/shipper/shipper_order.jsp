<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglist.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link
	href="${pageContext.request.contextPath}/templates/shipper/css/main.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>


<body>
	<main>
		<div class="container d-flex content">
			<div class="d-block left-box"
				style="background-color: rgb(255, 255, 255); width: 180px; float: left;">
				<div class="info p-2 rounded ">
					<img class="image-info"
						src="https://2sao.vietnamnetjsc.vn/images/2021/04/05/14/45/IU.jpg">
					<div class="content-info">
						<div class="account">${shipper.employeeName}</div>
					</div>
				</div>
				<div class="d-flex align-items-start"
					style="padding-left: 25px; padding-top: 20px;">
					<div class="nav flex-column nav-pills me-3" id="v-pills-tab"
						role="tablist" aria-orientation="vertical"
						style="background-color: #fff;">

						<button class="nav-link active" id="v-pills-order-tab"
							data-bs-toggle="pill" data-bs-target="#v-pills-order"
							type="button" role="tab" aria-controls="v-pills-order"
							aria-selected="true">
							<i class="fa-solid fa-cart-shopping"></i> Đơn hàng
						</button>
						<button class="nav-link" id="v-pills-information-tab"
							data-bs-toggle="pill" data-bs-target="#v-pills-information"
							type="button" role="tab" aria-controls="v-pills-information"
							aria-selected="false">
							<i class="fa-solid fa-user"></i> Thông tin
						</button>
					</div>
				</div>
			</div>
			<div class="tab-content" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="v-pills-order"
					role="tabpanel" aria-labelledby="v-pills-order-tab" tabindex="0">
					<div class="container-fluid"
						style="background-color: #ffffff; margin-bottom: 20px;">
						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
							<li class="nav-item col" role="presentation">
								<button class="nav-link active" id="pills-home-tab"
									data-bs-toggle="pill" data-bs-target="#pills-home"
									type="button" role="tab" aria-controls="pills-home"
									aria-selected="true">Tất cả đơn hàng</button>
							</li>
							<li class="nav-item col" role="presentation">
								<button class="nav-link" id="pills-profile-tab"
									data-bs-toggle="pill" data-bs-target="#pills-profile"
									type="button" role="tab" aria-controls="pills-profile"
									aria-selected="false">Đã giao</button>
							</li>
							<li class="nav-item col" role="presentation">
								<button class="nav-link" id="pills-contact-tab"
									data-bs-toggle="pill" data-bs-target="#pills-contact"
									type="button" role="tab" aria-controls="pills-contact"
									aria-selected="false">Đang giao</button>
							</li>
						</ul>
						<!-- TẤT CẢ ĐƠN -->
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home"
								role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
								<c:forEach var="i" items="${listorder}">
									<div class="product">
										<div class="product-detail rounded d-flex">
											<div class="content-info ml-2">
												<div class="product-id" href="">
													<i class="fa-solid fa-qrcode"></i>Mã đơn hàng: ${i.orderID }
												</div>
												<div class="product-category">
													<i class="fa-solid fa-calendar-days"></i>Ngày đặt hàng:
													${i.orderDate}
												</div>
											</div>
											<div class="product-money text-center">
												<p>
													<i class="fa-solid fa-sack-dollar"></i>Thành tiền
												</p>
												<p style="color: rgb(36, 214, 158);">${i.orderValue}đ</p>
											</div>
										</div>
										<div class="product-address d-flex">
											<div class="content-info ml-2 mb-2 justify-content-between">
												<div class="address">
													<i class="fa-solid fa-location-dot"></i>Địa chỉ:
													${i.customer.address }
												</div>
												<div class="phone">
													<i class="fa-solid fa-phone"></i>Số điện thoại:
													${i.customer.phone }
												</div>
												<div class="name">
													<i class="fa-solid fa-file-signature"></i>Họ và tên:
													${i.customer.customerName }
												</div>
											</div>
											<div class="product-status text-center">
												<p>
													<i class="fa-solid fa-flag"></i>Trạng thái
												</p>
												<p style="color: rgb(19, 220, 39);">${i.paymentStatus }</p>
											</div>
										</div>
										<div class="product-button d-flex">
											<c:if test="${i.orderStatus == 'Đã giao khách hàng' }">
												<button type="button" class="btn btn-success d-flex"
													style="margin-left: 920px; margin-bottom: 20px;" disabled>
													<i class="fa-solid fa-check" style="padding-top: 5px;"></i>Đã
													giao
												</button>
											</c:if>
											<c:if test="${i.orderStatus == 'Ðã giao cho shipper' }">
												<button type="button" class="btn btn-warning d-flex"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													style="margin-left: 900px; margin-bottom: 20px;">
													<i class="fa-solid fa-truck-fast" style="padding-top: 5px;"></i>Đang
													giao
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
								<div class="row g-0 align-items-center pb-4">
									<div class="col-sm-11">
										<div class="float-sm-end">
											<ul class="pagination mb-sm-0">
												<c:if test="${page<=1 }">
													<li class="page-item disabled"><a
														href="home?page=${page - 1}" class="page-link"><i
															class="mdi mdi-chevron-left"></i></a></li>
												</c:if>
												<c:if test="${page>1 }">
													<li class="page-item"><a href="home?page=${page - 1}"
														class="page-link"><i class="mdi mdi-chevron-left"></i></a></li>
												</c:if>
												<c:forEach var="i" begin="1" end="${num }">
													<c:if test="${i==page }">
														<li class="page-item active"><a href="home?page=${i}"
															class="page-link">${i }</a></li>
													</c:if>
													<c:if test="${i!=page }">
														<li class="page-item"><a href="home?page=${i}"
															class="page-link">${i }</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${page<num}">
													<li class="page-item"><a href="home?page=${page + 1}"
														class="page-link"><i class="mdi mdi-chevron-right"></i></a></li>
												</c:if>
												<c:if test="${page>=num}">
													<li class="page-item disabled"><a
														href="home?page=${page + 1}" class="page-link"><i
															class="mdi mdi-chevron-right"></i></a></li>
												</c:if>

											</ul>
										</div>
									</div>
								</div>
							</div>


							<!-- End Pagination -->







							<!-- ĐÃ GIAO HÀNG START-->
							<div class="tab-pane fade" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab" tabindex="0">
								<c:forEach var="i" items="${listorderdelivered }">
									<div class="product">
										<div class="product-detail rounded d-flex">
											<div class="content-info ml-2">
												<div class="product-id" href="">
													<i class="fa-solid fa-qrcode"></i>Mã đơn hàng: ${i.orderID }
												</div>
												<div class="product-category">
													<i class="fa-solid fa-calendar-days"></i>Ngày đặt hàng:
													${i.orderDate}
												</div>
											</div>
											<div class="product-money text-center">
												<p>
													<i class="fa-solid fa-sack-dollar"></i>Thành tiền
												</p>
												<p style="color: rgb(36, 214, 158);">${i.orderValue}đ</p>
											</div>
										</div>
										<div class="product-address d-flex">
											<div class="content-info ml-2 mb-2 justify-content-between">
												<div class="address">
													<i class="fa-solid fa-location-dot"></i>Địa chỉ:
													${i.customer.address }
												</div>
												<div class="phone">
													<i class="fa-solid fa-phone"></i>Số điện thoại:
													${i.customer.phone }
												</div>
												<div class="name">Họ và tên: ${i.customer.customerName }</div>
											</div>
											<div class="product-status text-center">
												<p>
													<i class="fa-solid fa-flag"></i>Trạng thái
												</p>
												<p style="color: rgb(19, 220, 39);">${i.paymentStatus }</p>
											</div>
										</div>
										<div class="product-button d-flex">
											<c:if test="${i.orderStatus == 'Đã giao khách hàng' }">
												<button type="button" class="btn btn-success d-flex"
													style="margin-left: 920px; margin-bottom: 20px;" disabled>
													<i class="fa-solid fa-check" style="padding-top: 5px;"></i>Đã
													giao
												</button>
											</c:if>
											<c:if test="${i.orderStatus == 'Ðã giao cho shipper' }">
												<button type="button" class="btn btn-warning d-flex"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													style="margin-left: 900px; margin-bottom: 20px;">
													<i class="fa-solid fa-truck-fast" style="padding-top: 5px;"></i>Đang
													giao
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
								<div class="row g-0 align-items-center pb-4">
									<div class="col-sm-11">
										<div class="float-sm-end">
											<ul class="pagination mb-sm-0">
												<c:if test="${page1<=1 }">
													<li class="page-item disabled"><a
														href="home?page1=${page1 - 1}" class="page-link"><i
															class="mdi mdi-chevron-left"></i></a></li>
												</c:if>
												<c:if test="${page1>1 }">
													<li class="page-item"><a href="home?page1=${page1 - 1}"
														class="page-link"><i class="mdi mdi-chevron-left"></i></a></li>
												</c:if>
												<c:forEach var="i" begin="1" end="${num1 }">
													<c:if test="${i==page1 }">
														<li class="page-item active"><a href="home?page1=${i}"
															class="page-link">${i }</a></li>
													</c:if>
													<c:if test="${i!=page1 }">
														<li class="page-item"><a href="home?page1=${i}"
															class="page-link">${i }</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${page1<num1}">
													<li class="page-item"><a href="home?page1=${page1 + 1}"
														class="page-link"><i class="mdi mdi-chevron-right"></i></a></li>
												</c:if>
												<c:if test="${page1>=num1}">
													<li class="page-item disabled"><a
														href="home?page1=${page1 + 1}" class="page-link"><i
															class="mdi mdi-chevron-right"></i></a></li>
												</c:if>

											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- ĐÃ GIAO HÀNG END-->

							<!-- ĐANG GIAO HÀNG END-->
							<div class="tab-pane fade" id="pills-contact" role="tabpanel"
								aria-labelledby="pills-contact-tab" tabindex="0">
								<c:forEach var="i" items="${listorderdelivering}">
									<div class="product">
										<div class="product-detail rounded d-flex">
											<div class="content-info ml-2">
												<div class="product-id" href="">
													<i class="fa-solid fa-qrcode"></i>Mã đơn hàng: ${i.orderID }
												</div>
												<div class="product-category">
													<i class="fa-solid fa-calendar-days"></i>Ngày đặt hàng:
													${i.orderDate}
												</div>
											</div>
											<div class="product-money text-center">
												<p>
													<i class="fa-solid fa-sack-dollar"></i>Thành tiền
												</p>
												<p style="color: rgb(36, 214, 158);">${i.orderValue}</p>
											</div>
										</div>
										<div class="product-address d-flex">
											<div class="content-info ml-2 mb-2 justify-content-between">
												<div class="address">
													<i class="fa-solid fa-location-dot"></i>Địa chỉ:
													${i.customer.address }
												</div>
												<div class="phone">
													<i class="fa-solid fa-phone"></i>Số điện thoại:
													${i.customer.phone }
												</div>
												<div class="name">Họ và tên: ${i.customer.customerName }</div>
											</div>
											<div class="product-status text-center">
												<p>
													<i class="fa-solid fa-flag"></i>Trạng thái
												</p>
												<p style="color: rgb(19, 220, 39);">${i.paymentStatus }</p>
											</div>
										</div>
										<div class="product-button d-flex">
											<c:if test="${i.orderStatus == 'Đã giao khách hàng' }">
												<button type="button" class="btn btn-success d-flex"
													style="margin-left: 920px; margin-bottom: 20px;" disabled>
													<i class="fa-solid fa-check" style="padding-top: 4px;"></i>Đã
													giao
												</button>
											</c:if>
											<c:if test="${i.orderStatus == 'Ðã giao cho shipper' }">
												<button type="button" class="btn btn-warning d-flex"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													style="margin-left: 900px; margin-bottom: 20px;">
													<i class="fa-solid fa-truck-fast" style="padding-top: 4px;"></i>Đang
													giao
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
								<div class="row g-0 align-items-center pb-4">
									<div class="col-sm-11">
										<div class="float-sm-end">
											<ul class="pagination mb-sm-0">
												<c:if test="${page2<=1 }">
													<li class="page-item disabled"><a
														href="home?page2=${page2 - 1}" class="page-link"><i
															class="mdi mdi-chevron-left"></i></a></li>
												</c:if>
												<c:if test="${page2>1 }">
													<li class="page-item"><a href="home?page2=${page2 - 1}"
														class="page-link"><i class="mdi mdi-chevron-left"></i></a></li>
												</c:if>
												<c:forEach var="i" begin="1" end="${num2}">
													<c:if test="${i==page2 }">
														<li class="page-item active"><a href="home?page2=${i}"
															class="page-link">${i }</a></li>
													</c:if>
													<c:if test="${i!=page2 }">
														<li class="page-item"><a href="home?page2=${i}"
															class="page-link">${i }</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${page2<num2}">
													<li class="page-item"><a href="home?page2=${page2 + 1}"
														class="page-link"><i class="mdi mdi-chevron-right"></i></a></li>
												</c:if>
												<c:if test="${page2>=num2}">
													<li class="page-item disabled"><a
														href="home?page2=${page2 + 1}" class="page-link"><i
															class="mdi mdi-chevron-right"></i></a></li>
												</c:if>

											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="tab-pane fade" id="v-pills-information" role="tabpanel"
					aria-labelledby="v-pills-profile-information" tabindex="0">
					<div
						class="edit card-body d-flex align-items-center shadow p-3 mb-5 bg-white rounded"
						style="width: 1150px;">
						<div class="image-container mb-4 mb-lg-0 ">
							<img src="https://2sao.vietnamnetjsc.vn/images/2021/04/05/14/45/IU.jpg" alt="..."
								class="object-fit-sm-contain">
						</div>
						<div class="col-lg-6 px-xl-10">
							<form action="updateinfor" method="post">
								<div
									class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded"
									style="margin-top: 20px; margin-left: 50px;">
									<h3 class="h2 text-white text-center mb-0">${shipper.employeeName }</h3>
								</div>
								<ul class="list-unstyled mb-1-9">
									<li class="mb-2 mb-xl-3 d-flex align-items-center "><label
										for="username"
										class="display-26 text-secondary me-2 font-weight-600">Tên
											đăng nhập:</label> <input type="text" name="username"
										class="form-control" disabled value="${username }"></li>
									<li class="mb-2 mb-xl-3 d-flex align-items-center"><label
										for="username"
										class="display-26 text-secondary me-2 font-weight-600">Mã
											nhân viên:</label> <input type="text" name="employeeId"
										class="form-control" readonly="readonly"
										value="${shipper.employeeId }"></li>

									<li class="mb-2 mb-xl-3 d-flex align-items-center"><label
										for="validationDefault01"
										class="display-26 text-secondary me-2 font-weight-600 form-label">Họ
											và tên:</label> <input type="text" name="employeeName"
										class="form-control" id="validationDefault01"
										value="${shipper.employeeName }" required></li>
									<li class="mb-2 mb-xl-3 d-flex align-items-center"><label
										for="validationDefault02"
										class="display-26 text-secondary me-2 font-weight-600 form-label">Giới
											tính:</label> <input type="text" name="gender" class="form-control"
										value="${shipper.gender}" id="validationDefault02" required></li>

									<li class="mb-2 mb-xl-3 d-flex align-items-center"><label
										for="validationDefault03"
										class="display-26 text-secondary me-2 font-weight-600 form-label">Ngày
											sinh:</label> <input type="text" name="birthdate"
										class="form-control" value="${shipper.birthdate }"
										id="validationDefault03" required></li>

									<li class="mb-2 mb-xl-3 d-flex align-items-center"><label
										for="validationDefault04"
										class="display-26 text-secondary me-2 font-weight-600 form-label">Địa
											chỉ:</label> <input type="text" name="address" class="form-control"
										value="${shipper.address }" id="validationDefault04" required></li>
									<li class="mb-2 mb-xl-3 d-flex align-items-center"><label
										for="validationDefault05"
										class="display-26 text-secondary me-2 font-weight-600">Số
											điện thoại:</label> <input type="text" name="phone"
										class="form-control" value=${shipper.phone }
										id="validationDefault05" required></li>
								</ul>
								<div class="product-button d-flex">
									<button type="submit" class="btn btn-success d-flex"
										style="margin-left: 450px; margin-bottom: 20px;">Lưu
										lại</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Thay đổi
							trạng thái đơn hàng</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Bạn có muốn chuyển trạng thái sang
						"Đã giao hàng"</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script>
		// JavaScript để tăng cường màu sắc
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var products = document
									.querySelectorAll('.product');
							var currentColorIndex = 0;

							products
									.forEach(function(product) {
										var currentColor = getCurrentColor();
										product
												.querySelector('.product-detail').style.backgroundColor = currentColor;
										product
												.querySelector('.product-address').style.backgroundColor = currentColor;
										product
												.querySelector('.product-button').style.backgroundColor = currentColor;

									});

							function getCurrentColor() {
								var colors = [ "#fff", "#e6e6e6" ];
								var color = colors[currentColorIndex];
								currentColorIndex = (currentColorIndex + 1)
										% colors.length;
								return color;
							}
						});
	</script>

	<script>
		// Wait for the document to be fully loaded
		document.addEventListener('DOMContentLoaded', function() {
			// Get the "Save changes" button by its ID
			var saveChangesBtn = document.getElementById('saveChangesBtn');

			// Add a click event listener to the button
			saveChangesBtn.addEventListener('click', function() {
				// Your custom logic here to change the order status to "Delivered"
				changeOrderStatusToDelivered();

				// Close the modal
				var modal = new bootstrap.Modal(document
						.getElementById('exampleModal'));
				modal.hide();
			});

			// Function to change the order status
			function changeOrderStatusToDelivered() {

			}
		});
	</script>
</body>

</html>