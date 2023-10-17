<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="table-responsive">
	<table id="statisticalTable" class="table table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Họ tên</th>
				<th>Email</th>
				<th>Số hóa đơn</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderByUser" items="${ordersByUser}">
				<tr>
					<td>${orderByUser[0]}</td>
					<td>${orderByUser[1]}</td>
					<td>${orderByUser[2]}</td>
					<td>${orderByUser[3]}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>