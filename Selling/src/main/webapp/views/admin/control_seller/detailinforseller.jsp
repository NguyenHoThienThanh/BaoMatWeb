<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
						<span class="d-none d-sm-inline" style="margin-left: 10px;color:#212529">Trang chủ</span>
				</a></li>

				<li><a href="listuser"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="fal fas fa-users" style="color: #c77070; font-size: 30px"></i>
						<span class="d-none d-sm-inline" style="margin-left: 9px; color:#212529" >Khách hàng</span>
				</a></li>

				<li><a href="listseller"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="far fas fa-user"
						style="color: #178254; font-size: 30px;"></i> <span
						class="d-none d-sm-inline" style="margin-left: 19px;">Nhân Viên</span>
				</a></li>

				<li><a href="listshipper"
					class="nav-link align-middle px-0 nav-menu"> <i
						class="fal fas fa-shipping-fast"
						style="color: #592731; font-size: 30px;"></i> <span
						class="d-none d-sm-inline" style="margin-left: 9px;color:#212529">Shipper</span>
				</a></li>
			</ul>
		</div>


		<section class="col-9">
		<form action="updateseller" method="post">
			<div class="container py-5">
				<div class="row">
					<div class="col">
						<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item active" aria-current="page">Chi
									tiết thông tin Seller</li>
							</ol>
						</nav>
					</div>
				</div>
				<div class="row">
					
						<div class="col-lg-4">
							<div class="card mb-4">
								<div class="card-body text-center">
									<img
										src="https://scontent.fhan4-1.fna.fbcdn.net/v/t39.30808-6/339908861_207526681891832_1233331276264573363_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=9c7eae&_nc_eui2=AeFJ4anPj9NtC_ZXyKQgLXW8YbiVsfA75rBhuJWx8DvmsBnd5OhM8q4r_k68Qy8JcoAD3jsoMp5iaPTcmvmLo366&_nc_ohc=X_NqlIZxBAQAX9lGWSj&_nc_ht=scontent.fhan4-1.fna&oh=00_AfCH2dwqPlm-gRAt-5_iDz7hztkGSsatp6sakGwYAHo-Zg&oe=65794A90"
										alt="avatar" class="rounded-circle img-fluid"
										style="width: 150px;">
									<h5 class="my-3">${seller.employeeName}</h5>
									<div class="text-muted mb-4">
										<div class="d-flex align-items-center"
											style="margin-left: 135px;">
											<label for="employeeId">ID:</label> <input type="text"
												name="employeeId" readonly="readonly" class="form-control"
												style="width: 50px; border: none; background: none;"
												value="${seller.employeeId}">
										</div>
									</div>

									<div class="d-flex justify-content-center mb-2">
										<button type="submit" class="btn btn-danger">Cập nhật</button>
										<a href="listseller"><button type="button"
												class="btn btn-primary ms-1">Quay lại</button></a>
									</div>

								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card mb-4">
								<div class="card-body">
									<div class="row">
										<div class="col-sm-3">
											<label for="employeeName" class="mb-0">Họ tên</label>
										</div>
										<div class="col-sm-9">
											<input type="text" name="employeeName" class="form-control"
												value="${seller.employeeName}">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="email" class="mb-0">Email</label>
										</div>
										<div class="col-sm-9">
											<input type="email" name="mail" class="form-control"
												value="${seller.mail}">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="phone" class="mb-0">Số điện thoại</label>
										</div>
										<div class="col-sm-9">
											<input type="tel" name="phone" class="form-control"
												value="${seller.phone}">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="birthdate" class="mb-0">Ngày sinh</label>
										</div>
										<div class="col-sm-9">
											<input type="date" name="birthdate" class="form-control"
												value="${seller.birthdate}">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="gender" class="mb-0">Giới tính</label>
										</div>
										<div class="col-sm-9">
											<input type="text" name="gender" class="form-control"
												value="${seller.gender}">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<label for="address" class="mb-0">Địa chỉ</label>
										</div>
										<div class="col-sm-9">
											<input type="text" name="address" class="form-control"
												value="${seller.address}">
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-20">
									<div class="card mb-4 mb-md-0">
										<div class="card-body">
											<p class="mb-4">
												<span class="text-primary font-italic me-1"
													style="font-weight: bold">Tình Trạng Đơn Hàng</span>
											</p>
											<p class="mb-1" style="font-size: .77rem; font-size: 16px;">
												Tổng đơn đã bán: <span style="color: #007bff;"> 230</span>
											</p>

											<p class="mt-4 mb-1"
												style="font-size: .77rem; font-size: 16px;">
												Tổng đơn hủy: <span style="color: #007bff;"> 12</span>
											</p>


										</div>
									</div>
								</div>
							</div>
						</div>
					
				</div>
			</div>
			</form>
		</section>
	</div>
</body>
</html>