<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<!-- Title Tag  -->
<!-- Favicon -->
<link rel="icon" type="image/png" href="images/favicon.png">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<!-- StyleSheet -->

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
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


<link rel="stylesheet" href="css/index.css">
<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
<link rel="stylesheet" href="../../css/custom-nav.css">

<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.css"/>">
<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick-theme.css"/>">

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
	<!-- Slider Area -->
	<section class="hero-slider mt-3 container-fluid">
		<!-- Single Slider -->
		<div class="single-item-slider">
			<c:forEach items="${listBanner }" var="b">
				<div class="carousel-item">
					<a href="/"> <img src="images/banner/${b.bannerName }"
						class="d-block w-100" alt="banner ${b.id }" height="700px">
					</a>
				</div>
			</c:forEach>
		</div>
		<!--/ End Single Slider -->
	</section>
	<!--/ End Slider Area -->

	<!-- Start Small Banner  -->
	<section class="small-banner section flash-sale-site mt-3 rounded">
		<div class="container-fluid">
			<div
				class="section-heading text-center d-flex align-items-center mb-3 p-3">
				<div class="title-flashsale mr-3">
					<h2 class="hTitle">
						<a href="#"> <img src="images/flash-sale.png" alt="Sale Off">
						</a>
					</h2>
				</div>
				<c:if test="${!checkDayTime}">
					<div class="styleCountdown d-flex align-items-center mr-3 mt-0">
						<span
							class="lof-clock-detail bg-warning text-dark rounded-3 p-2 fw-bold"
							id="your-countdown"
							data-end-day="<c:out value="${flashsale.endDay}" />"> </span>

					</div>
					<a href="collections/flashsale"
						class="view-all-collection ml-auto bg-dark text-white">Xem tất
						cả</a>
				</c:if>
				<c:if test="${checkDayTime}">
					<div class="styleCountdown d-flex align-items-center mt-0">
						<span
							class="lof-clock-detail bg-warning text-dark rounded-3 p-2 fw-bold"
							id="not-now">Hết thời gian khuyến mãi </span>

					</div>
				</c:if>
			</div>
			<div class="section-flashsale listCarousel cardProduct-flashsale">
				<c:if test="${!checkDayTime}">
					<c:forEach var="p" items="${listProduct}" varStatus="i">
						<c:forEach var="f" items="${listPdFlashsale}">
							<c:if test="${f.product.productId == p.productId}">
								<c:if test="${!p.del}">

									<div class="mb-3 ">
										<div class="card h-100 mx-3">
											<input type="hidden" name="productId" value="${p.productId}">
											<a href="/products/${p.productId}"><img
												src="images/products/${p.productImage[0].image }"
												class="card-img-top" alt="${p.productName }"
												style="height: 318px !important;"></a>
											<div class="card-body d-flex flex-column">
												<span class="text-muted">${p.manufacturerProduct.manufacturerName }</span>
												<a
													class="card-title fs-6 font-weight-bold text-black text-decoration-none"
													href="/nguyentcpc04750_ASM/products/${p.productId }"
													style="min-height: 48px">${p.productName }</a>
												<div class="price-product mb-3">
													<c:set var="foundFlashSale" value="false" />
													<c:forEach var="f" items="${listPdFlashsale}">
														<c:choose>
															<c:when test="${f.product.productId == p.productId}">
																<span class="text-decoration-line-through"
																	style="text-decoration: line-through;"> <fmt:formatNumber
																		type="number" pattern="###,###,###" value="${p.price}" />
																	đ
																</span>
																<span class="text-danger font-weight-bold"> <fmt:formatNumber
																		type="number" pattern="###,###,###"
																		value="${f.discountedPrice}" /> đ
																</span>
																<div class="position-absolute" style="top: 0; left: 0">
																	<div>
																		<span class="p-1 bg-danger text-white"> -<fmt:formatNumber
																				type="number" pattern="###,###,###"
																				value="${(p.price - f.discountedPrice)/p.price *100}" />%
																		</span>
																		<c:if test="${p.quantityInStock==0 }">
																			<span class="p-1  bg-dark text-white ms-3">Tạm
																				hết hàng</span>
																		</c:if>
																	</div>
																</div>
																<c:set var="foundFlashSale" value="true" />
															</c:when>
														</c:choose>
													</c:forEach>
													<c:if test="${!foundFlashSale}">
														<span class="text-danger fw-bold"> <fmt:formatNumber
																type="number" pattern="###,###,###" value="${p.price}" />
															đ
														</span>
													</c:if>
												</div>
												<div class="siteAction d-flex justify-content-between">
													<c:choose>
														<c:when test="${p.quantityInStock==0  }">
															<button type="button" disabled
																class="btn-outline-primary p-2  float-xl-start">Thêm
																vào giỏ</button>
															<button class="btn-outline-primary  p-2  float-xl-end"
																role="button" disabled>Mua ngay</button>
														</c:when>
														<c:otherwise>
															<button type="button"
																class="btn-outline-primary p-2 addToCart"
																data-product-id="${p.productId}"
																data-user-id="${userLogin.userId}">Thêm vào giỏ</button>
															<button class="btn-outline-primary  p-2 btnBuyNow"
																data-product-id="${p.productId}"
																data-user-id="${userLogin.userId}">Mua ngay</button>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>

								</c:if>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</section>
	<!-- End Small Banner -->

	<!-- Start Product Area -->
	<div class="product-area section">

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>Sản phẩm nổi bật</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="product-info">
						<div class="nav-main">
							<!-- Tab Nav -->
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<c:forEach items="${listCategories }" var="c" varStatus="i">
									<c:if test="${c.del }">
										<c:if test="${i.index<=5 }">
											<li class="nav-item"><a
												class="nav-link link-product-highlight ${i.index== 0?'active':'' }" data-toggle="tab"
												href="#category${c.categoryId }" role="tab">${c.categoryName }</a></li>
										</c:if>

									</c:if>
								</c:forEach>
							</ul>
							<!--/ End Tab Nav -->
						</div>
						<div class="tab-content" id="myTabContent">
							<!-- Start Single Tab -->

							<c:forEach items="${listCategories }" var="c" varStatus="i">
								<c:set var="countProduct" value="0"></c:set>
								<c:if test="${i.index<=5 }">
									<div
										class="tab-pane fade tab-product-highlight ${i.index== 0?'active show':'' }"
										id="category${c.categoryId }" role="tabpanel">
										<div class="tab-single">
											<div class="row">
												<c:forEach items="${listProduct }" var="p" varStatus="ic">
													<c:if test="${!p.del}">
														<c:if
															test="${c.categoryId == p.categoryProduct.categoryId }">
															<c:set var="countProduct" value="${countProduct+1 }"></c:set>
															<c:if test="${countProduct<=8 }">
																<div class="col-xl-3 col-lg-4 col-md-4 col-12">
																	<div class="single-product h-100">
																		<div class="product-img">
																			<a href="/products/${p.productId}"> <img
																				class="default-img"
																				src="images/products/${p.productImage[0].image }"
																				alt="${p.productName }" height="350" width="250">
																				<img class="hover-img"
																				src="images/products/${p.productImage[1].image }"
																				alt="${p.productName }" height="350" width="250">
																				<c:set var="foundFlashSale" value="false" /> <c:set
																					var="priceDiscount" value="0" /> <c:forEach
																					var="f" items="${listPdFlashsale}">
																					<c:choose>
																						<c:when
																							test="${f.product.productId == p.productId}">
																							<div>
																								<span class="out-of-stock">Giảm <fmt:formatNumber
																										type="number" pattern="###,###,###"
																										value="${(p.price - f.discountedPrice)/p.price *100}" />%
																								</span>
																							</div>

																							<c:set var="foundFlashSale" value="true" />
																							<c:set var="priceDiscount"
																								value="${f.discountedPrice }" />
																						</c:when>
																					</c:choose>
																				</c:forEach> <c:if test="${p.quantityInStock==0 }">
																					<span class="out-of-stock">Tạm hết hàng</span>
																				</c:if>
																			</a>
																			<div class="button-head">
																				<div class="product-action">
																					<a data-toggle="modal"
																						data-target="#quickProductModal"
																						title="Quick View" href="#" class="quickViews"
																						data-product-id="${p.productId}"><i
																						class=" ti-eye"></i><span>Xem nhanh</span></a> <a
																						title="Wishlist" href="#"><i
																						class=" ti-heart "
																						data-product-id="${p.productId}"
																						data-user-id="${user.userId}"></i><span>Thêm
																							vào yêu thích</span></a> <a title="Compare" href="#">
																				</div>
																				<div class="product-action-2">
																					<a title="Add to cart" href="#" class="addToCart"
																						data-product-id="${p.productId}"
																						data-user-id="${userLogin.userId}">Thêm vào
																						giỏ hàng</a>
																				</div>
																			</div>
																		</div>
																		<div class="product-content">
																			<h3 class="card-title" style="height: 48px">
																				<a href="/products/${p.productId }">${p.productName }</a>
																			</h3>
																			<div class="product-price">

																				<c:if test="${!foundFlashSale}">
																					<span class="text-danger fw-bold"> <fmt:formatNumber
																							type="number" pattern="###,###,###"
																							value="${p.price}" /> đ
																					</span>
																				</c:if>
																				<c:if test="${foundFlashSale }">
																					<span class="text-decoration-line-through"
																						style="text-decoration: line-through;"> <fmt:formatNumber
																							type="number" pattern="###,###,###"
																							value="${p.price}" /> đ
																					</span>
																					<span class="text-danger font-weight-bold">
																						<fmt:formatNumber type="number"
																							pattern="###,###,###" value="${priceDiscount}" />
																						đ
																					</span>
																				</c:if>
																			</div>
																		</div>
																	</div>
																</div>
															</c:if>

														</c:if>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
							<!--/ End Single Tab -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Product Area -->

	<!-- Start Shop Home List  -->
	<section class="shop-home-list section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-12">
					<div class="row">
						<div class="col-12">
							<div class="shop-section-title">
								<h1>Khuyến mãi</h1>
							</div>
						</div>
					</div>
					<!-- Start Single List  -->
					<c:forEach var="p" items="${listProduct}">
						<c:forEach var="f" items="${listPdFlashsale}" varStatus="i">
							<c:if test="${f.product.productId == p.productId}">
								<c:if test="${!p.del}">
									<c:if test="${i.index<4 }">
										<div class="single-list">
											<div class="row">
												<div
													class="col-lg-6 col-md-6 col-12 d-flex align-items-center justify-content-center list-image overlay">
													<div class="">
														<img src="images/products/${p.productImage[0].image }"
															alt="${p.productName }"
															style="height: 115px !important; width: 100% !important">
														<a href="/add-to-cart/${p.productId }"
															data-product-id="${p.productId}"
															data-user-id="${userLogin.userId}" class="buy addToCart"><i
															class="fa fa-shopping-bag"></i></a>
													</div>
												</div>
												<div class="col-lg-6 col-md-6 col-12 no-padding">
													<div class="content">
														<h4 class="title">
															<a href="/product/${p.productId }">${p.productName }</a>
														</h4>
														<p class="price with-discount">
															<fmt:formatNumber type="number" pattern="###,###,###"
																value="${f.discountedPrice }" />
															đ
														</p>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:if>
							</c:if>
						</c:forEach>
					</c:forEach>
					<!-- End Single List  -->

				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<div class="row">
						<div class="col-12">
							<div class="shop-section-title">
								<h1>Bán chạy</h1>
							</div>
						</div>
					</div>
					<!-- Start Single List  -->
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="https://via.placeholder.com/115x140" alt="#"> <a
										href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h5 class="title">
										<a href="#">Licity jelly leg flat Sandals</a>
									</h5>
									<p class="price with-discount">$65</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single List  -->
					<!-- Start Single List  -->
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="https://via.placeholder.com/115x140" alt="#"> <a
										href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h5 class="title">
										<a href="#">Licity jelly leg flat Sandals</a>
									</h5>
									<p class="price with-discount">$33</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single List  -->
					<!-- Start Single List  -->
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="https://via.placeholder.com/115x140" alt="#"> <a
										href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h5 class="title">
										<a href="#">Licity jelly leg flat Sandals</a>
									</h5>
									<p class="price with-discount">$77</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single List  -->
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<div class="row">
						<div class="col-12">
							<div class="shop-section-title">
								<h1>Xem nhiều</h1>
							</div>
						</div>
					</div>
					<!-- Start Single List  -->
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="https://via.placeholder.com/115x140" alt="#"> <a
										href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h5 class="title">
										<a href="#">Licity jelly leg flat Sandals</a>
									</h5>
									<p class="price with-discount">$22</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single List  -->
					<!-- Start Single List  -->
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="https://via.placeholder.com/115x140" alt="#"> <a
										href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h5 class="title">
										<a href="#">Licity jelly leg flat Sandals</a>
									</h5>
									<p class="price with-discount">$35</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single List  -->
					<!-- Start Single List  -->
					<div class="single-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<div class="list-image overlay">
									<img src="https://via.placeholder.com/115x140" alt="#"> <a
										href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 no-padding">
								<div class="content">
									<h5 class="title">
										<a href="#">Licity jelly leg flat Sandals</a>
									</h5>
									<p class="price with-discount">$99</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single List  -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Home List  -->

	<!-- Start Cowndown Area -->
	<c:set var="maxDiscountProduct" value="${null}" />
	<c:set var="maxDiscount" value="0" />
	<c:set var="priceDiscountDeal" value="0"></c:set>
	<c:forEach var="p" items="${listProduct}" varStatus="i">
		<c:forEach var="f" items="${listPdFlashsale}">
			<c:if test="${f.product.productId == p.productId && !p.del}">
				<c:set var="discountPercentage"
					value="${(p.price - f.discountedPrice) / p.price * 100}" />
				<c:if test="${discountPercentage > maxDiscount}">
					<c:set var="maxDiscountProduct" value="${p}" />
					<c:set var="maxDiscount" value="${discountPercentage}" />
					<c:set var="priceDiscountDeal" value="${f.discountedPrice }">
					</c:set>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
	<section class="cown-down">
		<div class="section-inner ">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6 col-12 padding-right">
						<div class="image">
							<img
								src="images/products/${maxDiscountProduct.productImage[0].image }"
								alt="${maxDiscountProduct.productImage[0].image }">
						</div>
					</div>
					<div class="col-lg-6 col-12 padding-left">
						<div class="content">

							<div class="heading-block">
								<p class="small-title">GIẢM GIÁ CỦA NGÀY</p>
								<h3 class="title">${maxDiscountProduct.productName}</h3>
								<p class="text">${maxDiscountProduct.productDetailDescription[0].description }</p>
								<h1 class="price">
									<fmt:formatNumber type="number" pattern="###,###,###"
										value="${priceDiscountDeal}" />
									đ<s><fmt:formatNumber type="number" pattern="###,###,###"
											value="${maxDiscountProduct.price}" /> đ</s>
								</h1>
								<div class="coming-time">
									<div class="clearfix"
										data-countdown="<c:out value="${flashsale.endDay}" />"></div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /End Cowndown Area -->

	<!-- Start Shop Services Area -->
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
	<!-- End Shop Services Area -->
	<!-- Modal -->
	<div class="modal fade" id="quickProductModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span class="ti-close" aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row no-gutters">
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner"></div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
							<!-- End Product slider -->
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
							<div class="quickview-content">
								<h2 class="" id="quick-title-product"></h2>
								<div class="quickview-ratting-review">
									<!-- <div class="quickview-ratting-wrap">
										<div class="quickview-ratting">
											<i class="yellow fa fa-star"></i> <i
												class="yellow fa fa-star"></i> <i class="yellow fa fa-star"></i>
											<i class="yellow fa fa-star"></i> <i class="fa fa-star"></i>
										</div>
										<a href="#"> (1 customer review)</a>
									</div> -->
									<div class="quickview-stock">
										<span id="qtyStock"></span>
									</div>
								</div>
								<div class="d-flex" id="review-product-price"></div>
								<div class="quickview-peragraph mb-3" id="quickview-description">

								</div>
								<div class="quantity">
									<!-- Input Order -->
									<div class="input-group">
										<div class="button minus">
											<button type="button" class="btn btn-primary btn-number"
												disabled="disabled" data-type="minus" data-field="quant[1]">
												<i class="ti-minus"></i>
											</button>
										</div>
										<input type="text" name="quant[1]" class="input-number qty"
											data-min="1" data-max="1000" value="1">
										<div class="button plus">
											<button type="button" class="btn btn-primary btn-number"
												data-type="plus" data-field="quant[1]">
												<i class="ti-plus"></i>
											</button>
										</div>
									</div>
									<!--/ End Input Order -->
								</div>
								<div class="add-to-cart">
									<a href="#" class="btn addToCart" data-product-id=""
										data-user-id="${userLogin.userId}">Thêm vào giỏ hàng</a> <a
										href="#" class="btn min"><i class="ti-heart"></i></a>
									<!--  <a href="#"
										class="btn min"><i class="fa fa-compress"></i></a> -->
								</div>
								<!-- <div class="default-social">
									<h4 class="share-now">Share:</h4>
									<ul>
										<li><a class="facebook" href="#"><i
												class="fa fa-facebook"></i></a></li>
										<li><a class="twitter" href="#"><i
												class="fa fa-twitter"></i></a></li>
										<li><a class="youtube" href="#"><i
												class="fa fa-pinterest-p"></i></a></li>
										<li><a class="dribbble" href="#"><i
												class="fa fa-google-plus"></i></a></li>
									</ul>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->

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
	<!-- 
	<script src="js/colors.js"></script> -->
	<!-- Slicknav JS -->
	<script src="js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<script src="js/waypoints.min.js"></script>
	<!-- Countdown JS -->
	<script src="js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="js/nicesellect.js"></script>
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
	<script src="js/jquery.countdown.js"></script>
	<script
		src="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.js"/>"></script>


	<script src="js/choose-product.js"></script>
	<script src="js/cart-script.js"></script>

	<script type="text/javascript">
		$('.single-item-slider').slick({
			dots : true,
			autoplay : true,
			autoplaySpeed : 1500,
			infinite : true,
			adaptiveHeight : true,
			arrows : true,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 2,
					infinite : true,
					dots : true
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 2
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1
				}
			} ]
		});

		document.addEventListener("DOMContentLoaded", function() {
			let cardTitles = document.querySelectorAll(".card-title");
			cardTitles.forEach(function(cardTitle) {
				cardTitle.classList.add("clamp-two-lines");
			});
			console.log(1123)
			let endDay = $('#your-countdown').data('end-day');
			let countdownElement = $('#your-countdown');

			// Chuyển đổi dữ liệu từ thuộc tính 'data-end-day' thành đối tượng Date
			let endDate = new Date(endDay);
			let currentDate = new Date();
			console.log(endDate)
			// Kiểm tra nếu ngày hiện tại lớn hơn ngày kết thúc khuyến mãi
			if (currentDate > endDate) {
				// Hiển thị dòng text "Khuyến mãi đã kết thúc" thay vì countdown
				countdownElement.html('Khuyến mãi đã kết thúc');
			} else {
				// Thực hiện countdown
				countdownElement.countdown(endDate, function(event) {
					$(this).html(
							event.strftime('%D ngày %H giờ %M phút %S giây'));
				});
			}
		});

		$('.cardProduct-flashsale').slick({

			dots : true,
			autoplay : false,
			infinite : true,
			slidesToShow : 4,
			slidesToScroll : 4,
			adaptiveHeight : true,
			arrows : true,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 2,
					infinite : true,
					dots : true
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 2
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1
				}
			} ]
		});
	</script>

</body>
</html>