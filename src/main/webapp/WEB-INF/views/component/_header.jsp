<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header class="header shop">
	<!-- Topbar -->
	<div class="topbar">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-12 col-12">
					<!-- Top Left -->
					<div class="top-left">
						<ul class="list-main">
							<li><i class="ti-headphone-alt"></i> +060 (800) 801-582</li>
							<li><i class="ti-email"></i> artdevk18@gmail.com</li>
						</ul>
					</div>
					<!--/ End Top Left -->
				</div>
				<div class="col-lg-8 col-md-12 col-12">
					<!-- Top Right -->
					<div class="right-content">
						<ul class="list-main">
							<li><i class="ti-location-pin"></i><a
								href="https://maps.app.goo.gl/npdKKMSeD48m2dAa8" target="_blank">
									Địa chỉ</a></li>
							<li><i class="ti-alarm-clock"></i> <a href="#">Khuyến
									mãi</a></li>
							<c:choose>
								<c:when test="${userLogin ==null }">
									<li><i class="ti-power-off"></i><a href="/account/login">
											Đăng nhập</a></li>
									<li><i class="ti-id-badge"></i> <a
										href="/account/register">Đăng ký</a></li>
								</c:when>
								<c:otherwise>
									<li><i class="ti-user"></i> <a href="/account/profile">Tài
											khoản </a></li>
									<li><i class="bi bi-box-arrow-right"></i> <a
										href="/account/logout">Đăng xuất</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- End Top Right -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Topbar -->
	<div class="middle-inner">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-2 col-md-2 col-12  d-md-flex justify-content-center align-items-center">
					<!-- Logo -->
					<div class="logo">
						<a href="/"><img src="../../images/logo.png" alt="logo"
							width="120px" height="auto"></a>
					</div>
					<!--/ End Logo -->
					<!-- Search Form -->
					<div class="search-top ">
						<div class="top-search">
							<a href="#0"><i class="ti-search"></i></a>
						</div>
						<!-- Search Form -->
						<div class="search-top">
							<form class="search-form">
								<input type="text" placeholder="Search here..." name="search">
								<button value="search" type="submit">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
						<!--/ End Search Form -->
					</div>
					<!--/ End Search Form -->
					<div class="mobile-nav"></div>
				</div>
				<div
					class="col-lg-8 col-md-7 col-12 d-md-flex justify-content-center align-items-center">
					<div class="search-bar-top">
						<div class="search-bar">
							<select>
								<option selected="selected">Danh mục</option>
								<option>watch</option>
								<option>mobile</option>
								<option>kid’s item</option>
							</select>
							<form>
								<input name="search" placeholder="Search Products Here....."
									type="search">
								<button class="btnn">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
				<div
					class="col-lg-2 col-md-3 col-12 d-md-flex justify-content-center align-items-center">
					<div class="right-bar mb-5">
						<!-- Search Form -->
						<c:if test="${userLogin!=null }">
							<div class="sinlge-bar">
								<a href="/account/wish-list" class="single-icon"><i
									class="fa fa-heart-o" aria-hidden="true"></i></a>
							</div>
						</c:if>

						<div class="sinlge-bar shopping">
							<a href="/account/profile" class="single-icon"><i
								class="fa fa-user-circle-o" aria-hidden="true"></i></a>
							<!-- Shopping Item -->
							<div class="shopping-item p-0" style="right: 40px">
								<ul class="list-group list-group-flush">

									<c:choose>
										<c:when test="${userLogin!=null }">
											<li class="list-group-item"><a href="/account/profile">Thông
													tin tài khoản</a></li>
											<li class="list-group-item"><a href="/account/Invoice">Đơn
													mua</a></li>
											<li class="list-group-item"><a href="#">Đổi mật khẩu</a></li>
											<li class="list-group-item"><a href="/account/logout">Đăng
													xuất</a></li>
										</c:when>
										<c:otherwise>
											<li class="list-group-item"><a href="/account/login">Đăng
													nhập</a></li>
											<li class="list-group-item"><a href="/account/register">Đăng
													ký</a></li>
											<li class="list-group-item"><a
												href="/account/forgot-password">Quên mật khẩu</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<!--/ End Shopping Item -->
						</div>
						<div class="sinlge-bar shopping">
							<a href="#" class="single-icon"><i class="ti-bag"></i> <c:if
									test="${userLogin != null }">
									<span class="total-count">${sizeInCart }</span>
								</c:if></a>

							<!-- Shopping Item -->
							<div class="shopping-item">
								<c:choose>
									<c:when test="${userLogin!=null }">
										<div class="dropdown-cart-header">
											<span class="total-count">${sizeInCart }</span> Sản phẩm <a
												href="#">Xem giỏ hàng</a>
										</div>
										<ul class="shopping-list" id="listProductCart">
											<c:choose>
												<c:when test="${sizeInCart==0 }">
													<div
														class="nothing d-flex flex-column align-items-center justify-content-center">
														<i class="bi bi-cart-x display-1"></i> <span>Chưa
															có sản phẩm</span>
													</div>
												</c:when>
												<c:otherwise>
													<li><c:forEach var="cart" items="${carts}">
															<div class="mb-2 productInCart" id="${cart.cartId}">
																<a class="cart-img"
																	href="/products/${cart.product.productId }"><img
																	src="images/products/${cart.product.productImage[0].image }"
																	alt="${cart.product.productImage[0].image }"></a>
																<h4>
																	<a href="#">${cart.product.productName}</a>
																</h4>
																<p class="quantity">
																	Số lượng: <span class="qtyInStock">${cart.quantity}
																	</span> <span class="amount d-flex flex-column"> <c:choose>
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
																						<span class="fw-bold float-end text-danger">
																							<fmt:formatNumber type="number"
																								pattern="###,###,###"
																								value="${cart.product.productPromotionalDetails[0].discountedPrice}" />
																							₫
																						</span>
																					</c:when>
																					<c:otherwise>
																						<span class="fw-bold float-end text-danger"><fmt:formatNumber
																								type="number" pattern="###,###,###"
																								value="${cart.product.price}" /> ₫</span>
																					</c:otherwise>
																				</c:choose>
																			</c:when>
																			<c:otherwise>
																				<span class="fw-bold float-end text-danger"><fmt:formatNumber
																						type="number" pattern="###,###,###"
																						value="${cart.product.price}" /> ₫</span>
																			</c:otherwise>
																		</c:choose>
																	</span>
																	<button onclick="removeCartItem(${cart.cartId}, this)"
																		class="remove remove-product-cart"
																		title="Xóa khỏi giỏ hàng">
																		<i class="fa fa-remove"></i>
																	</button>
																</p>

															</div>
														</c:forEach></li>
												</c:otherwise>
											</c:choose>
										</ul>
										<div class="bottom cartBottom">
											<c:if test="${sizeInCart>0 }">
												<div class=" bottomCart">
													<div class="total">
														<span>Tổng tiền</span> <span class="total-amount">
															<fmt:formatNumber type="number" pattern="###,###,###"
																value="${totalPriceInCart}" /> ₫
														</span>
													</div>
													<a href="/checkout" class="btn animate">Thanh toán</a>
												</div>
											</c:if>
										</div>
									</c:when>
									<c:otherwise>
										<div class="d-flex">
											<span class="text-danger mx-auto">Vui lòng <a
												href="/account/login"><u>đăng nhập</u></a>
											</span>

										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<!--/ End Shopping Item -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header Inner -->
	<div class="header-inner">
		<div class="container">
			<div class="cat-nav-head">
				<div class="row">
					<div class="col-lg-3">
						<div class="all-category" id="all-category">
							<h3 class="cat-heading">
								<i class="fa fa-bars" aria-hidden="true"></i>DANH MỤC
							</h3>
							<ul class="main-category" id="main-category">
								<c:forEach items="${listCategories }" var="c">
									<c:if test="${c.del }">
										<li><a href="/product?c=${c.categoryId }">${c.categoryName }<i
												class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="sub-category">
												<c:forEach items="${listBrands }" var="b">
													<c:if test="${b.del }">
														<li><a href="/product?c=${c.categoryId }&b=${b.id}">${b.manufacturerName }</a></li>
													</c:if>
												</c:forEach>
											</ul></li>
									</c:if>

								</c:forEach>

								<!-- <li class="main-mega"><a href="#">best selling <i
										class="fa fa-angle-right" aria-hidden="true"></i></a>
									<ul class="mega-menu">
										<li class="single-menu"><a href="#" class="title-link">Shop
												Kid's</a>
											<div class="image">
												<img src="https://via.placeholder.com/225x155" alt="#">
											</div>
											<div class="inner-link">
												<a href="#">Kids Toys</a> <a href="#">Kids Travel Car</a> <a
													href="#">Kids Color Shape</a> <a href="#">Kids Tent</a>
											</div></li>
										<li class="single-menu"><a href="#" class="title-link">Shop
												Men's</a>
											<div class="image">
												<img src="https://via.placeholder.com/225x155" alt="#">
											</div>
											<div class="inner-link">
												<a href="#">Watch</a> <a href="#">T-shirt</a> <a href="#">Hoodies</a>
												<a href="#">Formal Pant</a>
											</div></li>
										<li class="single-menu"><a href="#" class="title-link">Shop
												Women's</a>
											<div class="image">
												<img src="https://via.placeholder.com/225x155" alt="#">
											</div>
											<div class="inner-link">
												<a href="#">Ladies Shirt</a> <a href="#">Ladies Frog</a> <a
													href="#">Ladies Sun Glass</a> <a href="#">Ladies Watch</a>
											</div></li>
									</ul></li> -->
							</ul>
						</div>
					</div>
					<div class="col-lg-9 col-12">
						<div class="menu-area ">
							<!-- Main Menu -->
							<nav class="navbar navbar-expand-lg ">
								<div class="navbar-collapse">
									<div class="nav-inner">
										<ul class="nav main-menu menu navbar-nav ">
											<li class=""><a href="/" class="">TRANG CHỦ</a></li>
											<li><a href="/product" class="">SẢN PHẨM</a></li>
											<li><a href="/flash-sale" class="">KHUYẾN MÃI</a></li>
											<li><a href="/contact" class="">LIÊN HỆ</a></li>
										</ul>
									</div>
								</div>
							</nav>
							<!--/ End Main Menu -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ End Header Inner -->
</header>
<script type="text/javascript">
	//Lấy đường dẫn hiện tại
	var currentPath = window.location.pathname;

	// Tìm tất cả thẻ <a> trong danh sách menu
	var menuItems = document.querySelectorAll('.main-menu a');

	// Lặp qua từng thẻ <a> và kiểm tra đường dẫn
	for (var i = 0; i < menuItems.length; i++) {
		var menuItem = menuItems[i];
		var menuItemPath = menuItem.getAttribute('href');
		menuItem.parentNode.classList.remove('active');
		// Kiểm tra nếu đường dẫn của thẻ <a> trùng khớp với đường dẫn hiện tại
		if (menuItemPath === currentPath) {
			// Thêm class "active" vào thẻ <li> chứa thẻ <a> tương ứng
			menuItem.parentNode.classList.add('active');
		}
	}
</script>