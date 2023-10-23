<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<!-- Title Tag  -->
<!-- Favicon -->
<link rel="icon" type="image/png" href="../../images/favicon.png">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<!-- StyleSheet -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- Jquery -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="../../css/magnific-popup.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../../css/font-awesome.css">
<!-- Fancybox -->
<link rel="stylesheet" href="../../css/jquery.fancybox.min.css">
<!-- Themify Icons -->
<link rel="stylesheet" href="../../css/themify-icons.css">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="../../css/niceselect.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="../../css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet" href="../../css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="../../css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet" href="../../css/slicknav.min.css">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="../../css/reset.css">
<link rel="stylesheet" href="../../style.css">
<link rel="stylesheet" href="../../css/responsive.css">

<link rel="stylesheet" href="../../css/custom-nav.css">


<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
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
	<main style="margin: 50px 0px">
		<div class="container">
			<div class=" d-flex align-items-center justify-content-center">
				<div class="card shadow border-0">
					<div class="card-body p-0">
						<div class="row">
							<div class="col-12">
								<div class="px-4">
									<h2
										class="text-muted fw-bold text-center my-4 animate__animated animate__fadeInDown titlePass">Gửi
										mã xác nhận</h2>
									<form id="forgotPasswordForm"
										action="/nguyentcpc04750_ASM/account/forgot-password"
										method="post" class="needs-validation" novalidate>
										<div class="form-group  mb-3" id="site-email">
											<label for="email"
												class="form-label animate__animated animate__fadeInRightBig">Email:</label>
											<div class="input-group">
												<input type="text"
													class="form-control animate__animated animate__fadeInRight"
													id="email" name="email" placeholder="abc123@gmail.com"
													required="required" pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$" autocomplete="none">
												<button class="btn btn-outline-secondary" type="button"
													id="button-sendcode">
													<div
														class="d-none d-flex justify-content-center align-items-center position-absolute top-50 start-50 translate-middle"
														style="z-index: 999;">
														<div class="spinner-border text-success d-none" role="status" id="loading">
															<span class="visually-hidden">Loading...</span>
														</div>
													</div>
													Send code
												</button>
											</div>
											<small class="text-danger d-none" id="emailError"></small>
										</div>

										<div class="d-none" id="site-change">
											<div class="form-group mb-3">
												<label for="veriCode"
													class="form-label animate__animated animate__fadeInRightBig">Mã
													xác nhận:</label> <input type="number"
													class="form-control animate__animated animate__fadeInRight"
													id="veriCode" name="veriCode"
													placeholder="Mã xác nhận gồm 6 số" required="required"
													maxlength="6"> <small class="text-danger d-none"
													id="veriCodeError"></small>

											</div>
											<div class="form-group mb-3">
												<label for="newPassword"
													class="form-label animate__animated animate__fadeInRightBig">Mật
													khẩu mới:</label> <input type="password"
													class="form-control animate__animated animate__fadeInRight"
													id="newPassword" name="newPassword" placeholder=""
													required="required"> <small
													class="text-danger d-none" id="passError"></small>
											</div>
											<div class="form-group mb-3">
												<label for="confirmPassword"
													class="form-label animate__animated animate__fadeInRightBig">Xác
													nhận mật khẩu:</label> <input type="password"
													class="form-control animate__animated animate__fadeInRight"
													id="confirmPassword" name="confirmPassword" placeholder=""
													required="required"> <small
													class="text-danger d-none" id="confirmPassErorr"></small>
											</div>
											<div class="d-grid gap-2 mx-auto mb-3">
												<button
													class="btn btn-outline-primary animate__animated animate__fadeInUp"
													type="submit">Cập nhật</button>
											</div>
										</div>

									</form>
								</div>
							</div>
							<div class="siteReturn d-flex justify-content-center m-3">
								<a type="button" class="btn btn-outline-secondary text-white"
									href="/nguyentcpc04750_ASM/home-page"><i
									class="bi bi-arrow-left"></i>Quay trở về trang chủ</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>
	<!--/ End Header -->


	<!-- Start Footer Area -->
	<jsp:include page="component/_footer.jsp"></jsp:include>
	<!-- /End Footer Area -->



	<script src="../../js/jquery-migrate-3.0.0.js"></script>
	<script src="../../js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="../../js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="../../js/bootstrap.min.js"></script>
	<!-- Color JS -->
	<!-- 
	<script src="../../js/colors.js"></script> -->
	<!-- Slicknav JS -->
	<script src="../../js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="../../js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="../../js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<script src="../../js/waypoints.min.js"></script>
	<!-- Countdown JS -->
	<script src="../../js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="../../js/nicesellect.js"></script>
	<!-- Flex Slider JS -->
	<script src="../../js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="../../js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="../../js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="../../js/easing.js"></script>
	<!-- Active JS -->
	<script src="../../js/active.js"></script>
	<script src="../../js/hover-nav.js"></script>
	<script src="../../js/cart-script.js"></script>
	<script src="../../js/forgetPass.js"></script>
</body>
</html>