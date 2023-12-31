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
<link rel="stylesheet" href="../css/login.css">

<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
<c:if test="${views =='address'}">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.15.2/css/selectize.default.min.css"
		integrity="sha512-pTaEn+6gF1IeWv3W1+7X7eM60TFu/agjgoHmYhAfLEU8Phuf6JKiiE8YmsNC0aCgQv4192s4Vai8YZ6VNM6vyQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.15.2/js/selectize.min.js"
		integrity="sha512-IOebNkvA/HZjMM7MxL0NYeLYEalloZ8ckak+NDtOViP7oiYzG5vn6WVXyrJDiJPhl4yRdmNAG49iuLmhkUdVsQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</c:if>
<c:if test="${views =='purchasedOrder'}">
	<link rel="stylesheet" href="../../css/purchased-order.css">
</c:if>
<link rel="stylesheet" href="../../css/profile.css">
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

	<!-- main content  -->
	<div
		class="container my-5 d-flex justify-content-center align-items-center formRegister">
		<form action="/account/verify-code/${userRegister.userId }"
			method="post" id="formVerify">
			<div class="card-login p-5">
				<a class="login">Xác thực tài khoản</a> <span class="">Vui
					lòng kiểm tra email của bạn và nhập mã xác nhận vào đây.</span>
				<div class="group-input w-100">
					<div class="inputBox">
						<input type="text" data-id="${userRegister.userId }" name="verifyCode" required="required" /> <span>Mã
							xác nhận:</span>
					</div>
					<small class="text-danger" id="verifyError"></small>
				</div>

				<button class="enter btnRegister">Xác nhận</button>
				<span>BẠN LÀ THÀNH VIÊN, ĐĂNG NHẬP <a href="/login"
					class="btnLogin"><u>TẠI ĐÂY.</u></a></span>
			</div>
		</form>
	</div>

	<!-- Start Footer Area -->
	<jsp:include page="component/_footer.jsp"></jsp:include>
	<!-- /End Footer Area -->

	<!-- Jquery -->

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
	<script src="../../js/verify-code.js"></script>



</body>
</html>