<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2 d-flex align-items-center justify-content-between">
		<span class="display-6">Địa chỉ của tôi</span>

		<!-- Button trigger modal -->
		<button type="button" class="btn" data-toggle="modal"
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
						<%-- <form:form cssClass="form-address" method="post">
							<div class="form-group row">
								<form:label path="phone_number"
									cssClass="col-sm-3 col-form-label">Số điện thoại:</form:label>
								<div class="col-sm-9">
									<form:input path="phone_number"
										cssClass="form-control border-0 bg-white" />
								</div>

							</div>
						</form:form> --%>
						<form action="" class="form-address" method="post">
							<div class="form-group row">
								<label for="phone_number" class="col-sm-12 col-form-label">Số
									điện thoại:</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" id="phone_number"
										placeholder="">
								</div>
							</div>
							<div class="justify-content-center">
								<label class="form-label" for="city">Tỉnh/Thành phố,
									Quận/Huyện, Phường/Xã</label>
								<div class="row d-flex justify-content-around align-items-center gap-3">
									<div id="city" class="option-address"></div>
									<div id="district" class="option-address"></div>
									<div id="ward" class="option-address"></div>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Địa chỉ cụ thể</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="5" placeholder="tên đường, ấp, ..."></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Trở lại</button>
						<button type="button" class="btn btn-primary" id="btnCheck">Hoàn
							thành</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="address mt-3">
		<div class="p-3 border d-flex  justify-content-between align-items-center">
			<div class="infor d-flex flex-column">
				<span class="text-muted phone_number">0911726601</span> <span
					class="address_details">Address details</span> <span
					class="address_main">Phường Hưng Lợi, Quận Ninh Kiều, Cần
					Thơ </span>
			</div>
			<div class="site-action" style="color: #1318ec">
				<a type="button" href="#" class="btn-default border-0 bg-white mr-3" data-toggle="modal"
					data-target="#modalAddress">
					Cập nhật
				</a>
				<a type="button" href="#" class="btn-default border-0 bg-white">
					Xóa
				</a>
			</div>
		</div>
	</div>
</div>