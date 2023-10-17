<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row">
	<div class="col-lg-8 d-flex align-items-strech">
		<div class="card w-100">
			<div class="card-body">
				<div
					class="d-sm-flex d-block align-items-center justify-content-between mb-9">
					<div class="mb-3 mb-sm-0">
						<h5 class="card-title fw-semibold">Doanh thu theo ngày</h5>
					</div>
					<div>
						<select class="form-select">
							<option value="1">March 2023</option>
							<option value="2">April 2023</option>
							<option value="3">May 2023</option>
							<option value="4">June 2023</option>
						</select>
					</div>
				</div>
				<div id="chart"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="row">
			<div class="col-lg-12">
				<!-- Yearly Breakup -->
				<div class="card overflow-hidden">
					<div class="card-body p-4">
						<h5 class="card-title mb-9 fw-semibold">Doanh thu theo năm</h5>
						<div class="row align-items-center">
							<div class="col-8">
								<h4 class="fw-semibold mb-3">
									<fmt:setLocale value="vi_VN" />
									<fmt:formatNumber value="${nowYear }" type="currency"
										currencyCode="VND" maxFractionDigits="0" minFractionDigits="0" />
								</h4>
								<div class="d-flex align-items-center mb-3">
									<c:if test="${nowYear>=lastYear }">
										<span
											class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
											<i class="ti ti-arrow-up-left text-success"></i>
										</span>
										<p class="text-dark me-1 fs-3 mb-0">
											+
											<fmt:formatNumber value="${rateYear}" pattern="#.##" />
											%
										</p>
										<p class="fs-3 mb-0">năm trước</p>
									</c:if>
									<c:if test="${nowYear<lastYear }">
										<span
											class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
											<i class="ti ti-arrow-down-right text-danger"></i>
										</span>
										<p class="text-dark me-1 fs-3 mb-0">
											-
											<fmt:formatNumber value="${rateYear}" pattern="#.##" />
											%
										</p>
										<p class="fs-3 mb-0">năm trước</p>
									</c:if>
								</div>
								<div class="d-flex align-items-center">
									<div class="me-4">
										<span
											class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
										<span class="fs-2">2023</span>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="d-flex justify-content-center">
									<div id="breakup"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<!-- Monthly Earnings -->
				<div class="card">
					<div class="card-body">
						<div class="row alig n-items-start">
							<div class="col-8">
								<h5 class="card-title mb-9 fw-semibold">Doanh thu theo
									tháng trong năm</h5>
								<h4 class="fw-semibold mb-3">
									<fmt:setLocale value="vi_VN" />
									<fmt:formatNumber value="${nowMonth }" type="currency"
										currencyCode="VND" maxFractionDigits="0" minFractionDigits="0" />
								</h4>
								<div class="d-flex align-items-center pb-1">
									<c:if test="${nowMonth<lastMonth }">
										<span
											class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
											<i class="ti ti-arrow-down-right text-danger"></i>
										</span>
										<p class="text-dark me-1 fs-3 mb-0">
											-
											<fmt:formatNumber value="${rateMonth }" pattern="#.##" />
											%
										</p>
										<p class="fs-3 mb-0">tháng trước</p>
									</c:if>
									<c:if test="${nowMonth>=lastMonth }">
										<span
											class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
											<i class="ti ti-arrow-up-left text-success"></i>
										</span>
										<p class="text-dark me-1 fs-3 mb-0">
											+
											<fmt:formatNumber value="${rateMonth }" pattern="#.##" />
											%
										</p>
										<p class="fs-3 mb-0">tháng trước</p>
									</c:if>
								</div>
							</div>
							<div class="col-4">
								<div class="d-flex justify-content-end">
									<div
										class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
										<i class="ti ti-currency-dollar fs-6"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="earning"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-4 d-flex align-items-stretch">
		<div class="card w-100">
			<div class="card-body p-4">
				<div class="mb-4">
					<h5 class="card-title fw-semibold">Khách mua gần đây</h5>
				</div>
				<ul class="timeline-widget mb-0 position-relative mb-n5">
					<c:forEach var="item" items="${invoice}" varStatus="loop">
						<li class="timeline-item d-flex position-relative overflow-hidden">
							<div class="timeline-time text-dark flex-shrink-0 text-end">
								<fmt:formatDate value="${item.invoiceDate}" pattern="dd/MM/yyyy" />
							</div>
							<div
								class="timeline-badge-wrap d-flex flex-column align-items-center">
								<c:choose>
									<c:when test="${loop.index == 1}">
										<span
											class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
									</c:when>
									<c:when test="${loop.index  == 2}">
										<span
											class="timeline-badge border-2 border border-info flex-shrink-0 my-8"></span>
									</c:when>
									<c:when test="${loop.index  == 3}">
										<span
											class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
									</c:when>
									<c:when test="${loop.index  == 4}">
										<span
											class="timeline-badge border-2 border border-danger flex-shrink-0 my-8"></span>
									</c:when>
									<c:when test="${loop.index  == 5}">
										<span
											class="timeline-badge border-2 border border-warning flex-shrink-0 my-8"></span>
									</c:when>
									<c:otherwise>
										<span
											class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
									</c:otherwise>
								</c:choose>

								<span class="timeline-badge-border d-block flex-shrink-0"></span>
							</div>
							<div class="timeline-desc fs-3 text-dark mt-n1">
								KH: <span class="text-dark fw-bolder fs-3">${item.user.fullname }</span>
								đặt đơn trị giá
								<fmt:setLocale value="vi_VN" />
								<span class="text-danger fw-bolder fs-3"><fmt:formatNumber
										value="${item.totalAmount}" type="currency" currencyCode="VND"
										maxFractionDigits="0" minFractionDigits="0" /></span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-8 d-flex align-items-stretch">
		<div class="card w-100">
			<div class="card-body p-4">
				<h5 class="card-title fw-semibold mb-4">Sản phẩm bán gần đây</h5>
				<div class="table-responsive">
					<table class="table text-nowrap mb-0 align-middle">
						<thead class="text-dark fs-4">
							<tr>
								<th class="border-bottom-0">
									<h6 class="fw-semibold mb-0">STT</h6>
								</th>
								<th class="border-bottom-0">
									<h6 class="fw-semibold mb-0">Hãng/Loại</h6>
								</th>
								<th class="border-bottom-0">
									<h6 class="fw-semibold mb-0">Tên sản phẩm</h6>
								</th>
								<th class="border-bottom-0">
									<h6 class="fw-semibold mb-0">Giá bán</h6>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bestSeller" items="${bestSellers}"
								varStatus="loop">
								<c:if test="${loop.index<4 }">
									<tr>
										<td class="border-bottom-0"><h6 class="fw-semibold mb-0">${loop.index +1}</h6></td>
										<td class="border-bottom-0">
											<h6 class="fw-semibold mb-1 text-primary">${bestSeller[0].manufacturerProduct.manufacturerName }</h6>
											<span class="fw-normal">${bestSeller[0].categoryProduct.categoryName }</span>
										</td>
										<td class="border-bottom-0">
											<p class="mb-0 fw-normal">${bestSeller[1]}</p>
										</td>
										
										<td class="border-bottom-0">
											<h6 class="fw-semibold mb-0 fs-4 text-danger">
												<fmt:setLocale value="vi_VN" />
												<fmt:formatNumber value="${bestSeller[0].price }"
													type="currency" currencyCode="VND" maxFractionDigits="0"
													minFractionDigits="0" />
											</h6>
										</td>
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="py-6 px-6 text-center">
	<p class="mb-0 fs-4 fw-bold">
		ArtGroupES &copy by FPT Polytechnic Cần Thơ
	</p>
</div>