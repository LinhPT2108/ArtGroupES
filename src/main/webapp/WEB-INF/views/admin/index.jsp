<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${title }</title>
<link rel="shortcut icon" type="image/png"
	href="../../../../images/favicon.png" />
<link rel="stylesheet" href="../../../../assets/css/styles.min.css" />

<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
<c:if test="${views=='product-form' }">
	<link rel="stylesheet" href="../../../../assets/css/productStyle.css" />
</c:if>
<script src="../../../../assets/libs/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
</head>
<link rel="stylesheet" type="text/css"
	href="../../../../css/admin-page.css">

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
		<aside class="left-sidebar">
			<!-- Sidebar scroll-->
			<div>
				<div
					class="brand-logo d-flex align-items-center justify-content-between">
					<a href="/admin/dashboard" class="text-nowrap logo-img"> <img
						src="../../../../assets/images/logos/logo.png" width="180" alt="" />
					</a>
					<div
						class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
						id="sidebarCollapse">
						<i class="ti ti-x fs-8"></i>
					</div>
				</div>
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav scroll-sidebar" data-simplebar="">
					<ul id="sidebarnav">
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">TRANG CHỦ</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/dashboard" aria-expanded="false"> <span>
									<i class="ti ti-layout-dashboard"></i>
							</span> <span class="hide-menu">Bảng điều khiển</span>
						</a></li>
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">GIAO DIỆN QUẢN LÍ</span></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/manufacturer" aria-expanded="false"> <span>
									<i class="ti ti-package"></i>
							</span> <span class="hide-menu">Thương hiệu</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/category" aria-expanded="false"> <span> <i
									class="ti ti-folder"></i>
							</span> <span class="hide-menu">Loại sản phâm</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/product" aria-expanded="false"> <span> <i
									class="ti ti-tag"></i>
							</span> <span class="hide-menu">Sản phẩm</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/statistical-order" aria-expanded="false"> <span>
									<i class="ti ti-receipt"></i>
							</span> <span class="hide-menu">Quản lý hóa đơn</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/banner" aria-expanded="false"> <span> <i
									class="ti ti-slideshow"></i>
							</span> <span class="hide-menu">Banner</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/userCustom" aria-expanded="false"> <span>
									<i class="ti ti-users"></i>
							</span> <span class="hide-menu">Tài khoản</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/flashSale" aria-expanded="false"> <span>
									<i class="ti ti-receipt"></i>
							</span> <span class="hide-menu">Khuyến mãi</span>
						</a></li>
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
							class="hide-menu">THỐNG KÊ & DOANH THU</span></li>

						<!-- <li class="sidebar-item"><a class="sidebar-link"
							href="/admin/statistical-wishlist" aria-expanded="false"> <span>
									<i class="ti ti-user-plus"></i>
							</span> <span class="hide-menu">Lượt thích</span>
						</a></li> -->
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/statistical-best-seller" aria-expanded="false">
								<span> <i class="ti ti-trophy"></i>
							</span> <span class="hide-menu">Sản phẩm bán chạy</span>
						</a></li>
						<li class="sidebar-item"><a class="sidebar-link"
							href="/admin/statistical-orders-by-user" aria-expanded="false">
								<span> <i class="ti ti-clipboard"></i>
							</span> <span class="hide-menu">Đơn hàng theo tài khoản</span>
						</a></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<header class="app-header">
				<nav class="navbar navbar-expand-lg navbar-light">
					<ul class="navbar-nav">
						<h2>${title }</h2>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item d-block d-xl-none"><a
							class="nav-link sidebartoggler nav-icon-hover"
							id="headerCollapse" href="javascript:void(0)"> <i
								class="ti ti-menu-2"></i>
						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="javascript:void(0)"
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="../../../../images/avatar/${userLogin.image }" alt=""
									width="35" height="35" class="rounded-circle">
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="drop2">
									<div class="message-body">
										<a href="/account/profile"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-user fs-6"></i>
											<p class="mb-0 fs-3">My Profile</p>
										</a> <a href="/account/logout"
											class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->
			<div class="container-fluid">
				<jsp:include page="../component/admin/${views}.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<script
		src="../../../../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../../../../assets/js/sidebarmenu.js"></script>
	<script src="../../../../assets/js/app.min.js"></script>
	<script src="../../../../assets/js/datatables-simple-demo.js"></script>
	<c:if test="${views=='dashboard'}">
		<script src="../../../../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
		<script src="../../../../assets/libs/simplebar/dist/simplebar.js"></script>
		<script src="../../../../assets/js/dashboard.js"></script>

	</c:if>
	<c:if test="${views=='product-form' }">
		<script src="../../../../assets/js/product.js"></script>
	</c:if>
	<script
		src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#statisticalTable').DataTable({
				paging : true
			});
		});
	</script>
</body>

</html>