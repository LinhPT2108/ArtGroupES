<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.css"/>">
<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick-theme.css"/>">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../assets/css/product-detail.css">
<link rel="stylesheet" href="../css/custom-nav.css">
</head>
<body>
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

	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col-lg-5 col-md-5 col-12"
				style="width: 450px; padding: 15px; flex-shrink: 0;">
				<div class="bentraihinhsanpham">
					<picture> <img src alt
						style="display: block; object-fit: contain; object-position: center;">
					</picture>
				</div>
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">

						<c:forEach items="${product.productImage }" var="imageProduct"
							varStatus="loop">
							<c:if test="${loop.index==0 }">
								<div class="carousel-item active">
									<img class="d-block w-100"
										src="../../images/products/${imageProduct.image }"
										alt="First slide">
								</div>
							</c:if>
							<c:if test="${loop.index!=0 }">
								<div class="carousel-item">
									<img class="d-block w-100"
										src="../../images/products/${imageProduct.image }"
										alt="First slide">
								</div>
							</c:if>

						</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleControls"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-lg-7 col-md-7 col-12">
				<div class="thongtintensanpham">
					<div class="tensanpham">
						<span>${product.productName }</span>
					</div>
				</div>
				<!--số lượng bán, sao-->
				<div class="thongtinchitietsanpham d-flex flex-row">
					<button class="thongtindau d-flex flex-row">
						<div class="sosao"
							style="color: #ee4d2d; border-bottom-color: #ee4d2d; margin-right: 5px;">
							<fmt:formatNumber value="${star}" type="number" pattern="#.#" />
						</div>
						<div class="5sao">
							<c:choose>
								<c:when test="${star <= 0.5}">
									<i class="bi bi-star-half mausao"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 1}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 1.5}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-half mausao"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 2}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 2.5}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-half mausao"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 3}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 3.5}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-half mausao"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 4}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${star <= 4.5}">
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-half mausao"></i>
								</c:when>
								<c:otherwise>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
									<i class="bi bi-star-fill mausao"></i>
								</c:otherwise>
							</c:choose>

						</div>
					</button>
					<button class="thongtingiua d-flex flex-row">
						<div class="sodanhgia" style="margin: 5px;">
							<c:choose>
								<c:when test="${sumRate >0}">
									${sumRate }
								</c:when>
								<c:otherwise>
									0
								</c:otherwise>
							</c:choose>
						</div>
						<div class="tendanhgia">Đánh giá</div>
					</button>
					<button class="thongtincuoi d-flex flex-row">
						<div class="sodaban">
							<c:choose>
								<c:when test="${sumSell >0}">
									${sumSell }
								</c:when>
								<c:otherwise>
									0
								</c:otherwise>
							</c:choose>

						</div>
						<div class="tendaban">Đã bán</div>
					</button>
				</div>
				<!--FlashSale, Giá-->
				<div style="margin-top: 10px;">
					<c:if test="${isFlashSale}">
						<div
							class="section-heading text-center d-flex align-items-center mb-3 p-3">
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
										data-end-day="<c:out value="${flashsale.endDay}" />"> </span>

								</div>
							</c:if>
						</div>
					</c:if>
					<div class="thongtingia">
						<div class="d-flex ">

							<c:if test="${!isFlashSale }">
								<span
									class="price product-price text-danger display-6 font-weight-bold ml-2"><fmt:formatNumber
										type="number" pattern="###,###,###" value="${product.price}" />
									₫</span>
							</c:if>
							<c:if test="${isFlashSale}">
								<span class="display-6 text-muted mr-2"
									style="align-self: center; text-decoration: line-through;">
									<fmt:formatNumber type="number" pattern="###,###,###"
										value="${product.price}" /> ₫
								</span>
								<span
									class="price product-price text-danger display-6 font-weight-bold mr-4">
									<fmt:formatNumber type="number" pattern="###,###,###"
										value="${product.productPromotionalDetails[0].discountedPrice }" />

									₫ <span
									class="badge bg-danger text-white rounded display-6 ml-4">giảm
										<fmt:formatNumber type="number" pattern="###,###"
											value="${(product.price - product.productPromotionalDetails[0].discountedPrice)/product.price*100}" />
										%
								</span>
								</span>
							</c:if>
						</div>
					</div>
				</div>
				<!--số lượng-->
				<div class="dinhdangkhungsoluong">
					<div style="flex-direction: column;">
						<!--số lượng-->
						<section class="d-flex align-items-center" style="color: #757575;">
							<h3
								style="color: #757575; width: 110px; text-transform: capitalize; flex-shrink: 0; align-items: center; font-size: inherit; font-weight: 400; margin: 0;">Trạng
								thái:</h3>
							<div>
								<c:choose>
									<c:when test="${product.quantityInStock>0}">
										<b>Còn hàng</b>
									</c:when>
									<c:otherwise>
										<b>Hết hàng</b>
									</c:otherwise>
								</c:choose>
							</div>
						</section>
					</div>
				</div>
				<!-- Nút giỏ hàng và mua ngay -->
				<div style="margin-top: 15px;">
					<div style="padding-left: 1.25rem;">
						<div style="display: flex; justify-content: between;">

							<a title="Add to cart" href="#"
								class="addToCart nutgiohang maunutmua text-white"
								data-product-id="${product.productId}"
								data-user-id="${userLogin.userId}">Thêm vào giỏ hàng</a>

							<c:set var="checkLike" value="false"></c:set>
							<c:forEach items="${likeList }" var="l" varStatus="i">
								<c:if test="${l.product.productId == product.productId }">
									<c:set var="checkLike" value="true"></c:set>
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test="${checkLike }">
									<a title="Xóa yêu thích" href="#" class="siteLikeProduct"
										data-product-id="${product.productId}"
										data-user-id="${userLogin.userId}" style="margin-left: 40px;"><i
										class="bi-heart-fill text-danger display-5 float-right"></i></a>
								</c:when>
								<c:otherwise>
									<a title="Yêu thích" href="#" class="siteLikeProduct"
										data-product-id="${product.productId}"
										data-user-id="${userLogin.userId}" style="margin-left: 40px;"><i
										class="bi-heart text-danger display-5 float-right"></i></a>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>

			<!-- CHi tiết sản phẩm -->
			<div class="bocucchitietsanpham">
				<section class="chitietsanpham">
					<h2 class="titlechitietsanpham">CHI TIẾT SẢN PHẨM</h2>
					<div style="margin: 1.875rem .9375rem .9375rem;">
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Loại Sản Phẩm: </label>
							<div>${product.categoryProduct.categoryName }</div>
						</div>
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Thương Hiệu: </label>
							<div>${product.manufacturerProduct.manufacturerName }</div>
						</div>
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Năm sản xuất:</label>
							<div>-</div>
						</div>
					</div>
				</section>

				<section class="motasanpham">
					<c:forEach items="${product.productDetailDescription }"
						var="description">
						<h2 class="titlemotasanpham">${description.tile }</h2>
						<div style="margin: 1.875rem .9375rem .9375rem;">
							<p>${description.description }</p>
						</div>
					</c:forEach>
				</section>
			</div>
		</div>
		<!-- đánh giá sản phẩm -->
		<div>
			<div class="dinhdangkhungdanhgiasp">
				<div class="khoangcachtitlevsphandanhgia">
					<div class="danhgiasanpham">ĐÁNH GIÁ SẢN PHẨM</div>
				</div>
				<div class="comment-list">
					<c:choose>
						<c:when test="${comment.size()>0 }">
							<c:forEach items="${comment}" var="comment">
								<div class="comment-rating">
									<a href class="avatar-rating">
										<div class="avatar-background">
											<c:if test="${comment.user.image!=null }">
												<img src="../../images/avatar/${comment.user.image }" alt
													class="img-rating">
											</c:if>
										</div>
									</a>
									<div class="main-rating" style="flex: 1;">
										<p class="name-comment">${comment.user.fullname }</p>
										<div class="5sao">
											<c:choose>
												<c:when test="${comment.star <= 0.5}">
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:when>
												<c:when test="${comment.star <= 1}">
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:when>
												<c:when test="${comment.star <= 2}">
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:when>
												<c:when test="${comment.star <= 3}">
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:when>
												<c:when test="${comment.star <= 4}">
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star"></i>
												</c:when>
												<c:otherwise>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
													<i class="bi bi-star-fill mausao"></i>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="time-comment">${comment.date }</div>
										<div style="margin: 0.5rem 0 0.5rem 0;">${comment.content }</div>
										<div class="product-rating-img">
											<div style="display: flex; width: 100%; flex-wrap: wrap;">
												<c:if test="${comment.commentImages!=null }">
													<c:forEach items="${comment.commentImages }" var="imageC">
														<div class="frames-rating-img">
															<img class="hinhanhdanhgia"
																src="../../images/comments/${imageC.image }">
														</div>
													</c:forEach>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p class="text-center">Chưa có đánh giá nào</p>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>

	</div>
	<section class="small-banner section flash-sale-site mt-3 rounded">
		<div class="container-fluid">
			<div
				class="bg-light section-heading text-center d-flex align-items-center mb-3 p-3">
				<div class="title-flashsale mr-3 ">
					<h2 class="hTitle ">
						Sản phẩm khác
					</h2>
				</div>
			</div>
			<div class="section-flashsale listCarousel cardProduct-comment">
				x
				<c:forEach var="p" items="${productOther}" varStatus="i">
					<c:if test="${!p.del && i.index<8}">
						<div class="mb-3">
							<div class="card h-100 mx-3">
								<input type="hidden" name="productId" value="${p.productId}">
								<a href="/products/${p.productId}"><img
									src="../../images/products/${p.productImage[0].image }"
									class="card-img-top" alt="${p.productName }"
									style="height: 280px !important;"></a>
								<div class="card-body d-flex flex-column">
									<span class="text-muted">${p.manufacturerProduct.manufacturerName }</span>
									<a
										class="card-title fs-6 font-weight-bold text-black text-decoration-none"
										href="/products/${p.productId }" style="min-height: 48px">${p.productName }</a>
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
												
											</c:when>
											<c:otherwise>
												<button type="button"
													class="btn-outline-primary p-2 addToCart"
													data-product-id="${p.productId}"
													data-user-id="${userLogin.userId}">Thêm vào giỏ</button>
												
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>

					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Start Footer Area -->
	<jsp:include page="component/_footer.jsp"></jsp:include>
	<!-- /End Footer Area -->

	<!-- Footer -->
	<script type="text/javascript"
		src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script
		src="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.js"/>"></script>
	<!-- Jquery -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery-migrate-3.0.0.js"></script>
	<script src="../js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="../js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="../js/bootstrap.min.js"></script>
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

	<script src="../js/likeProduct.js"></script>

	<script
		src="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.js"/>"></script>

	<script src="../js/cart-script.js"></script>
	<script type="text/javascript">
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

		$('.cardProduct-comment').slick({

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