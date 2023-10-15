<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2">
		<span class="display-6">Hồ sơ của tôi</span>
		<div class="zptdmA">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
	</div>
	<div class="information mt-3">

		<form:form action="/account/profile/update-infor" method="POST"
			modelAttribute="us" id="formAccount" enctype="multipart/form-data">
			<div class="row">
				<div class="col-xs-12 col-md-8 p-2">
					<div class="form-group row">
						<form:label path="userId" cssClass="col-sm-3 col-form-label">Mã
							người dùng:</form:label>
						<div class="col-sm-9">
							<form:input type="text" cssClass="form-control border-0 bg-white"
								path="userId" placeholder="tên đăng nhập"
								value="${userLogin.userId }" readonly="readonly" />
							<small id="userIdError" class="text-danger"></small>
						</div>
					</div>
					<div class="form-group row">
						<form:label path="fullname" cssClass="col-sm-3 col-form-label">Họ
							tên:</form:label>
						<div class="col-sm-9">
							<form:input type="text" cssClass="form-control" path="fullname"
								placeholder="Họ tên" value="${userLogin.fullname }" />
							<small id="fullnameError" class="text-danger"></small>
						</div>
					</div>
					<div class="form-group row">
						<form:label path="email" cssClass="col-sm-3 col-form-label">Email:</form:label>
						<div class="col-sm-9">
							<form:input type="email" cssClass="form-control" path="email"
								placeholder="Email" value="${userLogin.email }" />
							<small id="emailError" class="text-danger"></small>
						</div>
					</div>
					<!-- <div class="form-group row">
						<label for="inputPassword3" class="col-sm-3 col-form-label">Giới
							tính:</label>
						<div class="col-sm-9 d-flex">
							<div class="d-flex mr-3">
								<input class="form-check mr-2" type="radio"
									name="inlineRadioOptions" id="inlineRadio2" value="option2">
								<label class="form-check" for="inlineRadio2">Nam</label>
							</div>
							<div class="d-flex">
								<input class="form-check mr-2" type="radio"
									name="inlineRadioOptions" id="inlineRadio3" value="option3">
								<label class="form-check" for="inlineRadio3">Nữ</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword6" class="col-sm-3 col-form-label">Ngày
							sinh:</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="inputPassword6">
						</div>
					</div> -->
					<div class="form-group row">
						<div class="col-sm-9">
							<form:button type="submit" class="btn btn-primary">Lưu</form:button>
						</div>
					</div>

				</div>

				<div
					class="col-xs-12 col-md-4 border border-bottom-0 border-top-0 border-right-0 px-2">
					<div class="container">
						<div class="row justify-content-center">
							<div class="XWsmVn col-12 d-flex  justify-content-center mb-2">
								<div class="img" id="imageContainer"
									style="background-image: url('../images/avatar/${userLogin.image!=null?userLogin.image:'default-avatar.jpg'}');"></div>
							</div>
							<input type="file" accept=".jpg,.jpeg,.png" name="avatar"
								id="image" style="display: none;" /> <small id="imageError"
								class="text-danger"></small>
							<button type="button" class="btn btnChoose p-2 col-12 mb-2"
								onclick="chooseImage()">Chọn ảnh</button>
							<div class="L4SAGB col-12 mb-2">
								<div class="SlaeTm text-center text-muted">Dung lượng file
									tối đa 1 MB</div>
								<div class="SlaeTm  text-center text-muted">Định dạng:
									.JPEG, .PNG</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>

	</div>
</div>

<script>
	function chooseImage() {
		var fileInput = document.getElementById("image");
		var imageContainer = document.getElementById("imageContainer");

		fileInput
				.addEventListener(
						"change",
						function() {
							var selectedFile = fileInput.files[0];
							var maxSize = 1 * 1024 * 1024;
							var allowedFormats = [ ".jpg", ".jpeg", ".png" ];

							if (selectedFile) {
								var fileSize = selectedFile.size;
								var fileFormat = selectedFile.name.substring(
										selectedFile.name.lastIndexOf('.'))
										.toLowerCase();

								if (fileSize <= maxSize
										&& allowedFormats.includes(fileFormat)) {
									var reader = new FileReader();

									reader.onload = function(e) {
										imageContainer.style.backgroundImage = "url("
												+ e.target.result + ")";
										imageContainer.style.display = "block";
									};

									reader.readAsDataURL(selectedFile);
								} else {
									Swal
											.fire({
												icon : 'error',
												title : 'Oops...',
												text : 'Dung lượng file tối đa 1 MB và có định dạng: .JPEG, .PNG!',
											});
									fileInput.value=null;
								}
							}
						});

		fileInput.click();
	}
	function copyBackgroundImageToImg() {
		var imageContainer = document.getElementById("imageContainer");
		var avatarImg = document.getElementById("avatar-right");

		if (imageContainer && avatarImg) {
			var backgroundImage = getComputedStyle(imageContainer)
					.getPropertyValue("background-image");

			// Loại bỏ các ký tự không cần thiết từ giá trị background-image
			backgroundImage = backgroundImage.replace('url("', '').replace(
					'")', '');

			avatarImg.src = backgroundImage;
		}
	}

	$(document).ready(function() {
		$('#formAccount').submit(function(event) {
			event.preventDefault();

			// Lấy dữ liệu từ form
			var form2 = $('#formAccount')[0];
			var data2 = new FormData(form2);
			var avatarValue = $('#image').val();
			console.log(avatarValue);
			console.log(data2)
			$.ajax({
				type : 'POST',
				enctype : 'multipart/form-data',
				upload : true,
				url : '/account/profile/update-infor',
				data : data2,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					if (data == 'success') {
						Swal.fire({
							icon : 'success',
							title : 'Cập nhật thành công',
							text : "Thông tin đã được cập nhật vào hệ thống !",
							showConfirmButton : true,
							timer : 1500
						});
						copyBackgroundImageToImg();
						$("#fullnameError").html("");
						$("#emailError").html("");
						console.log(data);
					} else {
						$("#fullnameError").html(data.fullname);
						$("#emailError").html(data.email);
						Swal.fire({
							icon : 'error',
							title : 'Cập nhật thất bại',
							text : "Vui lòng kiểm tra lại thông tin !",
							showConfirmButton : true,
							timer : 1500
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