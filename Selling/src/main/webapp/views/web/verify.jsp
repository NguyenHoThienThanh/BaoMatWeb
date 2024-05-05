<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href='<c:url value="/stylecss/base/basecss.css" />'
	rel="stylesheet" type="text/css">
<link href='<c:url value="/css/bootstrap.css"/>' rel="stylesheet"
	type="text/css">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />


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
			style="padding-top: 200px;">
			<form action="VerifyCode" method="post">

				<div class="row border rounded-5 p-3 bg-white shadow edit"
					style="width: 500px; height: fit-content;">
					<p style="font-weight: 700;">Hệ thống đã gửi mã kích hoạt đến
						Email của bạn. Vui lòng kiểm tra Email để lấy mã kích hoạt tài
						khoản của bạn</p>
					<div class="input-group mb-3">
						<input type="text" name="authcode"
							class="form-control form-control-lg bg-light fs-6"
							placeholder="Nhập mã kích hoạt">
					</div>
					<c:if test="${not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>
					<button type="submit" class="btn btn-primary w-50 mx-auto">Kích
						hoạt</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>