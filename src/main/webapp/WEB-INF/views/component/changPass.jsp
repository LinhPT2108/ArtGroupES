<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2">
		<span class="display-6">Đổi mật khẩu</span>
	</div>
	<div class="main-content p-3">
		<form action="/account/change-password" method="post" id="formChangePass">
			<div class="form-group mb-3">
				<label for="currentPass" class="form-label ">Mật khẩu hiện
					tại:</label> <input type="password"
					class="form-control "
					id="currentPass" name="currentPass" placeholder=""
					required="required">
					 <small class="text-danger d-none"
					id="currentPassError"></small>
			</div>

			<div class="form-group mb-3">
				<label for="newPassword" class="form-label ">Mật khẩu mới:</label> <input
					type="password"
					class="form-control "
					id="newPassword" name="newPassword" placeholder=""
					required="required">
					<small class="text-danger d-none"
					id="newPasswordError"></small>
			</div>

			<div class="form-group mb-3">
				<label for="confirmPassword" class="form-label ">Nhập lại
					mật khẩu mới:</label> <input type="password"
					class="form-control "
					id="confirmPassword" name="confirmPassword" placeholder=""
					required="required">
					<small class="text-danger d-none"
					id="confirmPasswordError"></small>
			</div>

			<div class="d-grid gap-2 mx-auto mb-3">
				<button class="btn" type="submit">Cập nhật</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		console.log('this is change pass')
		$('#formChangePass').submit(function(e) {
			e.preventDefault();
			let currentPass = $('#currentPass').val();
			let newPasswordInput = $('#newPassword').val();
			let confirmPasswordInput = $('#confirmPassword').val();
			let isvalid = false;
			if (currentPass == '') {
				$('#currentPassError').removeClass("d-none");
				$('#currentPassError').html("Vui lòng nhập mật khẩu hiện tại.");
				isvalid = true;
			} else {
				const pattern = /^(?=.*[A-Za-z]).{6,}$/;
	
				if (newPasswordInput == '') {
					$('#currentPassError').removeClass("d-none");
					$('#currentPassError').html("Vui lòng nhập mật khẩu hiện tại.");
					isvalid = true;
				} else if (!pattern.test(newPasswordInput)) {
					$('#newPasswordError').removeClass("d-none");
					$('#newPasswordError').html("Mật khẩu ít nhất 6 ký tự và ít nhất 1 chữ cái");
					isvalid = true;
				} else {
					$('#newPasswordError').addClass("d-none");
				}
	
				if (confirmPasswordInput != newPasswordInput) {
					$('#confirmPasswordError').removeClass("d-none");
					$('#confirmPasswordError').html("Xác nhận mật khẩu không chính xác.");
					isvalid = true;
				} else {
					$('#confirmPasswordError').addClass("d-none");
				}
	
				if (isvalid) {
					console.log(false)
				} else {
					$.ajax({
						type: 'POST',
						url: '/account/change-password',
						data: {
							newPass: newPasswordInput,
							currentPass: currentPass
						}, success: function(response) {
							console.log(response)
							if (response == 'success') {
								Swal.fire({
									icon: 'success',
									title: 'Cập nhật mật khẩu thành công !',
									text: 'Ấn Ok để tiếp tục',
									confirmButtonText: 'OK'
								})
								$('#currentPassError').html("");
								$('#newPasswordError').html("");
								$('#confirmPasswordError').html("");
								
							} else if (response == '404') {
								$('#currentPassError').removeClass("d-none");
								$('#currentPassError').html("Mật khẩu không chính xác.");
							}
						},
						error: function(xhr, status, error) {
							console.log(xhr)
							Swal.fire({
								icon: 'error',
								title: 'Opps... !',
								text: "Có lỗi xảy ra, vui lòng thử lại !",
								showConfirmButton: true,
								timer: 1500
							});
						}
					});
				}
			}
		});
	
	});
</script>