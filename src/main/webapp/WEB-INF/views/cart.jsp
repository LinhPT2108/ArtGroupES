<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Giỏ hàng</title>
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
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					<c:choose>
						<c:when test="${sizeInCart==0 }">
							<div
								class="nothing d-flex flex-column align-items-center justify-content-center">
								<i class="bi bi-cart-x display-1"></i> <span>Chưa có sản
									phẩm</span> <a href="/" class="btn text-white">TIẾP TỤC MUA SẮM</a>
							</div>
						</c:when>
						<c:otherwise>
							<table class="table shopping-summery">
								<thead>
									<tr class="main-hading">
										<th>Ảnh</th>
										<th>Tên sản phẩm</th>
										<th class="text-center">Giá</th>
										<th class="text-center">Số lượng</th>
										<th class="text-center">Tổng cộng</th>
										<th class="text-center"><!-- <a href="/cart/remove-all"><i
												class="ti-trash remove-icon"></i></a> --></th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="cart" items="${carts}">
										<tr id="${cart.cartId }">
											<td class="image" data-title="Ảnh"><img
												src="images/products/${cart.product.productImage[0].image }"
												alt="${cart.product.productName}"></td>
											<td class="product-des" data-title="Sản phẩm" width="400px">
												<p class="product-name">
													<a href="/products/${cart.product.productId }">${cart.product.productName}</a>
												</p>
												<p class="product-des">Thương hiệu:
													${cart.product.manufacturerProduct.manufacturerName };
													Loại: ${cart.product.categoryProduct.categoryName }</p>
											</td>
											<c:set var="priceAndQty" value="0"></c:set>
											<td class="price" data-title="Giá" width="140px"><c:choose>
													<c:when test="${isFlashSale}">
														<c:choose>
															<c:when
																test="${cart.product.productPromotionalDetails[0] != null}">
																<del>
																	<span
																		class="text-muted text-decoration-line-through me-2"><fmt:formatNumber
																			type="number" pattern="###,###,###"
																			value="${cart.product.price}" /> ₫</span>
																</del>
																<span class="fw-bold float-end text-danger"> <fmt:formatNumber
																		type="number" pattern="###,###,###"
																		value="${cart.product.productPromotionalDetails[0].discountedPrice}" />
																	₫
																</span>
																<c:set var="priceAndQty"
																	value="${cart.product.productPromotionalDetails[0].discountedPrice}"></c:set>
															</c:when>
															<c:otherwise>
																<span class="fw-bold float-end text-danger"><fmt:formatNumber
																		type="number" pattern="###,###,###"
																		value="${cart.product.price}" /> ₫</span>
																<c:set var="priceAndQty" value="${cart.product.price}"></c:set>

															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<span class="fw-bold float-end text-danger"><fmt:formatNumber
																type="number" pattern="###,###,###"
																value="${cart.product.price}" /> ₫</span>
														<c:set var="priceAndQty" value="${cart.product.price}"></c:set>
													</c:otherwise>
												</c:choose></td>
											<td class="qty" data-title="Số lượng" width="100px">
												<!-- Input Order -->
												<div class="input-group">
													<div class="button minus">
														<button type="button" class="btn btn-primary btn-number"
															data-type="minus" data-field="quant[${cart.cartId }]">
															<i class="ti-minus"></i>
														</button>
													</div>

													<input type="number" name="quant[${cart.cartId }]"
														class="input-number input-quantity" data-min="1"
														data-max="${cart.product.quantityInStock}"
														value="${cart.quantity}"
														onchange="changeQuantityProduct(`${cart.cartId}`, `${cart.product.productId}`,this.value,`${cart.product.quantityInStock}`,`${priceAndQty }` )">
													<div class="button plus">
														<button type="button" class="btn btn-primary btn-number"
															data-type="plus" data-field="quant[${cart.cartId }]">
															<i class="ti-plus"></i>
														</button>
													</div>
												</div> <!--/ End Input Order -->
											</td>
											<td class="total-amount${cart.cartId }"
												data-title="Tổng cộng" width="150px"><fmt:formatNumber
													type="number" pattern="###,###,###"
													value="${cart.quantity * priceAndQty }" /> ₫</td>
											<td class="action" data-title="Xóa tất cả" width="50px"><button
													onclick="removeCartItem2(${cart.cartId}, this)">
													<i class="ti-trash remove-icon"></i>
												</button></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
					<!--/ End Shopping Summery -->
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Total Amount -->
					<div class="total-amount">
						<div class="row">
							<div class="col-lg-8 col-md-5 col-12">
								<!-- <div class="left">
									<div class="coupon">
										<form action="#" target="_blank">
											<input name="Coupon" placeholder="Enter Your Coupon">
											<button class="btn">Apply</button>
										</form>
									</div>
									<div class="checkbox">
										<label class="checkbox-inline" for="2"><input
											name="news" id="2" type="checkbox"> Shipping (+10$)</label>
									</div>
								</div> -->
							</div>
							<div class="col-lg-4 col-md-7 col-12">
								<c:if test="${totalPriceInCart>0 }">
									<div class="right">
										<ul>
											<li>Tổng tiền giỏ hàng: <span id="totalCart"><fmt:formatNumber
														type="number" pattern="###,###,###"
														value="${totalPriceInCart}" /> ₫</span>
											</li>
											<li>Vận chuyển:<span id="ship"> <c:choose>
														<c:when test="${totalPriceInCart >3000000}">
													Miễn phí
												</c:when>
														<c:otherwise>
													50,000 ₫
												</c:otherwise>
													</c:choose>
											</span></li>
											<!-- <li>You Save<span>$20.00</span></li> -->
											<li class="last">Tổng tiền:<span id="totalPriceAmount">
													<fmt:formatNumber type="number" pattern="###,###,###"
														value="${totalPriceInCart>3000000?totalPriceInCart:totalPriceInCart+50000}" />
													₫
											</span></li>
										</ul>
										<div class="button5">
											<a href="/checkout" class="btn">THANH TOÁN</a> <a href="/"
												class="btn">TIẾP TỤC MUA SẮM</a>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<!--/ End Total Amount -->
				</div>
			</div>
		</div>
	</div>
	<!--/ End Shopping Cart -->

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
</body>
</html>