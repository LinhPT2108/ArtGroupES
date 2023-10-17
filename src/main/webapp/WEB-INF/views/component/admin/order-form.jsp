<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="table-responsive">
	<table id="statisticalTable" class="table table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>UserName</th>
				<th>CreatedDate</th>
				<th>Total</th>
				<th>Note</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${invoice}">
				<tr>
					<td>${item.id}</td>
					<td>${item.user.fullname}</td>
					<td><fmt:formatDate value="${item.invoiceDate}"
							pattern="dd/MM/yyyy" /></td>
					<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
							value="${item.totalAmount}" type="currency" currencyCode="VND"
							maxFractionDigits="0" minFractionDigits="0" /></td>

					<td>${item.note}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>