<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- Favicon -->
<link rel="icon" type="image/png" href="images/favicon.png">
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
						<div class="carousel-item active">
							<img class="d-block w-100"
								src="https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ll1wvj78hn7v6d"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ll1wvj78hn7v6d"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-ll1wvj78hn7v6d"
								alt="Third slide">
						</div>
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
						<span>Sữa Chống Nắng Dưỡng Da Anessa Perfect UV
							SPF50+/PA++++ 60ml</span>
					</div>
				</div>
				<!--số lượng bán, sao-->
				<div class="thongtinchitietsanpham d-flex flex-row">
					<button class="thongtindau d-flex flex-row">
						<div class="sosao"
							style="color: #ee4d2d; border-bottom-color: #ee4d2d; margin-right: 5px;">4.9</div>
						<div class="5sao">
							<i class="bi bi-star-fill mausao"> </i> <i
								class="bi bi-star-fill mausao"> </i> <i
								class="bi bi-star-fill mausao"> </i> <i
								class="bi bi-star-fill mausao"> </i> <i
								class="bi bi-star-fill mausao"> </i>
						</div>
					</button>
					<button class="thongtingiua d-flex flex-row">
						<div class="sodanhgia" style="margin: 5px;">11,3k</div>
						<div class="tendanhgia">Đánh giá</div>
					</button>
					<button class="thongtincuoi d-flex flex-row">
						<div class="sodaban">45,7</div>
						<div class="tendaban">Đã bán</div>
					</button>
				</div>
				<!--FlashSale, Giá-->
				<div style="margin-top: 10px;">
					<div class="flashsale">
						<h4>FLASH SALE</h4>
						<div class="khoangcachflashsalevaketthuc"></div>
						<div class="ketthuctrong">Kết thúc trong</div>
						<div class="dinhdangkhungdem">
							<div class="giaodiendem">
								<div style="color: white;">00</div>
							</div>
							<div class="khoangcachgiaodiendem"></div>
							<div class="giaodiendem">
								<div style="color: white;">00</div>
							</div>
							<div class="khoangcachgiaodiendem"></div>
							<div class="giaodiendem">
								<div style="color: white;">00</div>
							</div>
						</div>
					</div>
					<div class="thongtingia">
						<div class="d-flex flex-row"
							style="flex-wrap: wrap; width: 625px; flex-basis: 625px; min-height: 1.875rem;">
							<!-- giá cũ -->
							<div class="giacu">đ715.000</div>
							<!-- giá mới -->
							<div class="d-flex flex-row " style="align-items: center;">
								<div class="giamoi">đ429.000</div>
								<!-- 40% giảm -->
								<div class="giamgia">40% giảm</div>
							</div>
						</div>
					</div>
				</div>
				<!--số lượng-->
				<div class="dinhdangkhungsoluong">
					<div style="flex-direction: column;">
						<!--số lượng-->
						<section class="d-flex flex-row" style="color: #757575;">
							<h3
								style="color: #757575; width: 110px; text-transform: capitalize; flex-shrink: 0; align-items: center; font-size: inherit; font-weight: 400; margin: 0;">Số
								lượng</h3>
							<div
								style="flex-basis: 32.1875rem; max-width: 32.1875rem; flex-wrap: wrap;">
								<div style="margin-right: 15px;">
									<div class="dinhdangnutsoluong">
										<button class="nut">
											<i class="bi bi-dash-lg nutgiam"></i>
										</button>
										<input class="nut soluong" aria-live="assertive"
											aria-valuenow="1" value="1" type="text" role="spinbutton"
											name id>
										<button class="nut">
											<i class="bi bi-plus-lg nuttang"></i>
										</button>
									</div>
								</div>
								<div>199 Sản phẩm có sẵn</div>
							</div>
						</section>
					</div>
				</div>
				<!-- Nút giỏ hàng và mua ngay -->
				<div style="margin-top: 15px;">
					<div style="padding-left: 1.25rem;">
						<div style="display: flex;">
							<button type="button" class="nutgiohang maunutmua">Thêm
								vào giỏ hàng</button>
							<button type="button" class="nutgiohang maunutmua">Mua
								ngay</button>
							<a href class="nutgiohang maunutthich"> <span
								style="color: red;"><i class="bi bi-heart"></i></span>
							</a>
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
							<label class="labelchitietsanpham" for>Danh Mục</label>
							<div>Bình Dương</div>
						</div>
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Danh Mục</label>
							<div>Bình Dương</div>
						</div>
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Danh Mục</label>
							<div>Bình Dương</div>
						</div>
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Danh Mục</label>
							<div>Bình Dương</div>
						</div>
						<div class="dongchitietsp">
							<label class="labelchitietsanpham" for>Danh Mục</label>
							<div>Bình Dương</div>
						</div>
					</div>
				</section>
				<!-- Mô tả sản phẩm -->
				<section class="motasanpham">
					<h2 class="titlemotasanpham">CHI TIẾT SẢN PHẨM</h2>
					<div style="margin: 1.875rem .9375rem .9375rem;">
						<p>Thành phần và công dụng: - Sữa Chống Nắng Dưỡng Da Anessa
							Perfect UV SPF50+/PA++++ sữa chống nắng dưỡng da và bảo vệ da tối
							đa với kết cấu mỏng nhẹ, khô ráo. - Hiệu quả chống trôi trong
							nước rất cao với công nghệ Aqua Booster EX. - Dưỡng da ẩm mượt,
							gia tăng độ đàn hồi, chống oxi hoá, và kiểm soát bóng dầu. - Có
							thể dùng làm lớp lót trang điểm, dễ dàng làm sạch với sữa rửa
							mặt. - Dùng cho mặt và toàn thân. - Thích hợp sử dụng hàng ngày
							và các hoạt động ngoài trời. - Công thức được kiểm nghiệm bởi
							chuyên gia da liễu, an toàn cho sức khỏe người tiêu dùng.</p>
					</div>
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
					<!-- mỗi 1 div là 1 phần bình luận -->
					<div class="comment-rating">
						<a href class="avatar-rating">
							<div class="avatar-background">
								<img
									src="https://down-vn.img.susercontent.com/file/6ae595b087d32e50949dbe904838e9e6_tn"
									alt class="img-rating">
							</div>
						</a>
						<div class="main-rating" style="flex: 1;">
							<a href class="name-comment">thienbao0909</a>
							<div class="5sao">
								<i class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i>
							</div>
							<div class="time-comment">2022-05-01 12:02</div>
							<div style="margin: 0.5rem 0 0.5rem 0;">Kem chống nắng của
								anessa thì khỏi chê rồi. Mk mua sales xong lại đc tặng sample
								nhỏ nhỏ xinh tật sự.</div>
							<div class="product-rating-img">
								<div style="display: flex; width: 100%; flex-wrap: wrap;">
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment-rating">
						<a href class="avatar-rating">
							<div class="avatar-background">
								<img
									src="https://down-vn.img.susercontent.com/file/6ae595b087d32e50949dbe904838e9e6_tn"
									alt class="img-rating">
							</div>
						</a>
						<div class="main-rating" style="flex: 1;">
							<a href class="name-comment">thienbao0909</a>
							<div class="5sao">
								<i class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i>
							</div>
							<div class="time-comment">2022-05-01 12:02</div>
							<div style="margin: 0.5rem 0 0.5rem 0;">Kem chống nắng của
								anessa thì khỏi chê rồi. Mk mua sales xong lại đc tặng sample
								nhỏ nhỏ xinh tật sự.</div>
							<div class="product-rating-img">
								<div style="display: flex; width: 100%; flex-wrap: wrap;">
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment-rating">
						<a href class="avatar-rating">
							<div class="avatar-background">
								<img
									src="https://down-vn.img.susercontent.com/file/6ae595b087d32e50949dbe904838e9e6_tn"
									alt class="img-rating">
							</div>
						</a>
						<div class="main-rating" style="flex: 1;">
							<a href class="name-comment">thienbao0909</a>
							<div class="5sao">
								<i class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i> <i
									class="bi bi-star-fill mausao"> </i>
							</div>
							<div class="time-comment">2022-05-01 12:02</div>
							<div style="margin: 0.5rem 0 0.5rem 0;">Kem chống nắng của
								anessa thì khỏi chê rồi. Mk mua sales xong lại đc tặng sample
								nhỏ nhỏ xinh tật sự.</div>
							<div class="product-rating-img">
								<div style="display: flex; width: 100%; flex-wrap: wrap;">
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
									<div class="frames-rating-img">
										<img class="hinhanhdanhgia"
											src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
											alt>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Các sản phẩm khác -->
	<div>
		<div class="dinhdangkhungcacspkhac">
			<div class="khoangcachtitlespkhacvasp">
				<div class="cacspkhaccuashop">CÁC SẢN PHẨM KHÁC CỦA SHOP</div>
			</div>
			<div
				style="padding-top: 0.3125rem; margin-right: -0.3125rem; margin-left: -0.3125rem;">
				<div style="height: 100%; overflow: hidden; touch-action: pan-y;">
					<ul
						style="width: 100%; transform: translate(0px, 0px); transition: all 500ms ease 0s;">
						<div id="carouselExampleControls" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<li
										style="padding: 0px; width: 100%; overflow-x: hidden; list-style: none; float: left; touch-action: pan-y; margin: 10px;"
										class="d-flex flex-row">
										<!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4wcmjjysf5e_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp -->
									</li>
								</div>
								<div class="carousel-item">
									<li
										style="padding: 0px; width: 100%; overflow-x: hidden; list-style: none; float: left; touch-action: pan-y; margin: 10px;"
										class="d-flex flex-row">
										<!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4n1ort9svda_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4n1ort9svda_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4n1ort9svda_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4n1ort9svda_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4n1ort9svda_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp -->
									</li>
								</div>
								<div class="carousel-item">
									<li
										style="padding: 0px; width: 100%; overflow-x: hidden; list-style: none; float: left; touch-action: pan-y; margin: 10px;"
										class="d-flex flex-row">
										<!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4z11wg25b1d_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4z11wg25b1d_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4z11wg25b1d_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4z11wg25b1d_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp --> <!-- 1 sp  -->
										<div class="dinhdangkhung1product">
											<div class="dinhdangvien1product">
												<!-- định dạng hình ảnh sản phẩm -->
												<div style="pointer-events: none;">
													<div class="kichthuockhung1sp">
														<img class="vitrihinhanhsp"
															src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmh4z11wg25b1d_tn"
															alt width="invalid-value" height="invalid-value">
													</div>
												</div>
												<!-- định dạng nội dung sản phẩm  -->
												<div class="dinhdangkhungtitlespkhac">
													<div
														style="flex: 1 0 auto; display: flex; flex-direction: column;">
														<div class="phan-title-sanphamkhac">
															<div class="dinh-dang-title-sanpham">Sữa chống nắng
																bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare
																Milk 60ml</div>
														</div>
														<div class="phan-gia-sanphamkhac">
															<div class="khung-gia-sanphamkhac">
																<span style="color: rgb(238, 77, 45);">₫</span> <span
																	class="dinh-dang-gia-sanphamkhac">469.000</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- kết thúc 1 sp -->
									</li>
								</div>
							</div>
							<!-- 2 nút carosel-->
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

					</ul>
				</div>
			</div>
		</div>

	</div>

	<!-- Start Footer Area -->
	<jsp:include page="component/_footer.jsp"></jsp:include>
	<!-- /End Footer Area -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
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
	<script src="js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="../js/easing.js"></script>
	<!-- Active JS -->
	<script src="../js/active.js"></script>
</body>
</html>