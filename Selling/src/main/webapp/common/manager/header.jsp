<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglist.jsp"%>
<!--HEADER-->
<nav
	class="navbar navbar-expand-lg navbar-light bg-light border-bottom border-secondary-subtle">
	<a class="navbar-brand d-flex align-items-center ps-2" href="#"> <img
		src="./img/logo-removebg-preview.png" alt="logo"
		style="width: 50px; height: auto;">
		<div class="mx-2 align-items-center mt-1" style="font-size: 16px">Trang
			chủ > Doanh Thu</div>
	</a>

	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse justify-content-end"
		id="navbarNav">
		<ul class="navbar-nav ml-auto">

			<!-- Search Dropdown (Visible Only XS) -->
			<li class="nav-item dropdown d-sm-none"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-search fa-fw"></i>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in">
					<form class="form-inline mr-auto w-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</div></li>

			<!-- Alerts Dropdown -->
			<li class="nav-item dropdown mx-1 my-auto"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
				id="alertsDropdown"> <i
					class="fas fa-bell fa-fw position-relative"> <span
						class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger opacity-75">3+</span>
				</i>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
					<h6 class="dropdown-header">Alerts Center</h6>
					<!-- Add your alert items here -->
					<!-- ... -->
					<a class="dropdown-item text-center small text-gray-500" href="#">Show
						All Alerts</a>
				</div></li>

			<!-- Messages Dropdown -->
			<li class="nav-item dropdown mx-1 my-auto"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
				id="messagesDropdown"> <i
					class="fas fa-envelope fa-fw position-relative"> <span
						class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger opacity-75">7+</span>
				</i>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
					<h6 class="dropdown-header">Message Center</h6>
					<!-- Add your message items here -->
					<!-- ... -->
					<a class="dropdown-item text-center small text-gray-500" href="#">Read
						More Messages</a>
				</div></li>

			<!-- User Information Dropdown -->
			<li class="nav-item dropdown my-auto me-2"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas
						McGee</span>
					<figure class="figure position-relative">
						<img class="img-profile rounded-circle"
							src="./img/undraw_profile.svg"
							style="width: 2.25rem; height: auto;" alt="avatar">
						<span
							class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle opacity-50">
							<span class="visually-hidden">New alerts</span>
						</span>
					</figure>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
					<a class="dropdown-item" href="#"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity
						Log
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/Selling/web/logout"
						data-bs-target="#logoutModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						Logout
					</a>
				</div></li>
		</ul>
	</div>
</nav>
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