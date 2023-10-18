var listImages = [];

$(document).ready(function() {
	console.log('this is comment js');
	
	$('#btnCheck').click(function(){
		console.log(listImages)
	})
	
	$('.showComment').click(function() {
		$('#file').on("change", function() {

			console.log(123)
		});
		let productId = $(this).data('product-id');
		let invoiceDetailId = $(this).data('invoice-detail-id');
		$.ajax({
			type: 'post',
			url: '/comment/get-comment',
			data: {
				productId: productId,
				invoiceDetailId: invoiceDetailId
			},
			success: function(data) {
				console.log(data);
				$('#content').text(data.content);
				$('.dateComment').text(formatDateToDDMMYYYY(data.date));
				$('#date').val(data.date);
				// Cập nhật đánh giá sao
				if (data.star) {
					// Chọn input đánh giá sao dựa trên giá trị star
					$('input[name="rate"]').prop('checked', false);
					var statusTexts = ["Tệ", "Không hài lòng", "Bình thường", "Hài lòng", "Tuyệt vời"];
					$('input[name="rate"][value="' + data.star + '"]').prop('checked', true);
					console.log(statusTexts[data.star - 1])
					var statusText = statusTexts[data.star - 1];
					$('.status-ratting').text(statusText);
					$('#star').val(data.star);
				} else {
					// Nếu không có giá trị star, thì bỏ chọn tất cả các input
					$('input[name="rate"]').prop('checked', false);
					$('.status-ratting').text("");
				}

				$('#image').val(data.image);
				var imageArray = data.image.split(';');
				imageArray.forEach(function(item, index) {
					listImages.push(item);
				});

				var imageList = $("#imageList"); // Chọn phần tử danh sách hình ảnh
				if (imageArray.length > 0) {
					imageList.html('');
					var newInput = $('<li class="" style="list-style: none; max-width: 100px"><label' +
						' class="custum-file-upload" for="file">' +
						' <div class="icon2">' +
						' <i class="ti ti-image"></i>' +
						' </div> <input type="file" id="file" multiple' +
						' accept=".jpg, .jpeg, .png">' +
						' </label></li>');
					imageList.append(newInput);

					// Gắn sự kiện onchange vào input sau khi nó được thêm vào trang
					newInput.find("input").on("change", function() {
						choosePic();
					});

					// Sử dụng một biến để duyệt qua các phần tử mảng
					for (var i = 0; i < imageArray.length; i++) {
						(function(index) {
							// Tạo phần tử li chứa hình ảnh
							var listItem = $("<li>").css({ position: "relative", maxWidth: "100px" });
							// Tạo nút X để xóa hình ảnh
							var deleteButton = $("<button>")
								.addClass("ti ti-close delete-button")
								.on("click", function(e) {
									e.preventDefault();
									// Lấy tên hình ảnh cần xóa
									var removedImage = listImages[index];

									// Xóa hình ảnh khỏi mảng ban đầu
									listImages.splice(index, 1);

									// Xóa phần tử li chứa hình ảnh
									$(this).parent("li").remove();

									// Thực hiện các tác vụ khác sau khi xóa hình ảnh
									console.log("Xóa hình ảnh: " + removedImage);
									console.log(listImages)
								});

							// Tạo phần tử hình ảnh và thêm vào phần tử li
							var image = $("<img>").attr("src", "/images/comments/" + imageArray[index]);

							// Thêm nút X và hình ảnh vào phần tử li
							listItem.append(deleteButton, image);

							// Thêm phần tử li vào danh sách
							imageList.append(listItem);

						})(i);

					}



				}
			},
			error: function(xhr, status, error) {
				Swal.fire({
					icon: 'error',
					title: 'Thêm vào giỏ hàng thất bại',
					text: "Có lỗi xảy ra, vui lòng thử lại !",
					showConfirmButton: false,
					timer: 1500
				});
				console.log(error);
			}
		});
	});

	// Sự kiện khi một sao được chọn
	$('.rating input').change(function() {
		var selectedValue = $(this).val();
		var statusTexts = ["Tệ", "Không hài lòng", "Bình thường", "Hài lòng", "Tuyệt vời"];
		$('.status-ratting').text(statusTexts[selectedValue - 1]);
		$('#star').val(selectedValue);
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

function choosePic() {
	console.log(123)
	const fileInput = document.getElementById("file");
	const imageList = document.getElementById("imageList");
	const selectedImages = []; // Danh sách các tệp đã chọn

	const selectedFiles = fileInput.files;

	for (let i = 0; i < selectedFiles.length; i++) {
		const selectedFile = selectedFiles[i];

		// Kiểm tra xem tệp đã được chọn có tồn tại trong danh sách không
		if (selectedImages.some((img) => img.name === selectedFile.name)) {
			alert(`Hình ảnh "${selectedFile.name}" đã tồn tại.`);
			continue; // Bỏ qua tệp đã tồn tại
		}

		const objectURL = URL.createObjectURL(selectedFile);

		// Tạo phần tử li chứa hình ảnh
		const listItem = document.createElement("li");
		listItem.style.position = "relative";
		listItem.style.maxWidth = "100px";
		// Tạo nút X để xóa hình ảnh
		const deleteButton = document.createElement("button");
		deleteButton.classList.add("ti");
		deleteButton.classList.add("ti-close");
		deleteButton.classList.add("delete-button");
		deleteButton.addEventListener("click", function() {
			// Xóa hình ảnh và cập nhật danh sách
			listItem.remove();
			selectedImages.splice(selectedImages.indexOf(selectedFile), 1);
			console.log(selectedImages)
		});

		// Tạo phần tử hình ảnh và thêm vào danh sách
		const image = document.createElement("img");
		image.src = objectURL;

		// Thêm nút X vào phần tử li
		listItem.appendChild(deleteButton);
		listItem.appendChild(image);

		// Thêm phần tử li vào danh sách
		imageList.appendChild(listItem);

		// Thêm tệp đã chọn vào danh sách
		console.log(selectedFile.name)
		selectedImages.push(selectedFile);
		console.log(selectedImages)
		// Gộp mảng selectedImages vào listImages
	}
	//listImages = listImages.concat(selectedImages);
	console.log(listImages)
};

// Hàm định dạng ngày
function formatDateToDDMMYYYY(inputDate) {
	if (!(inputDate instanceof Date)) {
		inputDate = new Date(inputDate);
	}
	var day = inputDate.getDate();
	var month = inputDate.getMonth() + 1;
	var year = inputDate.getFullYear();
	day = day < 10 ? '0' + day : day;
	month = month < 10 ? '0' + month : month;
	var formattedDate = day + '-' + month + '-' + year;
	return formattedDate;
}

