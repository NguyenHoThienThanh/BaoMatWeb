<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/user/css/styledetailcart.css">
</head>
<body>


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
			<div class="user-details-content">
				<section class="h-100 h-custom" style="background-color: #eee;">
					<div style="background-color: #fff;" class="container h-100 py-1">
						<div
							class="row d-flex justify-content-center align-items-center h-100">
							<div class="col">
								<div class="card shopping-cart" style="border-radius: 15px;">
									<div class="card-body text-black">

										<div class=" d-flex ">
											<div class="col-lg-6 px-5 py-4">

												<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Đơn
													hàng của bạn</h3>

												<c:if test="${not empty listCartItem}">
													<c:forEach var="i" items="${listCartItem}">
														<div class="d-flex align-items-center mb-5">
															<div class="flex-shrink-0">
																<img src="${i.product.imageURL}" class="img-fluid"
																	style="width: 150px;" alt="Generic placeholder image">
															</div>
															<div class="flex-grow-1 ms-3">
																<h5 class="text-primary">${i.product.productName}</h5>
																<h6 style="color: #9e9e9e;">Số lượng: ${i.quantity}</h6>

																<div class="d-flex align-items-center">
																	<p class="fw-bold mb-0 me-5 pe-3">Tổng:
																		${i.totalPrice}đ</p>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>


												<hr class="mb-4"
													style="height: 2px; background-color: #1266f1; opacity: 1;">
												<div class="cham">
													<h4>Phương thức vận chuyển</h4>
													<a href="payment?deliveryMethod=${1}"><button
															class="btn btn-outline-primary ">Vận chuyển
															thường</button> <br> <br></a> <a
														href="payment?deliveryMethod=${2}"><button
															class="btn btn-outline-primary">Vận chuyển hỏa
															tốc</button></a>
												</div>


												<hr class="mb-4"
													style="height: 2px; background-color: #1266f1; opacity: 1;">

												<div class="d-flex justify-content-between px-x">
													<p class="fw-bold">Chi phí đơn hàng:</p>
													<p class="fw-bold">${totalPriceCart}</p>
												</div>
												<div class="d-flex justify-content-between px-x">
													<p class="fw-bold">Phí giao hàng:</p>
													<p class="fw-bold">${deliveryFee}</p>
												</div>
												<div class="d-flex justify-content-between p-2 mb-2"
													style="background-color: #e1f5fe;">
													<h5 class="fw-bold mb-0">Tổng:</h5>
													<h5 class="fw-bold mb-0">${totalPriceCart+deliveryFee}</h5>
												</div>
											</div>

											<div class="col-lg-6 px-5 py-4">

												<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">
													<span>THANH TOÁN BẰNG VÍ</span> <span
														style="color: #ae1973;">MOMO</span>
												</h3>


												<div class="mb-5 pt-2 text-center">
													<a href='https://me-qr.com' border='0'
														style='cursor: pointer; display: block'><img
														style="width: 300px; height: 300px;"
														src='https://cdn2.me-qr.com/qr/82712719.png?v=1700018426'
														alt='Create qr code for free'></a><a
														href='https://me-qr.com' border='0'
														style='cursor: default; display: none'>Create qr code
														for free</a>
												</div>
												<div class="fw-bold mb-5 payment-instructions">
													<span>Quét mã</span> <span style="color: #ae1973;">QR</span>
													<span>để thanh toán</span>
													<ol>
														<li>Mở ứng dụng <span style="color: #ae1973;">MoMo</span>
															trên điện thoại
														</li>
														<li>Trên <span style="color: #ae1973;">MoMo</span>,
															chọn biểu tượng <img style="width: 40px; height: 40px;"
															src="https://salt.tikicdn.com/ts/upload/03/74/d4/01670f7f9e6a3c86583939eb2494e9cf.png"
															alt="scan"> quét mã <span style="color: #ae1973;">QR</span></li>
														<li>Quét mã <span style="color: #ae1973;">QR</span> ở
															trang này và thanh toán
														</li>
													</ol>
												</div>
												<hr class="mb-4"
													style="height: 2px; background-color: #1266f1; opacity: 1; margin-top: 20px;">
												<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase"
													style="letter-spacing: 0; margin: 0;">
													<span style="margin: 0;">THANH TOÁN BẰNG</span> <span
														style="color: #ed1c24; letter-spacing: 0; margin: 0;">VN</span>
													<span
														style="color: #005baa; letter-spacing: 0; margin: -20p; margin: -10px;">PAY</span>
												</h3>

												<div class="mb-5 pt-2 text-center">
													<a href="${pageContext.request.contextPath}/user/pay"
														class="text-danger" onclick="updateOrder();"><img alt="vnpay"
														style="width: 200px; height: 200px;"
														src="https://vnpay.vn/assets/images/logo-icon/logo-primary.svg"></a>
												</div>
												<h5 class="fw-bold mb-5"
													style="position: absolute; bottom: 0;">
													<a href="findCartByCartID?cartID=${cartID}"><i
														class="fas fa-angle-left me-2"></i>Quay lại</a>
												</h5>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			</section>
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
	<script>
	    function updateOrder() {
	        // Use AJAX to send a request to your server-side code
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "${pageContext.request.contextPath}/user/updateorder", true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        xhr.send();
	
	        // You can handle the response if needed
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	                console.log(xhr.responseText);
	                // Optionally, redirect to the payment page after the update
	                window.location.href = "${pageContext.request.contextPath}/user/pay";
	            }
	        };
	    }
	</script>
</body>
</html>
