<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<!-- Title Tag  -->
<!-- Favicon -->
<link rel="icon" type="image/png" href="../images/favicon.png">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<!-- StyleSheet -->

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="../css/magnific-popup.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../css/font-awesome.css">
<!-- Fancybox -->
<link rel="stylesheet" href="../css/jquery.fancybox.min.css">
<!-- Themify Icons -->
<link rel="stylesheet" href="../css/themify-icons.css">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="../css/niceselect.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="../css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet" href="../css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="../css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet" href="../css/slicknav.min.css">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="../css/responsive.css">


<link rel="stylesheet" href="../css/index.css">
<script
	src="<c:url value=" /webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="
						/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css" />">
<link rel="stylesheet" href="../../css/custom-nav.css">

<link rel="stylesheet"
	href="<c:url value=" /webjars/slick-carousel/1.8.1/slick/slick.css" />">
<link rel="stylesheet"
	href="<c:url value=" /webjars/slick-carousel/1.8.1/slick/slick-theme.css" />
					">

<link rel="stylesheet"
	href="<c:url value="
						/webjars/bootstrap-icons/1.10.5/font/bootstrap-icons.css" />">
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
	<c:choose>
		<c:when test="${siteFlashSale}">
			<section class="site-title">
				<div
					class="section-heading text-center d-flex align-items-center mt-3 mb-3 p-3">
					<div class="title-flashsale mr-3">
						<h2 class="hTitle">
							<a href="#"> <img src="../images/flash-sale.png"
								alt="Sale Off">
							</a>
						</h2>
					</div>
					<c:if test="${!checkDayTime}">
						<div class="styleCountdown d-flex align-items-center mr-3 mt-0">
							<span
								class="lof-clock-detail bg-warning text-dark rounded-3 p-2 fw-bold"
								id="your-countdown"
								data-end-day="<c:out value="
												${flashsale.endDay}" />">
							</span>

						</div>
					</c:if>
					<c:if test="${checkDayTime}">
						<div class="styleCountdown d-flex align-items-center mt-0">
							<span
								class="lof-clock-detail bg-warning text-dark rounded-3 p-2 fw-bold"
								id="not-now">Hết thời gian khuyến mãi </span>

						</div>
					</c:if>
				</div>
			</section>
			<div class="container ">
				<div class="filter-listProduct p-3 mt-3">
					<div class="row">
						<div
							class="col-xs-12 col-md-12 col-lg-4 d-flex align-items-center">
							<div class="">
								<span class="fw-bold display-6 my-auto"><i
									class="bi bi-funnel"></i>Bộ lọc |</span>
							</div>
						</div>
						<c:if test="${!catemanu }">
							<div class="col-xs-4 col-md-4 col-lg-2">
								<div class="dropdown">
									<button
										class="btn btn-default border fw-bold dropdown-toggle p-4"
										type="button" id="dropdownMenuButton" data-toggle="dropdown"
										aria-expanded="false">Thương hiệu</button>
									<ul class="dropdown-menu px-4"
										aria-labelledby="dropdownMenuButton">
										<c:forEach var="mn" items="${listBrands}">
											<c:if test="${mn.del }">
												<li class=""><input
													class="form-check-input filter-checkbox brand-checkbox"
													type="checkbox" value="${mn.manufacturerName }"
													id="${mn.manufacturerName }"> <label
													class="form-check-label" for="${mn.manufacturerName }">${mn.manufacturerName}</label>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-xs-4 col-md-4 col-lg-2">
								<div class="dropdown">
									<button
										class="btn btn-default border fw-bold dropdown-toggle p-4"
										type="button" id="dropdownMenuButton" data-toggle="dropdown"
										aria-expanded="false">Phân loại</button>
									<ul class="dropdown-menu px-4"
										aria-labelledby="dropdownMenuButton">
										<c:forEach var="ca" items="${listCategories}">
											<c:if test="${ca.del }">
												<li class=""><input
													class="form-check-input filter-checkbox category-checkbox"
													type="checkbox" value="${ca.categoryName }"
													id="${ca.categoryName }"> <label
													class="form-check-label" for="${ca.categoryName}">${ca.categoryName
																		}</label></li>

											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>
						<div class="col-xs-4 col-md-4 col-lg-2">
							<div class="dropdown">
								<button
									class="btn btn-default border fw-bold dropdown-toggle  p-4"
									type="button" id="dropdownMenuButton2" data-toggle="dropdown"
									aria-expanded="false">Lọc giá</button>
								<ul class="dropdown-menu px-4"
									aria-labelledby="dropdownMenuButton2" style="min-width: 200px">
									<li class=""><input
										class="form-check-input filter-checkbox price-checkbox"
										type="checkbox" value="5000000" id="checkbox1"> <label
										class="form-check-label" for="checkbox1">Dưới
											5.000.000 đ</label></li>
									<li class="mt-2"><input
										class="form-check-input filter-checkbox price-checkbox"
										type="checkbox" value="10000000" id="checkbox2"> <label
										class="form-check-label" for="checkbox2">Dưới
											10.000.000 đ</label></li>
									<li class="mt-2"><input
										class="form-check-input filter-checkbox price-checkbox"
										type="checkbox" value="15000000" id="checkbox3"> <label
										class="form-check-label" for="checkbox3">Dưới
											15.000.000 đ</label></li>
									<li class="mt-2"><input
										class="form-check-input filter-checkbox price-checkbox"
										type="checkbox" value="20000000" id="checkbox4"> <label
										class="form-check-label" for="checkbox4">Dưới
											20.000.000 đ</label></li>
								</ul>
							</div>
						</div>
						<div class="col-xs-4 col-md-4 col-lg-2 shop">
							<select class="form-select fw-bold  p-3" id="sort-select"
								aria-label="Default select example">
								<option selected value="">Sắp xếp</option>
								<option value="0">Giá: tăng dần</option>
								<option value="1">Giá: giảm dần</option>
								<option value="2">Tên: A - Z</option>
								<option value="3">Tên: Z - A</option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="content-listProduct container mb-5">
				<div class="row">
					<c:if test="${!checkDayTime}">
						<c:forEach var="p" items="${listProduct}" varStatus="i">
							<c:forEach var="f" items="${listPdFlashsale.content}">
								<c:if test="${f.product.productId == p.productId}">
									<c:if test="${!p.del}">
										<div class="col-lg-3 col-md-4 col-12 product-item"
											data-brand="${p.manufacturerProduct.manufacturerName}"
											data-category="${p.categoryProduct.categoryName}">
											<div class="single-product h-100">
												<div class="product-img">
													<a class="product_name"
														href="/products/${p.productId}"> <img
														class="default-img"
														src="../images/products/${p.productImage[0].image }"
														alt="${p.productName }" height="190" width="250"> <img
														class="hover-img"
														src="../images/products/${p.productImage[1].image }"
														alt="${p.productName }" height="190" width="250"> <c:set
															var="foundFlashSale" value="false" /> <c:set
															var="priceDiscount" value="0" /> <c:forEach var="f"
															items="${listPdFlashsale.content}">
															<c:choose>
																<c:when test="${f.product.productId == p.productId}">
																	<div>
																		<span class="out-of-stock">Giảm <fmt:formatNumber
																				type="number" pattern="###,###,###"
																				value="${(p.price - f.discountedPrice)/p.price *100}" />
																			%
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
															<a data-toggle="modal" data-target="#quickProductModal"
																title="Quick View" href="#" class="quickViews"
																data-product-id="${p.productId}"><i class=" ti-eye"></i><span>Xem
																	nhanh</span></a>
															<c:set var="checkLike" value="false">
															</c:set>
															<c:forEach items="${likeList }" var="l" varStatus="i">
																<c:if test="${l.product.productId == p.productId }">
																	<c:set var="checkLike" value="true">
																	</c:set>
																</c:if>
															</c:forEach>
															<c:choose>
																<c:when test="${checkLike }">
																	<a title="Wishlist" href="#" class="siteLikeProduct"
																		data-product-id="${p.productId}"
																		data-user-id="${userLogin.userId}"><i
																		class="bi-heart-fill"></i><span class="title-like">Xóa
																			yêu thích</span></a>
																</c:when>
																<c:otherwise>
																	<a title="Wishlist" href="#" class="siteLikeProduct"
																		data-product-id="${p.productId}"
																		data-user-id="${userLogin.userId}"><i
																		class="bi-heart"></i><span class="title-like">Thêm
																			vào yêu thích</span></a>
																</c:otherwise>
															</c:choose>

														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#" class="addToCart"
																data-product-id="${p.productId}"
																data-user-id="${userLogin.userId}">Thêm vào giỏ hàng</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3 class="card-title" style="height: 60px">
														<a href="/products/${p.productId }">${p.productName
																			}</a>
													</h3>
													<div class="product-price3">
														<c:if test="${!foundFlashSale}">
															<span class="text-danger font-weight-bold product-price">
																<fmt:formatNumber type="number" pattern="###,###,###"
																	value="${p.price}" /> đ
															</span>
														</c:if>
														<c:if test="${foundFlashSale }">
															<span class="text-decoration-line-through"
																style="text-decoration: line-through;"> <fmt:formatNumber
																	type="number" pattern="###,###,###" value="${p.price}" />
																đ
															</span>
															<span class="text-danger font-weight-bold product-price">
																<fmt:formatNumber type="number" pattern="###,###,###"
																	value="${priceDiscount}" /> đ
															</span>
														</c:if>
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
			<c:if test="${listPdFlashsale.totalPages>1 }">
				<div class="paganation-site">
					<nav aria-label="..." class="">
						<ul
							class="pagination d-flex justify-content-center align-items-center">
							<li class="page-item ${listPdFlashsale.number==0?'disabled':'' }"><a
								class="page-link" href="?p=${listPdFlashsale.number-1}"
								tabindex="-1"><i class="ti ti-arrow-left"></i></a></li>
							<li class="page-item active"><a class="page-link"
								href="?p=${listPdFlashsale.number }">${listPdFlashsale.number+1}</a>
							</li>

							<li
								class="page-item ${listPdFlashsale.number+1==listPdFlashsale.totalPages?'disabled':'' }">
								<a class="page-link " href="?p=${listPdFlashsale.number+1 }"><i
									class="ti ti-arrow-right"></i></a>
							</li>
							<li class="ml-3 choose-page"><select
								name="selectedPage mb-0" id="selectedPage">
									<option value="">--Chọn trang--</option>
									<c:forEach begin="1" end="${listPdFlashsale.totalPages }"
										varStatus="i" var="page">
										<option value="${i.index}" class="option-page">${i.index}
										</option>
									</c:forEach>
							</select></li>
						</ul>
					</nav>
				</div>
			</c:if>
		</c:when>
		<c:otherwise>
			<section class="product-area shop-sidebar shop section p-5">
				<div class="container">
					<div class="filter-listProduct p-3 mt-3">
						<div class="row">
							<div
								class="col-xs-12 col-md-12 col-lg-4 d-flex align-items-center">
								<div class="">
									<span class="fw-bold display-6 my-auto"><i
										class="bi bi-funnel"></i>Bộ lọc |</span>
								</div>
							</div>
							<c:if test="${!catemanu }">
								<div class="col-xs-4 col-md-4 col-lg-2">
									<div class="dropdown">
										<button
											class="btn btn-default border fw-bold dropdown-toggle p-4"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-expanded="false">Thương hiệu</button>
										<ul class="dropdown-menu px-4"
											aria-labelledby="dropdownMenuButton">
											<c:forEach var="mn" items="${listBrands}">
												<c:if test="${mn.del }">
													<li class=""><input
														class="form-check-input filter-checkbox brand-checkbox"
														type="checkbox" value="${mn.manufacturerName }"
														id="${mn.manufacturerName }"> <label
														class="form-check-label" for="${mn.manufacturerName }">${mn.manufacturerName}</label>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="col-xs-4 col-md-4 col-lg-2">
									<div class="dropdown">
										<button
											class="btn btn-default border fw-bold dropdown-toggle p-4"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-expanded="false">Phân loại</button>
										<ul class="dropdown-menu px-4"
											aria-labelledby="dropdownMenuButton">
											<c:forEach var="ca" items="${listCategories}">
												<c:if test="${ca.del }">
													<li class=""><input
														class="form-check-input filter-checkbox category-checkbox"
														type="checkbox" value="${ca.categoryName }"
														id="${ca.categoryName }"> <label
														class="form-check-label" for="${ca.categoryName}">${ca.categoryName
																			}</label></li>

												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</c:if>
							<div class="col-xs-4 col-md-4 col-lg-2">
								<div class="dropdown">
									<button
										class="btn btn-default border fw-bold dropdown-toggle  p-4"
										type="button" id="dropdownMenuButton2" data-toggle="dropdown"
										aria-expanded="false">Lọc giá</button>
									<ul class="dropdown-menu px-4"
										aria-labelledby="dropdownMenuButton2" style="min-width: 200px">
										<li class=""><input
											class="form-check-input filter-checkbox price-checkbox"
											type="checkbox" value="5000000" id="checkbox1"> <label
											class="form-check-label" for="checkbox1">Dưới
												5.000.000 đ</label></li>
										<li class="mt-2"><input
											class="form-check-input filter-checkbox price-checkbox"
											type="checkbox" value="10000000" id="checkbox2"> <label
											class="form-check-label" for="checkbox2">Dưới
												10.000.000 đ</label></li>
										<li class="mt-2"><input
											class="form-check-input filter-checkbox price-checkbox"
											type="checkbox" value="15000000" id="checkbox3"> <label
											class="form-check-label" for="checkbox3">Dưới
												15.000.000 đ</label></li>
										<li class="mt-2"><input
											class="form-check-input filter-checkbox price-checkbox"
											type="checkbox" value="20000000" id="checkbox4"> <label
											class="form-check-label" for="checkbox4">Dưới
												20.000.000 đ</label></li>
									</ul>
								</div>
							</div>
							<div class="col-xs-4 col-md-4 col-lg-2">
								<select class="form-select fw-bold  p-3" id="sort-select"
									aria-label="Default select example">
									<option selected value="">Sắp xếp</option>
									<option value="0">Giá: tăng dần</option>
									<option value="1">Giá: giảm dần</option>
									<option value="2">Tên: A - Z</option>
									<option value="3">Tên: Z - A</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="content-listProduct container">
					<div class="row mx-auto">
						<c:forEach items="${listProduct.content }" var="p" varStatus="ic">
							<c:if test="${!p.del}">
								<div class="col-lg-3 col-md-4 col-12 product-item"
									data-brand="${p.manufacturerProduct.manufacturerName}"
									data-category="${p.categoryProduct.categoryName}">
									<div class="single-product h-100">
										<div class="product-img">
											<a class="product_name"
												href="/products/${p.productId}"> <img
												class="default-img"
												src="images/products/${p.productImage[0].image }"
												alt="${p.productName }" height="190" width="250"> <img
												class="hover-img"
												src="images/products/${p.productImage[1].image }"
												alt="${p.productName }" height="190" width="250"> <c:set
													var="foundFlashSale" value="false" /> <c:set
													var="priceDiscount" value="0" /> <c:forEach var="f"
													items="${listPdFlashsale}">
													<c:choose>
														<c:when test="${f.product.productId == p.productId}">
															<div>
																<span class="out-of-stock">Giảm <fmt:formatNumber
																		type="number" pattern="###,###,###"
																		value="${(p.price - f.discountedPrice)/p.price *100}" />
																	%
																</span>
															</div>

															<c:set var="foundFlashSale" value="true" />
															<c:set var="priceDiscount" value="${f.discountedPrice }" />
														</c:when>
													</c:choose>
												</c:forEach> <c:if test="${p.quantityInStock==0 }">
													<span class="out-of-stock">Tạm hết hàng</span>
												</c:if>
											</a>
											<div class="button-head">
												<div class="product-action">
													<a data-toggle="modal" data-target="#quickProductModal"
														title="Quick View" href="#" class="quickViews"
														data-product-id="${p.productId}"><i class=" ti-eye"></i><span>Xem
															nhanh</span></a>
													<c:set var="checkLike" value="false"></c:set>
													<c:forEach items="${likeList }" var="l" varStatus="i">
														<c:if test="${l.product.productId == p.productId }">
															<c:set var="checkLike" value="true"></c:set>
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${checkLike }">
															<a title="Wishlist" href="#" class="siteLikeProduct"
																data-product-id="${p.productId}"
																data-user-id="${userLogin.userId}"><i
																class="bi-heart-fill"></i><span class="title-like">Xóa
																	yêu thích</span></a>
														</c:when>
														<c:otherwise>
															<a title="Wishlist" href="#" class="siteLikeProduct"
																data-product-id="${p.productId}"
																data-user-id="${userLogin.userId}"><i
																class="bi-heart"></i><span class="title-like">Thêm
																	vào yêu thích</span></a>
														</c:otherwise>
													</c:choose>

												</div>
												<div class="product-action-2">
													<a title="Add to cart" href="#" class="addToCart"
														data-product-id="${p.productId}"
														data-user-id="${userLogin.userId}">Thêm vào giỏ hàng</a>
												</div>
											</div>
										</div>
										<div class="product-content">
											<h3 class="card-title" style="height: 60px">
												<a href="/products/${p.productId }">${p.productName
																	}</a>
											</h3>
											<div class="product-price3">
												<c:if test="${!foundFlashSale}">
													<span class="text-danger font-weight-bold product-price">
														<fmt:formatNumber type="number" pattern="###,###,###"
															value="${p.price}" /> đ
													</span>
												</c:if>
												<c:if test="${foundFlashSale }">
													<span class="text-decoration-line-through"
														style="text-decoration: line-through;"> <fmt:formatNumber
															type="number" pattern="###,###,###" value="${p.price}" />
														đ
													</span>
													<span class="text-danger font-weight-bold product-price">
														<fmt:formatNumber type="number" pattern="###,###,###"
															value="${priceDiscount}" /> đ
													</span>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<c:if test="${listProduct.totalPages>1 }">
					<div class="paganation-site">
						<nav aria-label="..." class="">
							<ul
								class="pagination d-flex justify-content-center align-items-center">
								<li class="page-item ${listProduct.number==0?'disabled':'' }"><a
									class="page-link" href="?p=${listProduct.number-1}"
									tabindex="-1"><i class="ti ti-arrow-left"></i></a></li>
								<li class="page-item active"><a class="page-link"
									href="?p=${listProduct.number }">${listProduct.number+1}</a></li>

								<li
									class="page-item ${listProduct.number+1==listProduct.totalPages?'disabled':'' }">
									<a class="page-link " href="?p=${listProduct.number+1 }"><i
										class="ti ti-arrow-right"></i></a>
								</li>
								<li class="ml-3 choose-page"><select
									name="selectedPage mb-0" id="selectedPage">
										<option value="">--Chọn trang--</option>
										<c:forEach begin="1" end="${listProduct.totalPages }"
											varStatus="i" var="page">
											<option value="${i.index}" class="option-page">${i.index}
											</option>
										</c:forEach>
								</select></li>
							</ul>
						</nav>
					</div>
				</c:if>
			</section>




		</c:otherwise>
	</c:choose>

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
								<div class="quickview-peragraph mb-3" id="quickview-description"></div>
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
										data-user-id="${userLogin.userId}">Thêm vào giỏ hàng</a>
									<!-- <a
										href="#" class="btn min"><i class="ti-heart"></i></a> -->
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
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.0.js"></script>
	<script src="../js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="../js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Color JS -->
	<!-- 
	<script src="js/colors.js"></script> -->
	<!-- Slicknav JS -->
	<script src="../js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="../js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="../js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<script src="../js/waypoints.min.js"></script>
	<!-- Countdown JS -->
	<script src="../js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="../js/nicesellect.js"></script>
	<!-- Flex Slider JS -->
	<script src="../js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="../js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="../js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="../js/easing.js"></script>
	<!-- Active JS -->
	<script src="../js/active.js"></script>
	<script src="../js/jquery.countdown.js"></script>
	<script
		src="<c:url value=" /webjars/slick-carousel/1.8.1/slick/slick.js" />"></script>
	<script src="../js/choose-product.js"></script>
	<script src="../js/isotope.pkgd.js"></script>
	<script src="../js/cart-script.js"></script>
	<script src="../js/filter.js"></script>
	<script src="../js/likeProduct.js"></script>
	<script type="text/javascript">
		// Lặp qua tất cả các phần tử <li> bên trong thẻ có class "choose-page"
		$(".choose-page .option").click(function() {
			var selectedPageValue = $(this).data("value");
			if (selectedPageValue !== "") {
				selectedPageValue = parseInt(selectedPageValue, 10) - 1; // Giảm giá trị đi 1
				window.location.href = "?p=" + selectedPageValue;
			}
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
	</script>
</body>

</html>