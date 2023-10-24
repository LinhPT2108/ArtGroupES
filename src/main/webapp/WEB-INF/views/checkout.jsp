<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- Meta Tag -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='copyright' content=''>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title Tag  -->
<title>Thanh toán</title>
<!-- Favicon -->
<link rel="icon" type="image/png" href="images/favicon.png">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<!-- StyleSheet -->

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome.css">
<!-- Fancybox -->
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<!-- Themify Icons -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="css/niceselect.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet" href="css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet" href="css/slicknav.min.css">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="../../css/custom-nav.css">

<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
<link rel="stylesheet" href="../../css/custom-nav.css">

<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap-icons/1.10.5/font/bootstrap-icons.css" />">


</head>
<body class="js">

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- End Preloader -->

	<!-- Header -->
	<jsp:include page="component/_header.jsp"></jsp:include>
	<!--/ End Header -->

	<!-- Breadcrumbs -->
	<!-- <div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Cart</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- End Breadcrumbs -->

	<!-- Shopping Cart -->
	<section class="shop checkout section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="checkout-form">
						<h2>THANH TOÁN ĐƠN HÀNG CỦA BẠN TẠI ĐÂY</h2>
						<p>Vui lòng kiểm tra thông tin giao hàng</p>
						<!-- Form -->
						<form:form cssClass="form" method="post" action="#"
							modelAttribute="iv">
							<div class="row">
								<div class=" col-12">
									<div class="form-group">
										<div class="input-group-prepend">
											<label class="input-group-text font-weight-bold"
												for="address">Địa chỉ</label>
										</div>
										<c:choose>
											<c:when test="${listAddress.size()==0}">
												<a class="btn text-white" href="/account/address">Thêm
													địa chỉ</a>
											</c:when>
											<c:otherwise>
												<select class="custom-select" id="address">
													<option selected>Chọn địa chỉ...</option>
													<c:forEach items="${listAddress }" var="a">
														<option value="${a.phoneNumber }" class="font-weight-bold">
															SĐT: ${a.phoneNumber }; ĐC: ${a.address }</option>
													</c:forEach>
												</select>
											</c:otherwise>
										</c:choose>
										<small class="text-danger" id="addressError"></small>
									</div>
								</div>
							</div>
						</form:form>
						<!--/ End Form -->
					</div>
				</div>
				<div class="col-lg-4 col-12">
					<div class="order-details">
						<!-- Order Widget -->

						<c:if test="${totalPriceInCart>0 }">
							<div class="single-widget">
								<h2>THÔNG TIN THANH TOÁN</h2>
								<div class="content">
									<ul>
										<li>Tổng tiền <span id="totalCart"><fmt:formatNumber
													type="number" pattern="###,###,###"
													value="${totalPriceInCart}" /> ₫</span></li>
										<li>(+) Vận chuyển <span> <c:choose>
													<c:when test="${totalPriceInCart >3000000}">
													Miễn phí
												</c:when>
													<c:otherwise>
													50,000 ₫
												</c:otherwise>
												</c:choose>
										</span></li>
										<li class="last">Tổng cộng: <span id="totalPriceAmount">
												<fmt:formatNumber type="number" pattern="###,###,###"
													value="${totalPriceInCart>3000000?totalPriceInCart:totalPriceInCart+50000}" />
												₫
										</span></li>
									</ul>
								</div>
							</div>
						</c:if>
						<!--/ End Order Widget -->
						<!-- Order Widget -->
						<div class="single-widget">
							<h2>THANH TOÁN</h2>
							<div class="content mt-3">
								<div class="form-check ml-5">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios1" value="option1"
										checked> <label class="form-check-label"
										for="exampleRadios1">Thanh toán khi nhận hàng</label>
								</div>
								<div class="form-check ml-5">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										Ví ArtPay</label>
								</div>
							</div>
						</div>
						<!--/ End Order Widget -->
						<!-- Payment Method Widget -->
						<div class="single-widget payement">
							<div class="content">
								<img src="images/payment-method.png" alt="#">
							</div>
						</div>
						<!--/ End Payment Method Widget -->
						<!-- Button Widget -->
						<div class="single-widget get-button">
							<div class="content">
								<div class="button">
									<a href="/checkout" class="btn" id="postCheckout">ĐẶT HÀNG</a>
								</div>
							</div>
						</div>
						<!--/ End Button Widget -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Checkout -->


	<!-- Start Shop Services Area  -->
	<section class="shop-services section home">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>MIỄN PHÍ VẬN CHUYỂN</h4>
						<p>Đơn hàng trên 3.000.000 đ</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>ĐỔI TRẢ MIỄN PHÍ</h4>
						<p>Trong vòng 30 ngày</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>THANH TOÁN AN TOÀN</h4>
						<p>An toàn 100%</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>GIÁ TỐT NHẤT</h4>
						<p>GIÁ CẢ ĐẢM BẢO</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Newsletter -->


	<!-- Start Footer Area -->
	<jsp:include page="component/_footer.jsp"></jsp:include>
	<!-- /End Footer Area -->

	<!-- Jquery -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.0.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Color JS -->
	<!-- Slicknav JS -->
	<script src="js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="js/magnific-popup.js"></script>
	<!-- Fancybox JS -->
	<script src="js/facnybox.min.js"></script>
	<!-- Waypoints JS -->
	<script src="js/waypoints.min.js"></script>
	<!-- Countdown JS -->
	<script src="js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="js/nicesellect.js"></script>
	<!-- Ytplayer JS -->
	<script src="js/ytplayer.min.js"></script>
	<!-- Flex Slider JS -->
	<script src="js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="js/easing.js"></script>
	<!-- Active JS -->
	<script src="js/active.js"></script>
	<script src="js/cart-script.js"></script>

	<script src="js/checkout.js"></script>
</body>
</html>