<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglist.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>header</title>
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
	<style>
.rounded-image {
	display: flex;
	align-items: center;
}

.rounded-image img {
	width: 30px;
	height: 30px;
	object-fit: cover;
	border-radius: 50%;
	margin-right: 5px; /* Adjust the margin as needed */
}
</style>

	<!-- HEADER -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light border-bottom border-secondary-subtle">
		<a class="navbar-brand d-flex align-items-center ps-2"
			style="font-size: 16px;" href="#"> <img
			src="${pageContext.request.contextPath}/templates/web/images/Logo_Project.png"
			alt="Logo" style="width: 50px; height: auto;">
		</a>

		<div class="ms-auto"
			style="margin-right: 50px; display: flex; align-items: center;">
			<div class="rounded-image">
				<img
					src="https://scontent.fhan4-2.fna.fbcdn.net/v/t39.30808-6/357053034_814960390037893_4922475779121350488_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeF5HXwEGNMOPAGrytHpFsrR_aLOXQRBb7r9os5dBEFvuq1yibYhcbMKiV2CqFcBHaVpuYriGC2v8DMoF6Nbu4wB&_nc_ohc=stdyV6Zw6N0AX8H0sEu&_nc_oc=AQnCyngbl5CMeACfInXfkj2inNDRJG4drkLpVvd-5frReEBAZB3AxYcj3hm4BbrxPpo&_nc_ht=scontent.fhan4-2.fna&oh=00_AfCUdzhjAT_iSS8Y5sbvEM8AgNOoBZGbJssYMAQ7zIkTHA&oe=657C5121"
					width="30" height="30" class="d-inline-block align-top" alt="">
				Admin
			</div>
			<a class="ms-3" href="/Selling/web/logout">Đăng xuất</a>
		</div>
	</nav>


</body>
</html>