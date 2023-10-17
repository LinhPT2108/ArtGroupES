<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="table-responsive">
	<table id="statisticalTable" class="table table-hover">
		<thead>
			<tr>
				<th>STT</th>
				<th>Họ tên</th>
				<th>Ngày mua</th>
				<th>Tổng tiền</th>
				<th>Trạng thái</th>
				<th>Ghi chú</th>
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
					<td>${item.status==1?'Đang xử lý':item.status==2?'Đang giao hàng':'Giao hàng thành công' }</td>
					<td>${item.note}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>