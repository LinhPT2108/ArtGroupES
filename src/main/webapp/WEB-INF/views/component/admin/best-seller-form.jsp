<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="table-responsive">
	<table id="statisticalTable" class="table table-hover">
		<thead>
			<tr>
				<th>STT</th>
				<th>Mã sản phẩm</th>
				<th>Hãng sản xuất</th>
				<th>Loại sản phẩm</th>
				<th>Tên sản phẩm</th>
				<th>Số lượt bán</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bestSeller" items="${bestSellers}" varStatus="loop">
				<tr>
					<td>${loop.index }</td>
					<td>${bestSeller[0].productId }</td>
					<td>${bestSeller[0].manufacturerProduct.manufacturerName }</td>
					<td>${bestSeller[0].categoryProduct.categoryName }</td>
					<td>${bestSeller[1]}</td>
					<td>${bestSeller[2]}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>