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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="${pageContext.request.contextPath}/templates/user/css/product/style.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<!-- CAROUSEL BEGIN -->
	<div id="carouselExampleIndicators" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
        aria-label="Slide 3"></button> -->
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=41570ed0-0532-4678-8945-8f01374e640f&name=18497222_3&inputFormat=jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="https://media-asia.oriflame.com/contentImage?externalMediaId=68f4f6d8-2b1d-4cdb-ac1b-546a4f7cd190&name=18547169_2&inputFormat=jpg"
					class="d-block w-100" alt="...">
			</div>
			<!-- <div class="carousel-item">
        <img
          src="https://media-asia.oriflame.com/contentImage?externalMediaId=7fa4057e-42b1-4a7e-a4cf-b7c31b4df695&name=18547183_3&inputFormat=jpg/"
          class="d-block w-100" alt="...">
      </div> -->
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- CAROUSEL END -->

	<!-- NAVIGATION BAR BEGIN -->
	<ul class="nav justify-content-center">
		<c:forEach var="i" items="${listC}">
			<li class="nav-item"><a class="nav-link"
				href="product/productByCategory?cid=${i.categoryId}"><c:out
						value="${i.categoryName}" /></a></li>
		</c:forEach>
	</ul>
	<!-- NAVIGATION BAR END -->

	<!-- MỚI RA MẮT BEGIN-->
	<div class="container">
		<!-- Stack the columns on mobile by making one full-width and the other half-width -->
		<div class="container-fluid">
			<header class="session_header">MỚI RA MẮT</header>
			<div class="container-fluid">
				<img class="img-fluid"
					src="https://media-asia.oriflame.com/contentImage?externalMediaId=3f1fabc6-7a5b-42d4-9061-ce342cdaaaa5&name=18547188_2&inputFormat=jpg"
					alt="">
			</div>
			<div class="container-fluid">
				<div class="row justify-content-center" style="margin-top: 16px;">
					<c:if test="${list.size() == 0 }">
						<header class="session_header">CHƯA CÓ SẢN PHẨM THUỘC
							LOẠI NÀY</header>
					</c:if>
					<c:forEach var="i" items="${list}">
						<div class="card col-md-3"">
							<a href="product/detailProduct?pid=${i.productId}"> <img
								src="${i.imageURL}" class="card-img-top" alt="..."></a>
							<div class="card-body">
								<div class="d-flex justify-content-between align-items-center">
									<div class="ratings">
										<c:forEach begin="1"
											end="${ratingService.averageRating(i.productId) }">
											<i class="fa fa-star rating-color"></i>
										</c:forEach>
										<c:forEach begin="1"
											end="${5-ratingService.averageRating(i.productId) }">
											<i class="fa fa-star"></i>
										</c:forEach>
									</div>
									<h5 class="review-count">${ratingService.findByProduct(i.productId).size()}
										Reviews</h5>
								</div>
								<h5 class="card-title card__Name">${i.productName}</h5>
								<p class="card-text card__Text">${i.description}</p>
								<p class="price card__Price">${i.price}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- MỚI RA MẮT END-->



			<!-- ƯU ĐÃI BEIGIN -->
			<div class="container">
				<button type="button" class="btn">Xem các ưu đãi</button>
				<div class="row d-flex justify-content-center">
					<header class="session_header">ƯU ĐÃI</header>
					<div class="row justify-content-center" style="margin-top: 16px;">
						<c:if test="${list.size() == 0 }">
							<header class="session_header">CHƯA CÓ SẢN PHẨM THUỘC
								LOẠI NÀY</header>
						</c:if>
						<c:forEach var="i" items="${listS}">
							<div class="card col-md-3"">
								<a href="product/detailProduct?pid=${i.productId}"> <img
									src="${i.imageURL}" class="card-img-top" alt="..."></a>
								<div class="card-body">
									<div class="d-flex justify-content-between align-items-center">
										<div class="ratings">
											<c:forEach begin="1"
												end="${ratingService.averageRating(i.productId) }">
												<i class="fa fa-star rating-color"></i>
											</c:forEach>
											<c:forEach begin="1"
												end="${5-ratingService.averageRating(i.productId) }">
												<i class="fa fa-star"></i>
											</c:forEach>
										</div>
										<h5 class="review-count">${ratingService.findByProduct(i.productId).size()}
											Reviews</h5>
									</div>
									<h5 class="card-title card__Name">${i.productName}</h5>
									<p class="card-text card__Text">${i.description}</p>
									<p class="price card__Price">${i.price}</p>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
		<!-- ƯU ĐÃI END -->

		<!-- NEWS -->
		<div class="container">
			<div class="row">
				<img class="col-6" id=" col banner_news"
					src="https://media-asia.oriflame.com/contentImage?externalMediaId=efae3a8b-502d-485f-ae4c-125558f433e3&name=18345001_3&inputFormat=jpg&w=1242&bc=%23f5f5f5&ib=%23f5f5f5&q=45"
					alt="">
				<div class="col-6 row_paragraph">
					<h2>NGHIÊN CỨU BỞI KHOA HỌC TIÊN TIẾN. MANG LẠI HIỆU QUẢ VƯỢT
						TRỘI</h2>
					<p>NovAge giúp bạn cải thiện làn da ngay từ những dấu hiệu lão
						hóa đầu tiên cho đến làn da đang bị lão hóa nhiều, giúp bạn lấy
						lại nét tươi trẻ và sức sống của làn da bất chấp mọi độ tuổi.</p>
					<button type="button" class="btn">Khám phá</button>
				</div>
			</div>
		</div>
		<!-- NEWS END -->

		<!-- BRAND MISSION BEGIN -->
		<div class="container">
			<div class="row">
				<svg id="Presentation-beauty-edit-logo"
					xmlns="http://www.w3.org/2000/svg" width="150" height="80.009"
					viewBox="0 0 150 80.009">
        <g transform="translate(0 -74.389)">
          <path
						d="M1002.428,694.189h6.971l.662,2.2-.19.106a9.045,9.045,0,0,0-.778-1.112,2.609,2.609,0,0,0-.643-.549,2.012,2.012,0,0,0-.733-.25,10.325,10.325,0,0,0-1.366-.061h-1.414v4.2h.717a5.982,5.982,0,0,0,1.071-.068,1.567,1.567,0,0,0,.6-.256,1.246,1.246,0,0,0,.391-.5,3.848,3.848,0,0,0,.236-.907h.191v3.8h-.191a3.754,3.754,0,0,0-.25-.907,1.294,1.294,0,0,0-.383-.494,1.5,1.5,0,0,0-.609-.26,5.729,5.729,0,0,0-1.053-.071h-.717v3.373a1.125,1.125,0,0,0,.218.827,1.488,1.488,0,0,0,.922.193h.844a3.293,3.293,0,0,0,1.843-.419,6.283,6.283,0,0,0,1.482-1.834l.2.085-.513,2.507h-7.5v-.184c.525-.066.851-.188.974-.369a2.761,2.761,0,0,0,.188-1.306v-5.895a2.786,2.786,0,0,0-.184-1.3c-.126-.185-.453-.308-.978-.375Z"
						transform="translate(-910.79 -563.141)"></path>
          <path
						d="M1131.814,697.72a4.722,4.722,0,0,0-2.405-.539c-.737,0-1.178.1-1.324.29a1.457,1.457,0,0,0-.1.717v6.985a1.77,1.77,0,0,0,.085.733.891.891,0,0,0,.527.253,4.266,4.266,0,0,0,.966.1,4.836,4.836,0,0,0,1.634-.271,3.382,3.382,0,0,0,1.253-.756,3.851,3.851,0,0,0,.9-1.486,5.883,5.883,0,0,0,.324-1.971,6.033,6.033,0,0,0-.449-2.358A3.431,3.431,0,0,0,1131.814,697.72Z"
						transform="translate(-1024.865 -565.859)" style="fill: none;"></path>
          <path
						d="M1109.625,695.847a4.1,4.1,0,0,0-2.473-2.062,7.417,7.417,0,0,0-2.217-.288c-.269,0-.7.011-1.3.033q-.775.03-1.24.03h-1.837v.182c.525.067.852.189.978.375a2.781,2.781,0,0,1,.183,1.3v5.895a2.774,2.774,0,0,1-.187,1.307q-.186.271-.974.369v.184h1.619l2.246.071a8.614,8.614,0,0,0,3.067-.454,3.952,3.952,0,0,0,1.862-1.469,5.2,5.2,0,0,0,.846-3.015A5.119,5.119,0,0,0,1109.625,695.847Zm-1.2,4.549a3.844,3.844,0,0,1-.9,1.486,3.377,3.377,0,0,1-1.253.756,4.835,4.835,0,0,1-1.634.271,4.292,4.292,0,0,1-.966-.1.892.892,0,0,1-.527-.253,1.772,1.772,0,0,1-.084-.733V694.84a1.458,1.458,0,0,1,.1-.717c.146-.194.588-.29,1.324-.29a4.725,4.725,0,0,1,2.405.538,3.431,3.431,0,0,1,1.405,1.695,6.036,6.036,0,0,1,.449,2.359A5.868,5.868,0,0,1,1108.427,700.4Z"
						transform="translate(-999.946 -562.511)"></path>
          <path
						d="M1223.382,694.372c-.527.067-.852.188-.975.371a2.785,2.785,0,0,0-.187,1.3v5.895a2.828,2.828,0,0,0,.183,1.3q.19.275.98.373v.184h-3.669v-.184q.79-.1.975-.369a2.8,2.8,0,0,0,.187-1.307v-5.895a2.819,2.819,0,0,0-.183-1.3c-.127-.185-.452-.308-.979-.375v-.182h3.669Z"
						transform="translate(-1108.212 -563.141)"></path>
          <path
						d="M1270.457,700.724v-.184c.524-.066.851-.188.977-.369a2.719,2.719,0,0,0,.192-1.307v-7.408h-1.718a2.945,2.945,0,0,0-.832.085,1.327,1.327,0,0,0-.61.461,18.75,18.75,0,0,0-1.024,1.579l-.2-.071L1268,690.8h.192a.7.7,0,0,0,.394.239,3.6,3.6,0,0,0,.822.07h5.782a3.6,3.6,0,0,0,.818-.07.709.709,0,0,0,.394-.239h.188l.755,2.709-.2.071a16.54,16.54,0,0,0-1.125-1.7,1.309,1.309,0,0,0-.847-.409c-.079-.009-.241-.014-.485-.014h-1.718v7.408a2.842,2.842,0,0,0,.182,1.3c.128.183.453.307.981.373v.184Z"
						transform="translate(-1151.4 -560.064)"></path>
          <path
						d="M682.475,393.075c1.312.443,4.328,1.143,6.472-.793a6.335,6.335,0,0,0,2.214-2.839l.486-1.321c.107-.366.2-.757.282-1.183a2.672,2.672,0,0,0-.36-1.457,1.733,1.733,0,0,0-.967-.7c-.033,0-.07,0-.1-.007a2.539,2.539,0,0,0-.263-.016c-.03,0-.063,0-.094,0-3.781.126-8.32,8.062-8.32,8.062l.653.248Z"
						transform="translate(-619.493 -282)" style="fill: none;"></path>
          <path d="M1328.725,320.371l.032-.156-.075.146Z"
						transform="translate(-1207.219 -223.354)" style="fill: none;">
          </path>
          <g transform="translate(0 74.389)">
            <path
						d="M43.869,160.4h0a12.087,12.087,0,0,0-1.85.292c-2.266.421-8.565,1.966-18.728,7.24,11.206-8,16.843-13.909,19.615-18.076.282-.35.533-.684.742-.995,0,0,2.157-3.011,1.8-5.932a2.72,2.72,0,0,0-.3-1.171c-.011-.029-.023-.05-.034-.074-.04-.1-.082-.192-.13-.286a4.393,4.393,0,0,0-3.606-2.557c-4.222-.922-16.024,5.4-25.949,11.391V139.341a10.75,10.75,0,0,0,0-3.464v-.14l-.029.006c-.67-2.734-3.134-1.095-3.134-1.095-1.228,1.151,0,4.692,0,4.693.313,2.461.74,6.464,1.1,12.141C5.92,156.06,0,160.108,0,160.108l.723.723s5.571-3.852,12.72-8.166c.234,3.935.435,8.61.546,14.075l.036.565c.008.143,1.032,21.187,1.117,21.932l.289,1.134V151.478c9.707-5.727,21.5-11.721,26.381-10.354,0,0,10.825,1.245-16.863,24.03l-4.037,4.04H21.92s27.174-12.126,33.542-4.208a11.091,11.091,0,0,1-.061,9.69c-.594.861-1.261,1.8-1.931,2.687a13.186,13.186,0,0,1-3.287,3.267,24.053,24.053,0,0,1-2.775,2.2c-.431.276-.946.6-1.538.972l-.071.04c-11.027,6.287-41.35,22.5-45.224,22.972l-.009.288L2.6,208.706s19.478-10.752,31.259-16.9a91.74,91.74,0,0,0,8.406-4.122c.034-.018.434-.239,1.084-.614.926-.534,1.87-1.1,2.812-1.7,3.9-2.469,9.488-6.457,10.724-9.711h0a10.511,10.511,0,0,0,1.811-7.9S58.645,158.27,43.869,160.4Z"
						transform="translate(0 -128.697)"></path>
            <path
						d="M748.8,83.621c-.18-.219-.541.036-1.947.682s-14.276,4.905-14.276,4.905l-7.642,2.127c.035-.069.058-.11.058-.11l3.257-7.641c2.056-5.3.253-8.186.253-8.186-.9-2.272-2.668,0-2.668,0a54.236,54.236,0,0,0-2.09,5.879l-1.081,5.731a49.017,49.017,0,0,1-1.26,5.2l-5.157,1.217-.757.25v2.272l1.982-.683,3.123-.918-8.117,15.01c-2.018,4.3-3.128,3.636-3.128,3.636-.916-.7-.188-7.513.336-10.269.371-1.447.1-1.941-.216-2.085a.648.648,0,0,0-.577,0c-.513-.032-1.091,1.393-1.574,2.99-.609,1.73-3.171,8.189-4.564,11.881,0,0-1.832,2.312-2.975-.459a57.458,57.458,0,0,1-1.7-9.454c.006-.255.017-.5.032-.741a48.938,48.938,0,0,1,1.983-6.275c1.045-2.772-.289-2.844-.289-2.844-1.218-.128-1.685,1.12-1.893,1.872v0c-.006.02-.014.051-.025.1a1.716,1.716,0,0,1-.136.445,3.845,3.845,0,0,0-.093.707,59.179,59.179,0,0,0-1.044,7.835c.143,1.2-1.153,7.429-1.153,7.429a10.059,10.059,0,0,1-1.371,3.352c-1.625,3.02-2.457,2.394-2.787,1.842-.488-1.069-1.219-2.932-2.316-6.15a3.474,3.474,0,0,0-1.53-1.9s-.44-.333-.663.245c0,.006,0,.014-.006.02-.735,1.478-2.37,8.784-2.37,8.784-1.318,3.584-3.1,4.81-4.343,5.209a3.388,3.388,0,0,1-.813-.037,4.212,4.212,0,0,1-1.831-1.884l-.577-1.513c-.007-.022-.014-.049-.02-.072-.785-3.143.6-9.612,1.074-10.942a23.216,23.216,0,0,1,2.6-3.99,33.191,33.191,0,0,1,2.549-2.253c1.781-1.542,1.082.373,2.379.076a1.3,1.3,0,0,0,1.028-.985c-.019-2.337-1.381-2.266-1.8-2.19.337-.139-2.2-.426-3.384.754a9.194,9.194,0,0,0-2.219,2.286c-.71,1.224-8.957,18.508-10.839,22.46-1.835,2.113-3.165,1.373-3.165,1.373-6.24-2.885-3.914-14.248-3.751-15.013,2.056.547,8.01,1.543,10.011-4.563.064-.118.1-.181.1-.181a9.742,9.742,0,0,0,.883-3.527h0s1.042-3.58-4.1-3.722c0,0-4.327.684-7.432,8.127a11.456,11.456,0,0,0-.939,3.511c-.481,2.374-1.181,7.385.436,11.16.008.035.014.067.021.1,0,0,1.622,6.072,5.163,6.058a4.62,4.62,0,0,0,2.962-1.3,6.364,6.364,0,0,0,.866-1.224h0l0,0c1.41-2.356,3.59-7.034,3.59-7.034l1.823-4.151.854-1.641c0,.026-.009.057-.013.086a4.657,4.657,0,0,0-.159,1.349,27.845,27.845,0,0,0,.211,5.582c1.484,5.909,5.813,4.144,5.813,4.144,2.6-.832,4.685-8.627,4.685-8.627l.121-.33c.89-2.193,2.279-.392,2.55-.006l.014.019c.011.018.019.032.025.041a12.527,12.527,0,0,1,.822,1.461c.008.03,1.022,3.679,2.492,3.074a1.235,1.235,0,0,0,.7-.346l.035-.017c-.007,0-.018.009-.035.017a1.08,1.08,0,0,0,.092-.087,14.759,14.759,0,0,0,2.938-4.129c1-1.676,1.351-4.918,1.426-5.748a19.339,19.339,0,0,0,2.589,6.8c.452.885.959,1.556,1.5,1.687,0,0,1.121,1.025,2.234-2.7h0s2.7-7.749,2.849-8.218a6.572,6.572,0,0,1,1.586-1.843,18.477,18.477,0,0,1-.181,2.49,15.687,15.687,0,0,0,.047,2.349h0v0a4.107,4.107,0,0,0,.818,2.406s.508.972,1.155.829a3.071,3.071,0,0,0,.695-.516h0a6.935,6.935,0,0,0,1.4-1.945l.017-.028c1-1.675,2.784-4.641,2.861-4.8l5.423-10.825,0-.005c-.006.022-7.2,24.258,0,29.238a4.675,4.675,0,0,0,3.364-4.544A18.21,18.21,0,0,0,724,120.1l1.262-6.725s1.284-2.607.668-3.516a1.264,1.264,0,0,0-1.367.649,3.056,3.056,0,0,0-.4,1.9s-.653,7.8-1.736,10.442a8.919,8.919,0,0,1-.468.761s-3.112,3.648-3.342-6.138v-.008c0-.032.06-2.142.2-4.9a60.809,60.809,0,0,1,1.36-8.4h0a67.356,67.356,0,0,1,3.788-10.8l6.416-1.881,11.753-3.823s2.378-.286,2.884-.286,3.461-.11,3.785-1.478S748.981,83.834,748.8,83.621Zm-79.158,19.145c.031,0,.064,0,.094,0a2.528,2.528,0,0,1,.263.016c.034,0,.07,0,.1.007a1.732,1.732,0,0,1,.967.7,2.672,2.672,0,0,1,.36,1.458c-.08.425-.175.817-.282,1.183l-.486,1.321a6.335,6.335,0,0,1-2.214,2.839c-2.144,1.936-5.16,1.237-6.472.793h0l-.653-.248S665.862,102.891,669.643,102.765ZM720.5,97.017l-.044-.01.075-.146Z"
						transform="translate(-598.994 -74.389)"></path>
            <path
						d="M1426.416,302.385h0c.363-.7.653-1.233.653-1.233,1.3-3.2-.938-3.169-1.513-2.954s-1.154,4.075-1.262,5.552a11.321,11.321,0,0,1-1.226,3.535s-2.416,5.117-3.731,6.2c0,0-1.173,1.552-1.749-.219a23,23,0,0,1-.613-5.009,62.63,62.63,0,0,1,.468-6.453c.289-.937.686-3.065-.793-3.1,0,0-1.73-.614-1.84,2.7l.758,4.473s.4,7.641,1.622,9.084c0,0,1.334,2.037,2.306,1.018a7.874,7.874,0,0,0,1.912-3.587l1.693-3.7c.113-.246.181.254.181.254l-.192,2.143c-.052.452-.155,1.436-.255,2.856v.009h0a108.52,108.52,0,0,0,.06,15.219s1.167,14.492,2.451,19.179c.594,2.165.913,3.328,1.085,3.955v0h0l.2.727s.494,2.178,1.544.937c.975-.227-.709-4.975-.709-4.975C1419.782,317.131,1426.416,302.385,1426.416,302.385Z"
						transform="translate(-1285.475 -277.663)"></path>
          </g>
        </g>
      </svg>
			</div>
			<div class="row">
				<p id="text-center" class="centered-text">Chúng tôi tin rằng vẻ
					đẹp không chỉ đến từ sản phẩm, mà còn là nguồn cảm hứng và sự phát
					triển. Đây là nơi chúng tôi chia sẻ những thông tin, bí quyết, kiến
					thức làm đẹp để giúp bạn luôn tự tin và dẫn đầu xu hướng.</p>
			</div>
		</div>
		<div class="container_news d-flex justify-content-around ">
			<div class="row">
				<div class="card_news" style="width: 30rem;">
					<img
						src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=ee546e51-22e8-470e-844c-dc005111c002&name=top-four-ways-to-better-bone-health&inputFormat=jpg"
						class="card-img-top_news" alt="...">
					<div class="card-body_news">
						<p class="card-text_news">NỀN TẢNG KHOA HỌC</p>
						<h5 class="card-title_news">4 Bí Quyết Cho Một Hệ Xương Khỏe
							Mạnh</h5>
						<a href="#" class="btn">Tìm hiểu thêm</a>
					</div>
				</div>
				<div class="card_news" style="width: 30rem;">
					<img
						src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=d65041dd-899d-4bf1-8d36-462352da3025&name=top-hyperpalatable-foods-why-you-cant-stop-eating&inputFormat=jpg"
						class="card-img-top_news" alt="...">
					<div class="card-body_news">
						<p class="card-text_news">BÍ QUYẾT KHỎE & ĐẸP</p>
						<h5 class="card-title_news">TẠI SAO TÔI KHÔNG THỂ NGỪNG ĂN,
							ngay cả khi tôi không đói? Giải thích về thực phẩm tạo cảm giác
							ngon miệng</h5>
						<a href="#" class="btn">Tìm hiểu thêm</a>
					</div>
				</div>
			</div>
		</div>
		<!-- BRAND MISSION END -->
		<!-- COMMITENT BEGIN -->
		<div class="commit_div">
			<section class="commit_section">
				<ul class="commit_ul">
					<li class="commit_li">
						<div class="commit_img">
							<img
								src="https://media-asia-cdn.oriflame.com/contentMedia/?externalMediaId=92907f87-9ae8-4ee8-bb54-3e2e36462b6b&mimeType=image%2Fsvg%2Bxml&w=108&bc=%23f5f5f5&ib=%23f5f5f5&q=80"
								alt="">
						</div>
						<div class="commit_content">
							<h2 class="commit_title">Ưu đãi cho dịch vụ giao hàng</h2>
							<p>Miễn phí giao hàng tại nhà với đơn hàng trên 499.000đ</p>
						</div>
					</li>
					<li class="commit_li">
						<div class="commit_img">
							<img
								src="https://media-asia-cdn.oriflame.com/contentMedia/?externalMediaId=2fbb76b2-8370-46e8-80b7-04bd2d011984&mimeType=image%2Fsvg%2Bxml&w=108&bc=%23f5f5f5&ib=%23f5f5f5&q=80"
								alt="">
						</div>
						<div class="commit_content">
							<h2 class="commit_title">Hoàn tiền không giới hạn</h2>
							<p>Được hoàn tiền 15% giá trị đơn hàng khấu trừ vào đơn hàng
								tiếp theo (với Khách hàng VIP)</p>
						</div>
					</li>
					<li class="commit_li">
						<div class="commit_img">
							<img
								src="https://media-asia-cdn.oriflame.com/contentMedia/?externalMediaId=fb5d6322-ab37-432c-9f66-af3fac1f3d74&mimeType=image%2Fsvg%2Bxml&w=108&bc=%23f5f5f5&ib=%23f5f5f5&q=80"
								alt="">
						</div>
						<div class="commit_content">
							<h2 class="commit_title">Mua sản phẩm với giá ưu đãi</h2>
							<p>Được mua sản phẩm của Oriflame với giá ưu đãi giảm 10%
								trên đơn hàng đầu tiên</p>
						</div>
					</li>
				</ul>
			</section>
		</div>
		<div class="grid_template">
			<h3 class="item1">Những tiêu chuẩn của chúng tôi</h3>
			<p class="item2">Vì chúng tôi đến từ Thụy Điển nên chúng tôi có
				triết lý riêng về vẻ đẹp và cách mà chúng tôi phát triển sản phẩm.
				Ngay từ những ngày đầu, chúng tôi luôn rất trân trọng thiên nhiên,
				điều này đóng vai trò quan trọng trong mọi hoạt động và tạo dựng nên
				danh tiếng Oriflame khi mang đến những sản phẩm an toàn, đáng tin
				cậy mà vẫn tôn trọng môi trường sinh thái.</p>
			<img class="item3"
				src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=2021eadf-6964-43b0-8ab7-d70c050270ad&name=Chun-o-c-sinh-thi&inputFormat=jpg&w=440&bc=%23f5f5f5&ib=%23f5f5f5&q=40"
				alt=""> <img class="item4"
				src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=7cf538ee-9292-4ac9-b2c3-a5f44e463cc8&name=Chit-xut-t-thin-nhin&inputFormat=jpg&w=440&bc=%23f5f5f5&ib=%23f5f5f5&q=40"
				alt=""> <img class="item5"
				src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=3c2de03d-b06b-4b76-a74a-ee5a3ebaded6&name=Ht-lm-sch-t-nhin&inputFormat=jpg&w=440&bc=%23f5f5f5&ib=%23f5f5f5&q=40"
				alt=""> <img class="item6"
				src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=aaa9047b-c79d-4ee1-a6eb-9ea9d14bb70b&name=Chun-chu-u-nghim-ngt&inputFormat=jpg&w=440&bc=%23f5f5f5&ib=%23f5f5f5&q=40"
				alt=""> <img class="item7"
				src="https://media-asia-cdn.oriflame.com/contentImage?externalMediaId=e5fa4627-e409-412a-b49d-454ad490e511&name=Kim-nghim-an-ton-cao&inputFormat=jpg&w=440&bc=%23f5f5f5&ib=%23f5f5f5&q=40"
				alt="">
		</div>
		<!-- KẾT NỐI -->
		<div class="grid ">
			<h3 class="item1" style="margin-top: 50px;">Kết nối</h3>
			<div class="d-flex justify-content-center">
				<svg class="icon " xmlns="http://www.w3.org/2000/svg" width="30"
					height="30" fill="currentColor" class="bi bi-facebook"
					viewBox="0 0 16 16">
        <path class="icon"
						d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
      </svg>
				<svg class="icon" xmlns="http://www.w3.org/2000/svg" width="30"
					height="30" fill="currentColor" class="bi bi-youtube"
					viewBox="0 0 16 16">
        <path class="icon"
						d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
      </svg>
				<svg class="icon" xmlns="http://www.w3.org/2000/svg" width="30"
					height="30" fill="currentColor" class="bi bi-instagram"
					viewBox="0 0 16 16">
        <path class="icon"
						d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
      </svg>
			</div>
		</div>

		<!-- COMMITENT END -->

		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
			integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
			integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
			crossorigin="anonymous"></script>
			
			<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" 
			integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" 
			crossorigin="anonymous" 
			referrerpolicy="no-referrer"></script>
			
<!-- 		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
			crossorigin="anonymous"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
			integrity="sha512-TPh2Oxlg1zp+kz3nFA0C5vVC6leG/6mm1z9+mA81MI5eaUVqasPLO8Cuk4gMF4gUfP5etR73rgU/8PNMsSesoQ==" 
			crossorigin="anonymous"></script>
			 -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js" integrity="sha512-TPh2Oxlg1zp+kz3nFA0C5vVC6leG/6mm1z9+mA81MI5eaUVqasPLO8Cuk4gMF4gUfP5etR73rgU/8PNMsSesoQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>

</html>