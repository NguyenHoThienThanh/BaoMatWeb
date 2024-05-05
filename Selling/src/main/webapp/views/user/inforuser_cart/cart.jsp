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
	href="${pageContext.request.contextPath}/templates/user/css/stylecart.css">
</head>
<body>

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


		<div class="user-details-content">
			<section class="h-100" style="background-color: #eee;">
				<div style="background-color: #fff;" class="container h-100 py-1">
					<div class="row justify-content-center align-items-center h-100">
						<div class="col-10">

							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
								<div>
									<p class="mb-0">
										<span class="text-muted">Tổng(${countCartItem})</span>
									</p>
								</div>
							</div>
							<c:if test="${not empty message}">
								<div class="alert alert-success">${message}</div>
							</c:if>
							<c:if test="${not empty error}">
								<div class="alert alert-danger">${error}</div>
							</c:if>
							<c:if test="${not empty listCartItem}">
								<c:forEach var="i" items="${list}">
									<div class="card rounded-3 mb-4">
										<div class="card-body p-4">
											<div
												class="row d-flex justify-content-between align-items-center">
												<div class="col-md-2 col-lg-2 col-xl-2">
													<img src="${i.product.imageURL}" class="d-block w-100"
														alt="Hình ảnh 1" class="img-fluid rounded-3"
														alt="Cotton T-shirt">
												</div>
												<div class="col-md-3 col-lg-3 col-xl-3">
													<p class="lead fw-normal mb-2">${i.product.productName}</p>
												</div>
												<div
													class="col-md-3 col-lg-3 col-xl-3 d-flex align-items-center">
													<c:set var="decreaseDisabled" value="${i.quantity eq 1}" />
														<button
															class="btn btn-link px-2 ${decreaseDisabled ? 'disabled' : ''}"
															${decreaseDisabled ? 'disabled' : ''}
															onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
															<a	href="<c:url value='/user/updateCartItem?cartID=${cartID}&productID=${i.productID}&quantity=${i.quantity-1}&totalPrice=${i.totalPrice}'/>">
														<i class="fas fa-minus"></i></a>
														</button>
													 <input id="form1" min="0" name="quantity"
														value="${i.quantity}" class="form-control text-center"
														readonly="readonly" /> <a
														href="<c:url value='/user/updateCartItem?cartID=${cartID}&productID=${i.productID}&quantity=${i.quantity+1}&totalPrice=${i.totalPrice}'/>">
														<button class="btn btn-link px-2"
															onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
															<i class="fas fa-plus"></i>
														</button>
													</a>
												</div>
												<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
													<h5 class="mb-0">${i.totalPrice}đ</h5>
												</div>
												<div class="col-md-1 col-lg-1 col-xl-1 text-end">
													<a
														href="<c:url value='/user/deleteCartItem?cartID=${cartID}&productID=${i.productID}'/>"
														class="text-danger"> <i class="fas fa-trash fa-lg"></i>
													</a>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</c:if>


							<c:if test="${empty listCartItem}">
								Không có sản phẩm
								<br>
								<br>
								<br>
							</c:if>

							<div class="row g-0 align-items-center pb-4">
								<div class="col-sm-6">
									<div>
										<p class="mb-sm-0"></p>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="float-sm-end">
										<ul class="pagination mb-sm-0">
											<c:if test="${page<=1 }">
												<li class="page-item disabled"><a
													href="findCartByCartID?page=${page - 1}" class="page-link"><i
														class="mdi mdi-chevron-left"></i></a></li>
											</c:if>
											<c:if test="${page>1 }">
												<li class="page-item"><a
													href="findCartByCartID?page=${page - 1}" class="page-link"><i
														class="mdi mdi-chevron-left"></i></a></li>
											</c:if>
											<c:forEach var="i" begin="1" end="${num }">
												<c:if test="${i==page }">
													<li class="page-item active"><a
														href="findCartByCartID?page=${i}" class="page-link">${i }</a></li>
												</c:if>
												<c:if test="${i!=page }">
													<li class="page-item"><a
														href="findCartByCartID?page=${i}" class="page-link">${i }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${page<num}">
												<li class="page-item"><a
													href="findCartByCartID?page=${page + 1}" class="page-link"><i
														class="mdi mdi-chevron-right"></i></a></li>
											</c:if>
											<c:if test="${page>=num}">
												<li class="page-item disabled"><a
													href="findCartByCartID?page=${page + 1}" class="page-link"><i
														class="mdi mdi-chevron-right"></i></a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
							<div class="card rounded-3 mb-4">
								<div class="card-body p-4">
									<div
										class="row d-flex justify-content-between align-items-center">
										<div class="card-body p-4 d-flex flex-row">
											<div></div>
											<!-- Thêm thẻ div cho tổng tiền thanh toán -->
											<div class="total-payment-container">
												<div class="total-payment">
													Tổng tiền thanh toán: <span class="amount">${totalPriceCart}
														đ</span>
												</div>
												<c:if test="${not empty listCartItem}">
												<a href="payment"><button type="button"
													class="btn btn-outline-primary btn-block btn-lg">Thanh
													toán</button></a>
												</c:if>

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

</body>
</html>