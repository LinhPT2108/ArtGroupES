<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="site-product">
	<form:form cssClass="row g-3 needs-validation"
		action="/admin/flashSale" modelAttribute="flashSale" method="POST"
		id="formFlashSale">
		<div class="row">
			<div class="col-xs-12 col-md-7">
				<div class="row">
				 	<div class="col-12 mb-3">
						<%-- <form:label path="id" cssClass="form-label">Id:</form:label>  --%>
						<form:input type="hidden" cssClass="form-control" path="id" 
							readonly="true"></form:input>
						<form:errors path="id" cssClass="text-danger"></form:errors>
					</div>
					<div class="col-12 mb-3">
						<form:label path="startDay" cssClass="form-label">Ngày bắt đầu:</form:label>
						<form:input type="date" cssClass="form-control" path="startDay" ></form:input>
						<form:errors path="startDay" cssClass="text-danger"></form:errors>
					</div>
					<div class="col-12 mb-3">
						<form:label path="endDay" cssClass="form-label">Ngày kết thúc:</form:label>
						<form:input type="date" cssClass="form-control" path="endDay" ></form:input>
						<form:errors path="endDay" cssClass="text-danger"></form:errors>
					</div>
					<%-- <div class="col-12 mb-3">
						<form:label path="isStatus" cssClass="form-label">Thông tin:</form:label>
						<form:input type="text" cssClass="form-control" path="isStatus" ></form:input>
						<form:errors path="isStatus" cssClass="text-danger"></form:errors>
					</div> --%>
				</div>
				<div class="col-12">
					<button class="btn btn-success"
						formaction="/admin/flashSale/create">${typeButton}</button>
					<button formaction="/admin/flashSale/update"
						class="btn btn-warning">${updateButton}</button>
					<button formaction="/admin/flashSale/delete/${flashSale.id}"
						class="btn btn-danger">${deleteButton}</button>
					<a href="/admin/flashSale"
						class="btn btn-primary">Reset</a>
				</div>
			</div>
		</div>
	</form:form>
	<hr>
	<br>
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="row">
				<table border="1" style="width: 100%">
					<tr>
						<th>Id</th>
						<th>Ngày bắt đầu</th>
						<th>Ngày kết thúc</th>
						<!-- <th>Thông tin</th> -->
						<th></th>
					</tr>
					<c:forEach var="flashSale" items="${flashSales}">
						<tr>
							<td>${flashSale.id}</td>
							<td>${flashSale.startDay}</td>
							<td>${flashSale.endDay}</td>
							<%-- <td>${flashSale.isStatus}</td> --%>
							<td><a href="/admin/flashSale/edit/${flashSale.id}">Edit</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</div>

