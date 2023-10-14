<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2 d-flex align-items-center justify-content-between">
		<span class="display-6">Địa chỉ của tôi</span>

		<!-- Button trigger modal -->
		<button type="button" class="btn btnCreateAddress" data-toggle="modal"
			data-target="#modalAddress">
			<i class="ti ti-plus mr-2 px-2"></i>Thêm địa chỉ mới
		</button>

		<!-- Modal -->
		<div class="modal fade bd-example-modal-sm" id="modalAddress"
			tabindex="-1" role="dialog" aria-labelledby="modalAddressTitle"
			aria-hidden="true" style="max-width: 600px; margin: auto;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" style="max-width: 600px; height: 508px">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Địa chỉ
							mới</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<form:form action="" id="formAddress" cssClass="form-address"
							method="post" modelAttribute="infAddress">
							<div class="form-group row">
								<form:label path="phoneNumber"
									cssClass="col-sm-12 col-form-label">Số
									điện thoại:</form:label>
								<div class="col-sm-12">
									<form:input type="text" cssClass="form-control"
										path="phoneNumber" placeholder="" />
									<small id="phoneNumberError" class="text-danger"></small>
								</div>
							</div>
							<div class="justify-content-center mb-3">
								<label class="form-label" for="city">Tỉnh/Thành phố,
									Quận/Huyện, Phường/Xã</label>
								<div
									class="row d-flex justify-content-around align-items-center gap-3">
									<div id="city" class="option-address"></div>
									<div id="district" class="option-address"></div>
									<div id="ward" class="option-address"></div>
								</div>
								<form:input path="address" type="hidden" />
								<small id="addressError" class="text-danger"></small>
							</div>
							<div class="form-group">
								<label for="detail_address">Địa chỉ cụ thể</label>
								<textarea class="form-control" id="detail_address" rows="5"
									placeholder="tên đường, ấp, ..." required="required"></textarea>
							</div>
						</form:form>
					</div>
					<div class="modal-footer">
						<a type="button" class="btn btn-secondary text-white"
							data-dismiss="modal" style="cursor: pointer;">Trở lại</a>
						<a role="button" class="btn btn-primary" id="btnCheck" href="">Hoàn
							thành</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="address mt-3">
		<c:if test="${userAddress.totalPages==0 }">
			<div
				class="p-3 d-flex  justify-content-between align-items-center mb-3">
					<h6 class="text-danger">Bạn chưa có địa chỉ, hãy thêm địa chỉ mới !</h6>
				</div>
		</c:if>
		<c:forEach items="${userAddress.content}" var="ad">
			<div
				class="p-3 border d-flex  justify-content-between align-items-center mb-3">
				<div class="infor d-flex flex-column">
					<span class="phone_number font-weight-bold">Số điện thoại:
						${ad.phoneNumber }</span><span class="address_main font-weight-bold">Địa
						chỉ: ${ad.address }</span>
				</div>
				<div class="site-action" style="color: #1318ec">
					<a type="button" href="/account/address/edit/${ad.phoneNumber }"
						class="btn-default border-0 bg-white mr-3 btnUpdateAddress" data-toggle="modal"
						data-target="#modalAddress"> Cập nhật </a> <a
						type="button" href="/account/address/delete/${ad.phoneNumber }"
						class="btn-default border-0 bg-white btnDeleteAddress" id="">
						Xóa </a>
				</div>
			</div>
		</c:forEach>
	</div>
	<c:if test="${userAddress.totalPages>1 }">
		<div class="paganation-site">
			<nav aria-label="..." class="">
				<ul
					class="pagination d-flex justify-content-center align-items-center">
					<li class="page-item ${userAddress.number==0?'disabled':'' }"><a
						class="page-link" href="?p=${userAddress.number-1}" tabindex="-1"><i
							class="ti ti-arrow-left"></i></a></li>
					<li class="page-item active"><a class="page-link"
						href="?p=${userAddress.number }">${userAddress.number+1}</a></li>

					<li
						class="page-item ${userAddress.number+1==userAddress.totalPages?'disabled':'' }"><a
						class="page-link " href="?p=${userAddress.number+1 }"><i
							class="ti ti-arrow-right"></i></a></li>
					<li class="ml-3 choose-page"><select name="selectedPage mb-0"
						id="selectedPage">
							<option value="">--Chọn trang--</option>
							<c:forEach begin="1" end="${userAddress.totalPages }"
								varStatus="i" var="page">
								<option value="${i.index}" class="option-page">${i.index}</option>
							</c:forEach>
					</select></li>
				</ul>
			</nav>
		</div>
	</c:if>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		// Lặp qua tất cả các phần tử <li> bên trong thẻ có class "choose-page"
		$(".choose-page .option").click(function() {
			var selectedPageValue = $(this).data("value");
			if (selectedPageValue !== "") {
				selectedPageValue = parseInt(selectedPageValue, 10) - 1; // Giảm giá trị đi 1
				window.location.href = "?p=" + selectedPageValue;
			}
		});
	});
</script>
