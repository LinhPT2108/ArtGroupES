<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
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
					<td><select class="form-select statusSelect"
						${item.status==3 ? 'disabled' : ''}
						aria-label="Default select example"
						style="padding: 1px 38px 1px 16px;" data-item-id="${item.id}">
							<option value="1" ${item.status==1 ? 'selected' : ''}>Đang
								xử lý</option>
							<option value="2" ${item.status==2 ? 'selected' : ''}>Đang
								giao hàng</option>
							<option value="3" ${item.status==3 ? 'selected' : ''}>Giao
								hàng thành công</option>
					</select></td>
					<td>${item.note}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
	$(document).ready(function() {
		$(".statusSelect").change(function() {
			var selectedValue = $(this).val();
			var itemId = $(this).data("item-id");

			// Gửi yêu cầu Ajax
			$.ajax({
				url : "/admin/update-status", // Thay đổi đường dẫn tới endpoint cập nhật trạng thái
				type : "POST",
				data : {
					itemId : itemId,
					status : selectedValue
				},
				success : function(response) {
					// Xử lý phản hồi từ máy chủ (nếu cần)
				},
				error : function(xhr) {
					// Xử lý lỗi (nếu cần)
				}
			});
		});
	});
</script>
