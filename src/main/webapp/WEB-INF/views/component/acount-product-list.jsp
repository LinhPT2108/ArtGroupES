<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2">
		<span class="display-6">${title }</span>
	</div>
	<div class="filter-listProduct p-3 mt-3">
		<div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
			<div class="filter-title mb-2">
				<span class=" font-weight-bold display-6"><i class="bi bi-funnel"></i>Bộ lọc|
					</span>
			</div>
			<div class="filter-brand mb-2">
				<div class="dropdown">
					<button
						class="btn btn-default border fw-bold dropdown-toggle text-nowrap"
						type="button" id="dropdownMenuButton1" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Thương hiệu</button>
					<ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton1">
						<%-- <c:forEach var="mn" items="${listManufacturer}">
							<li class=""><input
								class="form-check-input filter-checkbox brand-checkbox"
								type="checkbox" value="${mn.manufacturer_name }"
								id="${mn.manufacturer_name }"> <label
								class="form-check-label" for="${mn.manufacturer_name }">${mn.manufacturer_name}</label></li>
						</c:forEach> --%>
						<c:forEach begin="1" end="5" varStatus="i">
							<li class="px-4"><input
								class="form-check-input filter-checkbox brand-checkbox"
								type="checkbox" value="${mn.manufacturer_name }" id="${i.index}">
								<label class="form-check-label" for="${i.index}">${mn.manufacturer_name}vidu</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="filter-category mb-2">
				<div class="dropdown">
					<button
						class="btn btn-default border fw-bold dropdown-toggle text-nowrap "
						type="button" id="dropdownMenuButton2" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Phân loại</button>
					<ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton2">
						<%-- <c:forEach var="ca" items="${listCategory}">
							<li class=""><input
								class="form-check-input filter-checkbox category-checkbox"
								type="checkbox" value="${ca.category_name }"
								id="${ca.category_name }"> <label
								class="form-check-label" for="${ca.category_name}">${ca.category_name }</label></li>
						</c:forEach> --%>
						<c:forEach begin="1" end="5" varStatus="i">
							<li class="px-4"><input
								class="form-check-input filter-checkbox brand-checkbox"
								type="checkbox" value="${mn.manufacturer_name }" id="${i.index+5}">
								<label class="form-check-label" for="${i.index+5}">${mn.manufacturer_name}vidu2</label></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="filter-price mb-2">
				<div class="dropdown">
					<button
						class="btn btn-default border fw-bold dropdown-toggle text-nowrap "
						type="button" id="dropdownMenuButton3" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Lọc giá</button>
					<ul class="dropdown-menu p-2 menu-filter-price" aria-labelledby="dropdownMenuButton3">
						<li class="px-4"><input
							class="form-check-input filter-checkbox price-checkbox"
							type="checkbox" value="200000" id="checkbox1"> <label
							class="form-check-label" for="checkbox1">Dưới 200.000 đ</label></li>
						<li class="mt-2 px-4"><input
							class="form-check-input filter-checkbox price-checkbox"
							type="checkbox" value="400000" id="checkbox2"> <label
							class="form-check-label" for="checkbox2">Dưới 400.000 đ</label></li>
						<li class="mt-2 px-4"><input
							class="form-check-input filter-checkbox price-checkbox"
							type="checkbox" value="600000" id="checkbox3"> <label
							class="form-check-label" for="checkbox3">Dưới 600.000 đ</label></li>
						<li class="mt-2 px-4"><input
							class="form-check-input filter-checkbox price-checkbox"
							type="checkbox" value="800000" id="checkbox4"> <label
							class="form-check-label" for="checkbox4">Dưới 800.000 đ</label></li>
					</ul>
				</div>
			</div>
			<div class="filter-sort mb-2" >
				<select class="form-select font-weight-bold pt-2 m-0" id="sort-select"
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
	<div class="row list-wish">
		<c:forEach begin="1" end="7">
			<div class="col-xl-3 col-lg-4 col-md-4 col-12">
				<div class="single-product border">
					<div class="product-img">
						<a href="product-details.html"> <img class="default-img"
							src="https://via.placeholder.com/550x750" alt="#"> <img
							class="hover-img" src="https://via.placeholder.com/550x750"
							alt="#">
						</a>
						<div class="button-head">
							<div class="product-action">
								<a data-toggle="modal" data-target="#exampleModal"
									title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
										Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
										to Wishlist</span></a> <a title="Compare" href="#"><i
									class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
							</div>
							<div class="product-action-2">
								<a title="Add to cart" href="#">Add to cart</a>
							</div>
						</div>
					</div>
					<div class="product-content p-2 pt-0 mt-0">
						<h3 class="text-truncate">
							<a href="product-details.html"
								style="max-width: 177px; text-wrap: wrap">Polo Dress For
								Wome13132311qweqeqwqwnme13132311qweqeqwqw</a>
						</h3>
						<div class="product-price">
							<span>$29.00</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
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
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<!-- Product Slider -->
							<div class="product-gallery">
								<div class="quickview-slider-active">
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
								</div>
							</div>
							<!-- End Product slider -->
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="quickview-content">
								<h2>Flared Shift Dress</h2>
								<div class="quickview-ratting-review">
									<div class="quickview-ratting-wrap">
										<div class="quickview-ratting">
											<i class="yellow fa fa-star"></i> <i
												class="yellow fa fa-star"></i> <i class="yellow fa fa-star"></i>
											<i class="yellow fa fa-star"></i> <i class="fa fa-star"></i>
										</div>
										<a href="#"> (1 customer review)</a>
									</div>
									<div class="quickview-stock">
										<span><i class="fa fa-check-circle-o"></i> in stock</span>
									</div>
								</div>
								<h3>$29.00</h3>
								<div class="quickview-peragraph">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Mollitia iste laborum ad impedit pariatur esse optio
										tempora sint ullam autem deleniti nam in quos qui nemo ipsum
										numquam.</p>
								</div>
								<div class="size">
									<div class="row">
										<div class="col-lg-6 col-12">
											<h5 class="title">Size</h5>
											<select>
												<option selected="selected">s</option>
												<option>m</option>
												<option>l</option>
												<option>xl</option>
											</select>
										</div>
										<div class="col-lg-6 col-12">
											<h5 class="title">Color</h5>
											<select>
												<option selected="selected">orange</option>
												<option>purple</option>
												<option>black</option>
												<option>pink</option>
											</select>
										</div>
									</div>
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
										<input type="text" name="quant[1]" class="input-number"
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
									<a href="#" class="btn">Add to cart</a> <a href="#"
										class="btn min"><i class="ti-heart"></i></a> <a href="#"
										class="btn min"><i class="fa fa-compress"></i></a>
								</div>
								<div class="default-social">
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->
</div>