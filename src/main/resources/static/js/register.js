$(document).ready(function() {
	console.log('this is register js')
	$('#formRegister').submit(function(e) {
		e.preventDefault();
		let userid = generateRandomString();
		console.log(userid);
		var form = $('#formRegister')[0];
		var data2 = new FormData(form);
		data2.append('userId', userid);
		data2.append('confirmPassword', $('#confirmPassword').val());
		console.log(data2)
		$.ajax({
			type: "POST",
			url: '/account/register',
			processData: false,
			contentType: false,
			cache: false,
			data: data2,
			success: function(response) {
				// Xóa thành công
				// Chuyển hướng hoặc làm bất kỳ điều gì bạn muốn
				if (response == 'success') {
					Swal.fire({
						icon: 'success',
						title: 'Đăng ký thành công',
						text: "Bạn sẽ được chuyển sang trang đăng nhập!",
						showConfirmButton: false,
						allowOutsideClick: false,
						allowEscapeKey: false,
						timer: 1500,
						timerProgressBar: true,
						didClose: () => {
							window.location.href = "/account/login"; // Tải lại trang	
						}
					});

				} else if (response == 'fail') {
					Swal.fire({
						icon: 'error',
						title: 'Xóa thất bại',
						text: "Có lỗi xảy ra!",
						showConfirmButton: true,
						timer: 1500
					});
				} else {
					console.log(response)

					$('#fullnameError').html('');
					$('#emailError').html('');
					$('#passwordError').html('');
					$('#confirmPasswordError').html('');

					$('#fullnameError').html(response.fullname);
					$('#emailError').html(response.email);
					$('#passwordError').html(response.password);
					console.log(response.password === undefined)
					if (response.password === undefined) {
						$('#confirmPasswordError').html(response.confirmPassword);
						console.log(999)
					} else {
						$('#confirmPasswordError').html('');
						console.log(123)
					}
				}
			},
			error: function(xhr, status, error) {
				// Xóa thất bại
				alert("Lỗi: " + error);
			}
		});
	});
});
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