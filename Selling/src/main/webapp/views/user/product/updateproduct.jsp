<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" 
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" 
	crossorigin="anonymous" 
	referrerpolicy="no-referrer"></script>
<!-- <script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script> -->
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js" integrity="sha512-TPh2Oxlg1zp+kz3nFA0C5vVC6leG/6mm1z9+mA81MI5eaUVqasPLO8Cuk4gMF4gUfP5etR73rgU/8PNMsSesoQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<style>
img {
	width: 200px;
	height: 120px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Edit <b>Product</b>
						</h2>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
		</div>
		<div id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="update" method="post">
						<div class="modal-header">
							<h4 class="modal-title">Edit Product</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>ID</label> <input value="${P.productID}" name="productID"
									type="text" class="form-control" readonly required>
							</div>
							<div class="form-group">
								<label>Name</label> <input value="${P.productName}"
									name="productName" type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Image</label> <input value="${P.imageURL}"
									name="imageURL" type="text" class="form-control" required
									style="object-fit: cover;">
							</div>
							<div class="form-group">
								<label>Stock</label> <input value="${P.stock}" name="stock"
									type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Amount</label> <input value="${P.amount}" name="amount"
									type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Price</label> <input value="${P.price}" name="price"
									type="text" class="form-control" required>
							</div>
							<!--
                                <div class="form-group">
                                    <label>Title</label>
                                    <textarea name="title" class="form-control" required>${detail.title}</textarea>
                                </div>   -->
							<div class="form-group">
								<label>Description</label>
								<textarea name="description" class="form-control" required>${P.description}</textarea>
							</div>
							<div class="form-group">
								<label for='category'>Category</label> <select name="categoryID"
									class="form-select" aria-label="Default select example">
									<c:forEach items="${listC}" var="o">
										<option value="${o.categoryID}">${o.categoryName}</option>
									</c:forEach>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-success" value="Edit">
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>


	<script src="js/manager.js" type="text/javascript"></script>
</body>
</html>