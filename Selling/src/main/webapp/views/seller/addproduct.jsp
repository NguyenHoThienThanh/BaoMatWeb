<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglist.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
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
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="/css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
             body {
            display: flex;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
        }

        form {
            width: 400px; /* Điều chỉnh độ rộng của form theo ý muốn của bạn */
        }
        </style>
<body>
    
    <form action="insertpro" method="post">
        <div class="modal-header">						
            <h4 class="modal-title">Add Product</h4>
        </div>
        <div class="modal-body">					
            <div class="form-group">
                <label>Product Name</label>
                <input name="productName" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Description</label>
                <input name="description" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Stock</label>
                <input name="stock" type="number" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Amount</label>
                <input name="amount" type="number" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Price</label>
                <input name="price" type="number" class="form-control" required>
            </div>
            <div class="form-group">
				<label for='category'>Category</label> <select name="categoryId"
					class="form-select" aria-label="Default select example">
					<c:forEach var="item" items="${listcate}">
						<option value="${item.categoryId}">${item.categoryName}</option>
					</c:forEach>
				</select>
			</div>
            <div class="form-group">
                <label>Image</label>
                <input name="imageURL" type="file" class="form-control" required>
            </div>
           

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" onclick="logout()" style="text-decoration: none; color: black;">Thoát</button>


            <input type="submit" class="btn btn-success" value="Add">
        </div>
    </form>

    <script>
        function logout() {
            window.location.href = "/Selling/seller/listproduct";
        }
    </script>


</body>
</html>