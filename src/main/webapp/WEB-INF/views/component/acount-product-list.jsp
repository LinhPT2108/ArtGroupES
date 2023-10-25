<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2">
		<span class="display-6">${title }</span>
	</div>

	<div class="row list-wish">
		<c:forEach items="${listProduct.content }" var="p" varStatus="ic">
			<c:if test="${!p.product.del}">
				<div class="col-xl-3 col-lg-4 col-md-4 col-12">
					<div class="single-product h-100">
						<div class="product-img">
							<a href="/products/${p.product.productId}"> <img
								class="default-img"
								src="../images/products/${p.product.productImage[0].image }"
								alt="${p.product.productName }" height="140" width="250">
								<img class="hover-img"
								src="../images/products/${p.product.productImage[1].image }"
								alt="${p.product.productName }" height="140" width="250">
								<c:set var="foundFlashSale" value="false" /> <c:set
									var="priceDiscount" value="0" /> <c:forEach var="f"
									items="${listPdFlashsale}">
									<c:choose>
										<c:when test="${f.product.productId == p.product.productId}">
											<div>
												<span class="out-of-stock">Giảm <fmt:formatNumber
														type="number" pattern="###,###,###"
														value="${(p.product.price - f.discountedPrice)/p.product.price *100}" />%
												</span>
											</div>

											<c:set var="foundFlashSale" value="true" />
											<c:set var="priceDiscount" value="${f.discountedPrice }" />
										</c:when>
									</c:choose>
								</c:forEach> <c:if test="${p.product.quantityInStock==0 }">
									<span class="out-of-stock">Tạm hết hàng</span>
								</c:if>
							</a>
							<div class="button-head">
								<div class="product-action">
									<a data-toggle="modal" data-target="#quickProductModal"
										title="Quick View" href="#" class="quickViews"
										data-product-id="${p.product.productId}"><i
										class=" ti-eye"></i><span>Xem nhanh</span></a>
									<c:set var="checkLike" value="false"></c:set>
									<c:forEach items="${likeList }" var="l" varStatus="i">
										<c:if test="${l.product.productId == p.product.productId }">
											<c:set var="checkLike" value="true"></c:set>
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${checkLike }">
											<a title="Wishlist" href="#" class="siteLikeProduct"
												data-product-id="${p.product.productId}"
												data-user-id="${userLogin.userId}"><i
												class="bi-heart-fill"></i><span class="title-like">Xóa
													yêu thích</span></a>
										</c:when>
										<c:otherwise>
											<a title="Wishlist" href="#" class="siteLikeProduct"
												data-product-id="${p.product.productId}"
												data-user-id="${userLogin.userId}"><i class="bi-heart"></i><span
												class="title-like">Thêm vào yêu thích</span></a>
										</c:otherwise>
									</c:choose>

								</div>
								<div class="product-action-2">
									<a title="Add to cart" href="#" class="addToCart"
										data-product-id="${p.product.productId}"
										data-user-id="${userLogin.userId}">Thêm vào giỏ hàng</a>
								</div>
							</div>
						</div>
						<div class="product-content">
							<h3 class="card-title" style="height: 48px">
								<a class="card-title" href="/products/${p.product.productId }">${p.product.productName }</a>
							</h3>
							<div class="product-price">

								<c:if test="${!foundFlashSale}">
									<span class="text-danger fw-bold"> <fmt:formatNumber
											type="number" pattern="###,###,###"
											value="${p.product.price}" /> đ
									</span>
								</c:if>
								<c:if test="${foundFlashSale }">
									<span class="text-decoration-line-through"
										style="text-decoration: line-through;"> <fmt:formatNumber
											type="number" pattern="###,###,###"
											value="${p.product.price}" /> đ
									</span>
									<span class="text-danger font-weight-bold"> <fmt:formatNumber
											type="number" pattern="###,###,###" value="${priceDiscount}" />
										đ
									</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<c:if test="${listProduct.totalPages>1 }">
		<div class="paganation-site">
			<nav aria-label="..." class="">
				<ul
					class="pagination d-flex justify-content-center align-items-center">
					<li class="page-item ${listProduct.number==0?'disabled':'' }"><a
						class="page-link" href="?p=${listProduct.number-1}" tabindex="-1"><i
							class="ti ti-arrow-left"></i></a></li>
					<li class="page-item active"><a class="page-link"
						href="?p=${listProduct.number }">${listProduct.number+1}</a></li>

					<li
						class="page-item ${listProduct.number+1==listProduct.totalPages?'disabled':'' }"><a
						class="page-link " href="?p=${listProduct.number+1 }"><i
							class="ti ti-arrow-right"></i></a></li>
					<li class="ml-3 choose-page"><select name="selectedPage mb-0"
						id="selectedPage">
							<option value="">--Chọn trang--</option>
							<c:forEach begin="1" end="${listProduct.totalPages }"
								varStatus="i" var="page">
								<option value="${i.index}" class="option-page">${i.index}</option>
							</c:forEach>
					</select></li>
				</ul>
			</nav>
		</div>
	</c:if>

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
</div>