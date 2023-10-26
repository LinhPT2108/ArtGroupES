<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="site-product">

	<form:form cssClass="row g-3 needs-validation"
		action="/admin/promotionalDetail" modelAttribute="promotionalDetail"
		method="POST" id="formpromotionalDetail">
		<div class="row">
			<div class="col-xs-12 col-md-7">
				<div class="row">
					<div class="col-12 mb-3">
						<input type="hidden" name="idflashSale" id="idflashSale"
							value="${idflashSale}" cssClass="form-control"></input>
					</div>
					<div class="col-12 mb-3">
						<form:input type="hidden" path="id" id="id"
							cssClass="form-control"></form:input>
					</div>
					<div class="col-12 mb-3">
						<label>Sản phẩm:</label> <br>
						<form:select cssClass="form-select" path="product">
							<form:option value="" label="Chọn..."></form:option>
							<form:options items="${productList}"></form:options>
						</form:select>
					</div>
					<div class="col-12 mb-3">
						<form:label path="discountedPrice" cssClass="form-label">Giá khuyến mãi:</form:label>
						<form:input type="currency" cssClass="form-control"
							path="discountedPrice"></form:input>
					</div>
				</div>
				<div class="col-12">
					<button class="btn btn-success"
						formaction="/admin/promotionalDetail/create">${typeButton}</button>
					<button formaction="/admin/promotionalDetail/${idflashSale}/update"
						class="btn btn-warning">${updateButton}</button>
					<button class="btn btn-danger"
						formaction="/admin/promotionalDetail/${idflashSale}/delete/${promotionalDetail.id}">${deleteButton}</button>
					<a href="/admin/promotionalDetail/${idflashSale}"
						class="btn btn-primary">Reset</a>
				</div>
			</div>
		</div>
	</form:form>
	<hr>
	<br>
	<div class="table-responsive">
		<table id="statisticalTable" class="table table-hover" style="vertical-align:middle;">
			<thead>
				<tr>
					<th>Id</th>
					<th>Tên sản phẩm</th>
					<th>SL tồn kho</th>
					<th>Giá gốc</th>
					<th>Giá khuyến mãi</th>
					<th>Trạng thái</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="promotionalDetail" items="${promotionalDetails}">
					<tr>
						<td>${promotionalDetail.id}</td>
						<td>${promotionalDetail.product.productName}</td>
						<td>${promotionalDetail.product.quantityInStock}</td>

						<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
								value="${promotionalDetail.product.price}" type="currency"
								currencyCode="VND" maxFractionDigits="0" minFractionDigits="0" />
						</td>
						<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
								value="${promotionalDetail.discountedPrice}" type="currency"
								currencyCode="VND" maxFractionDigits="0" minFractionDigits="0" />
						</td>
						<td><c:choose>
								<c:when test="${promotionalDetail.status == false}">Đang hoạt động</c:when>
								<c:otherwise>Ngưng hoạt động</c:otherwise>
							</c:choose></td>
						<td><a class="btn btn-warning"
							href="/admin/promotionalDetail/${idflashSale}/edit/${promotionalDetail.id}">Chỉnh
								sửa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

