<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html lang="fr">
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
<link href='<c:url value="/stylecss/base/basecss.css" />'
	rel="stylesheet" type="text/css">
<link href='<c:url value="/css/bootstrap.css" />' rel="stylesheet"
	type="text/css">

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templates/web/css/main.css">
</head>
<body>


	<div class="bg__img">
		<div class="container d-flex justify-content-center w-200 min-vh-100"
			style="padding-top: 100px;">

			<!-- login -->

			<div class="row border rounded-5 p-3 bg-white shadow edit"
				style="width: 900px; height: fit-content;">

				<!-- 		left box -->
				<div
					class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
					style="background: #e9d4d4">
					<div class="featured-image md-3">
						<img
							src="${pageContext.request.contextPath}/templates/web/images/Logo_Project.png"
							class="img-fluid" style="width: 250px;">
					</div>
					<p class="text-white fs-2 style="font-family: "Poppins"></p>
				</div>

				<!-- right-box -->
				<div class="col-md-6 right-box">
					<div class="row align-items-center">
						<div class="header-text mb-4 text-center">
							<h1 style="font-size: 2rem;">SIGN-IN</h1>
						</div>
						<c:if test="${not empty message}">
							<div class="alert alert-success">${message}</div>
						</c:if>
						<c:if test="${not empty error}">
							<div class="alert alert-danger">${error}</div>
						</c:if>
						<form action="login" method="post">

							<div class="input-group mb-3">
								<span class="input-group-text" id="username-addon"> <i class="fa-solid fa-user"></i> <!-- Thay đổi bi bi-person thành icon bạn muốn sử dụng -->
								</span> <input type="text"
									class="form-control form-control-lg bg-light fs-6"
									placeholder="Username" name="username"
									aria-describedby="username-addon">
							</div>

							<div class="input-group mb-4">
								<span class="input-group-text" id="password-addon"> <i class="fa-solid fa-key"></i>
								</span> <input type="password"
									class="form-control form-control-lg bg-light fs-6"
									placeholder="Password" name="password"
									aria-describedby="password-addon">
							</div>

							<div class="input-group mb-5 d-flex justify-content-between">
								<div class="form-check">
									<input type="checkbox" class="form-check-input" id="formCheck"
										name="remember"> <label for="formCheck"
										class="form-check-label text-secondary"><small>Remember
											me</small></label>
								</div>
								<div class="forgot">
									<small><a
										href="${pageContext.request.contextPath }/web/forgotpass">Forgot
											Password?</a></small>
								</div>
							</div>
							<div class="input-group mb-3">
								<button type="submit" class="btn btn-lg btn-primary w-100 fs-6">Login</button>
							</div>
						</form>
						<div class="input-group mb-5">
							<button class="btn btn-lg btn-light w-100 fs-6">
								<img
									src="${pageContext.request.contextPath}/templates/web/images/google.png"
									style="width: 20px" class="me-2"><small>Sign In
									with Google</small>
							</button>
						</div>
						<div class="row text-center ">
							<small>Don't have account? <a href="register">Sign Up</a></small>

						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>