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

		<form action="/account/profile/update-infor" method="POST" enctype="">
			<div class="row">
				<div class="col-xs-12 col-md-8 p-2">
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-3 col-form-label">Tên
							đăng nhập:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control border-0 bg-white"
								id="inputEmail3" placeholder="tên đăng nhập" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-3 col-form-label">Họ
							tên:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="inputPassword3"
								placeholder="Họ tên">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-3 col-form-label">Email:</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="inputPassword4"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-3 col-form-label">Số
							điện thoại:</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="inputPassword5"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group row">
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
					</div>
					<div class="form-group row">
						<div class="col-sm-9">
							<button type="submit" class="btn btn-primary">Lưu</button>
						</div>
					</div>

				</div>

				<div
					class="col-xs-12 col-md-4 border border-bottom-0 border-top-0 border-right-0 px-2">
					<div class="container">
						<div class="row justify-content-center">
							<div class="XWsmVn col-12 d-flex  justify-content-center mb-2">
								<div class="img" id="imageContainer"></div>
							</div>
							<input type="file" accept=".jpg,.jpeg,.png" name="avatar" id="fileInput"
								style="display: none;">
							<button type="button" class="btn btnChoose p-2 col-12 mb-2"
								onclick="chooseImage()">Chọn ảnh</button>
							<div class="L4SAGB col-12 mb-2">
								<div class="SlaeTm text-center text-muted">Dụng lượng file
									tối đa 1 MB</div>
								<div class="SlaeTm  text-center text-muted">Định dạng:
									.JPEG, .PNG</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>

	</div>
</div>

<script>
	function chooseImage() {
		var fileInput = document.getElementById("fileInput");
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
											})
								}
							}
						});

		fileInput.click();
	}
</script>