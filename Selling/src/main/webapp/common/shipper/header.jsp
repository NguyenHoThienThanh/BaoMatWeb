<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Shipper</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--FONTAWESOME-->
<link
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css"
	rel="stylesheet" type="text/css" />

<!--FONT GOOGLE-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;600;700&display=swap"
	rel="stylesheet">

<!--MAIN CSS-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<!-- HEADER -->
	<nav class="navbar navbar-expand-xxl bg-body-tertiary justify-content-between">
		<div class="container-fluid d-flex justify-content-between">
			<a class="navbar-brand d-flex align-items-start ps-2"
				style="font-size: 16px;" href="#"><img
				src="${pageContext.request.contextPath}/templates/web/images/Logo_Project.png"
				alt="Logo" style="width: 50px; height: auto;">
				<p style="padding-left: 20px; padding-top: 15px;">Shipper</p>
			</a>
			<div class="d-flex flex-column align-items-end">
				<div class="mt-auto">
					<a class="dropdown-item d-flex align-items-center"
							href="/Selling/web/logout">Đăng xuất</a>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>