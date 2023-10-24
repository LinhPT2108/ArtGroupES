<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="site-product">
	<form:form cssClass="row g-3 needs-validation" action="/admin/product"
		modelAttribute="pd" method="POST" id="formProduct">
		<div class="col-xs-12 col-md-7">
			<div class="row">
				<form:hidden path="productId" value="" />
				<div class="col-12 mb-3">
					<form:label path="productName" cssClass="form-label">Tên sản phẩm</form:label>
					<form:input type="text" cssClass="form-control" path="productName"
						autocomplete="none"></form:input>
					<small class="text-danger fst-italic" id="productNameError"></small>
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="categoryProduct" class="form-label">Loại sản phẩm</form:label>
					<form:select path="categoryProduct" class="form-select">
						<form:option value="" label="Chọn..." />
						<form:options items="${categoriesList}" />
					</form:select>
					<small class="text-danger fst-italic" id="categoryProductError"></small>
				</div>

				<div class="col-md-6 mb-3">
					<form:label path="manufacturerProduct" cssClass="form-label">Thương hiệu</form:label>
					<form:select cssClass="form-select" path="manufacturerProduct">
						<form:option value="" label="Chọn..."></form:option>
						<form:options items="${manufacturerList}"></form:options>
					</form:select>
					<small class="text-danger fst-italic" id="manufacturerProductError"></small>
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="price" cssClass="form-label">Giá bán</form:label>
					<form:input type="number" cssClass="form-control" path="price"
						autocomplete="none"></form:input>
					<small class="text-danger fst-italic" id="priceError"></small>
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="quantityInStock" cssClass="form-label">Số lượng
						trong kho</form:label>
					<form:input type="number" cssClass="form-control"
						path="quantityInStock" autocomplete="none"></form:input>
					<small class="text-danger fst-italic" id="quantityInStockError"></small>
				</div>
				<div class="col-12 mb-3">
					<form:label path="" cssClass="form-label mb-3">Thông tin chi tiết:</form:label>
					<div class="describe row">
						<div class="col-xs-12 col-md-6 mb-3 ">
							<div class=" border border-1 p-3 position-relative">
								<span class="position-absolute z-3 bg-white" style="top: -13px">Mô
									tả 1:</span>
								<div class="mb-3">
									<div class="form-floating">
										<form:input type="text" cssClass="form-control" path=""
											id="tieude1" placeholder="124"></form:input>
										<form:label path="" id="tieude1">Tiêu đề:</form:label>
									</div>
								</div>
								<div class="form-floating">
									<form:textarea cssClass="form-control"
										placeholder="Leave a comment here" path=""
										style="height: 100px;"></form:textarea>
									<form:label path="">Nội dung:</form:label>
								</div>
							</div>
						</div>
						<button type="button" class="button ms-2  mb-3"
							onclick="themMoTa()">
							<span class="button__text">Thêm mô tả</span> <span
								class="button__icon"><svg
									xmlns="http://www.w3.org/2000/svg" width="24"
									viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round"
									stroke-linecap="round" stroke="currentColor" height="24"
									fill="none" cssClass="svg">
                                                <line y2="19" y1="5"
										x2="12" x1="12"></line>
                                                <line y2="12" y1="12"
										x2="19" x1="5"></line>
                                            </svg></span>
						</button>
					</div>
				</div>
			</div>
			<div class="col-12">
				<form:button class="btn btn-primary" type="submit"
					id="btnAddProduct">${typeButton }</form:button>
				<form:button formmethod="post"
					formaction="/admin/product/${productId }">Cập nhật</form:button>
			</div>

		</div>
		<div class="col-xs-12 col-md-5">
			<div class="mb-3">
				<form:label path="" cssClass="form-label">Hình ảnh:</form:label>
				<ul id="imageList">
					<li class="" style="list-style: none;"><form:label
							cssClass="custum-file-upload" path="">
							<div class="icon">
								<svg xmlns="http://www.w3.org/2000/svg" fill=""
									viewBox="0 0 24 24">
                                            <g stroke-width="0"
										id="SVGRepo_bgCarrier"></g>
                                            <g stroke-linejoin="round"
										stroke-linecap="round" id="SVGRepo_tracerCarrier">
                                            </g>
                                            <g id="SVGRepo_iconCarrier">
                                                <path fill=""
										d="M10 1C9.73478 1 9.48043 1.10536 9.29289 1.29289L3.29289 7.29289C3.10536 7.48043 3 7.73478 3 8V20C3 21.6569 4.34315 23 6 23H7C7.55228 23 8 22.5523 8 22C8 21.4477 7.55228 21 7 21H6C5.44772 21 5 20.5523 5 20V9H10C10.5523 9 11 8.55228 11 8V3H18C18.5523 3 19 3.44772 19 4V9C19 9.55228 19.4477 10 20 10C20.5523 10 21 9.55228 21 9V4C21 2.34315 19.6569 1 18 1H10ZM9 7H6.41421L9 4.41421V7ZM14 15.5C14 14.1193 15.1193 13 16.5 13C17.8807 13 19 14.1193 19 15.5V16V17H20C21.1046 17 22 17.8954 22 19C22 20.1046 21.1046 21 20 21H13C11.8954 21 11 20.1046 11 19C11 17.8954 11.8954 17 13 17H14V16V15.5ZM16.5 11C14.142 11 12.2076 12.8136 12.0156 15.122C10.2825 15.5606 9 17.1305 9 19C9 21.2091 10.7909 23 13 23H20C22.2091 23 24 21.2091 24 19C24 17.1305 22.7175 15.5606 20.9844 15.122C20.7924 12.8136 18.858 11 16.5 11Z"
										clip-rule="evenodd" fill-rule="evenodd"></path>
                                            </g>
                                        </svg>
							</div>
							<div class="text">
								<span>Tải ảnh lên</span>
							</div>
							<form:input type="file" path="" id="file"></form:input>
						</form:label></li>
				</ul>
			</div>
		</div>
	</form:form>
	<div id="errorMessages"></div>
</div>
<script type="text/javascript">
function generateRandomString() {
    var randomString = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < 8; i++) {
        randomString += characters.charAt(Math.floor(Math.random() * charactersLength));
    }

    var currentTimeMillis = new Date().getTime();

    var finalString = randomString + currentTimeMillis.toString();

    return finalString;
}

var randomString = generateRandomString();

document.getElementById('productId').value = randomString;

	$(document).ready(function() {
		$('#formProduct').submit(function(event) {
			event.preventDefault(); 

			// Lấy dữ liệu từ form
			var formData = $(this).serialize();

			$.ajax({
				type : 'POST',
				url : '/admin/product',
				data : formData,
				success : function(data) {
					if (data == 'success') {
						Swal
						.fire({
							icon: 'success',
							title: 'Thêm thành công',
							text: "Sản phẩm đã được thêm vào hệ thống !",
							showConfirmButton: true,
							timer: 1500
						});
						console.log(formData);
					} else {
						$("#productNameError").html(data.productName);
						$("#categoryProductError").html(data.categoryProduct);
						$("#manufacturerProductError").html(data.manufacturerProduct);
						$("#quantityInStockError").html(data.quantityInStock);
						$("#priceError").html(data.price);
						Swal
						.fire({
							icon: 'error',
							title: 'Thêm sản phẩm thất bại',
							text: "Vui lòng kiểm tra lại thông tin !",
							showConfirmButton: true,
							timer: 1500
						});
						console.log(data)
					}
				},
				error : function(xhr, status, error) {
					console.log('Ajax errors');
				}
			});
		});
	});
</script>