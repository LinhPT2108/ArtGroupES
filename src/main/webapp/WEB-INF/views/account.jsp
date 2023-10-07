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
	<div class="container my-5 p-1">
		<div class="row">
			<div class="col-12 col-md-3">
				<div
					class="d-flex  border border-right-0 border-top-0 border-left-0 pb-2">
					<div class="avatar">
						<img alt="" src="../../images/PC04750.jpg" class="rounded-circle"
							width="60px" height="60px">
					</div>
					<div class="username p-2 d-flex flex-column">
						<span class="font-weight-bold">nguyentcpc04750</span>
						<div class="bot">
							<i class="ti ti-pencil"></i> <span>Sửa hồ sơ</span>
						</div>
					</div>
				</div>

				<div class="list-option mt-2">
					<div id="accordion">
						<div class="border-0 mb-2">
							<div class="bg-white p-0" id="headingOne">
								<a
									class="btn-default border-0 bg-white font-weight-normal stardust-dropdown"
									data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne"> <i
									class="ti ti-user mr-2"></i>Tài khoản của tôi
								</a>
							</div>
							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordion">
								<div class="px-4">
									<div class="list-group list-group-flush">
										<a href="/account/profile"
											class="list-group-item list-group-item-action item-custom item-custom-option">Hồ
											sơ</a> <a href="/account/address"
											class="list-group-item list-group-item-action item-custom item-custom-option">Địa
											chỉ</a> <a href="/account/change-password"
											class="list-group-item list-group-item-action item-custom item-custom-option">Đổi
											mật khẩu</a>
									</div>
								</div>
							</div>
						</div>
						<div class=" border-0 mb-1">
							<div class=" bg-white p-0" id="headingTwo">
								<a
									class="btn-default border-0 bg-white font-weight-normal stardust-dropdown"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="true" aria-controls="collapseTwo"> <i
									class="ti ti-clipboard mr-2"></i>Đơn mua
								</a>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordion">
								<div class="px-4">
									<div class="list-group list-group-flush">
										<a href="/account/purchased-order"
											class="list-group-item list-group-item-action item-custom  item-custom-option">Hoàn
											thành</a> <a href="#"
											class="list-group-item list-group-item-action item-custom item-custom-option">Đang
											giao hàng</a> <a href="#"
											class="list-group-item list-group-item-action item-custom item-custom-option">Đang
											xử lí</a>
									</div>
								</div>
							</div>
						</div>
						<div class="border-0 mb-1">
							<a
								class="btn-default border-0 bg-white font-weight-normal stardust-dropdown item-custom p-0"
								href="/account/wish-list"> <i class="ti ti-heart mr-2"></i>Sản
								phẩm yêu thích
							</a>
						</div>
						<div class="border-0 mb-1">
							<a
								class="btn-default border-0 bg-white font-weight-normal stardust-dropdown item-custom p-0"
								href="/account/viewed-list"> <i class="ti ti-eye mr-2"></i>Sản phẩm đã xem
							</a>
						</div>
					</div>

				</div>
			</div>
			<div
				class="col-12 col-md-9 border border-bottom-0 border-right-0 border-top-0 ">
				<jsp:include page="component/${views }.jsp"></jsp:include>
			</div>
		</div>
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
	<c:if test="${views =='address'}">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
		<script src="../../js/address.js"></script>
	</c:if>
	<c:if test="${views =='wish-list'||views =='viewed-list'}">
		<script src="../../js/isotope.pkgd.js"></script>
		<script src="../../js/filter.js"></script>
	</c:if>

	<script>
		var currentURL = window.location.pathname;
		var allCollapses = document.querySelectorAll(".collapse");
		allCollapses.forEach(function(collapse) {
			if (collapse !== collapseParent) {
				collapse.classList.remove("show");
			}
		});
		var links = document.querySelectorAll(".item-custom");
		console.log(links)
		links.forEach(function(link) {
			if (link.getAttribute("href") === currentURL) {
				link.classList.add("focus-item");
			}
		});
		var focusItem = document.querySelector(".focus-item");

		if (focusItem) {
			var collapseParent = focusItem.closest(".collapse");

			if (collapseParent) {
				collapseParent.classList.add("show");
			}
		}
	</script>


</body>
</html>