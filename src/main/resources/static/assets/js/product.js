
let counter = 1;

function themMoTa() {
	counter++;

	const newRow = document.createElement("div");
	newRow.className = "col-xs-12 col-md-6 mb-3 description-container";
	newRow.innerHTML = `
        <div class=" border border-1 p-3 position-relative description-product">
            <span class="position-absolute z-3 bg-white" style="top: -13px">Mô tả ${counter}:</span>
            <div class="mb-3">
                <div class="form-floating">
                    <input type="text" class="form-control" id="tieude${counter}" placeholder="">
                    <label for="tieude${counter}">Tiêu đề:</label>
                </div>
            </div>
            <div class="form-floating">
                <textarea class="form-control" placeholder="Leave a comment here" id="noidung${counter}" style="height: 100px;"></textarea>
                <label for="noidung${counter}">Nội dung:</label>
            </div>
            <button class="btn btn-danger" onclick="xoaMoTa(this)" style="
				    position: absolute;
				    top: -13px;
				    right: -12px;
				    padding: 2px 6px;
				    border-radius: 50%;
				">X</button>
				        </div>`;

	const addButton = document.querySelector(".button");
	addButton.parentElement.insertBefore(newRow, addButton);
}

function layDuLieuMoTa() {
	const moTaContainers = document.querySelectorAll(".description-container");
	const moTaObjects = [];

	moTaContainers.forEach((container, index) => {
		const tieuDe = container.querySelector(`#tieude${index + 1}`).value;
		const noiDung = container.querySelector(`#noidung${index + 1}`).value;

		const moTa = {
			tieuDe: tieuDe,
			description: noiDung
		};

		moTaObjects.push(moTa);
	});

	return moTaObjects;
}


function xoaMoTa(button) {
	button.parentElement.parentElement.remove();
}
$(document).ready(function() {
	const fileInput = $("#listImage");
	const previewImages = $("#listImg");

	fileInput.on("change", function() {
		// Xóa tất cả các thẻ con
		previewImages.empty();

		for (let i = 0; i < fileInput[0].files.length; i++) {
			const file = fileInput[0].files[i];
			const imageContainer = $("<div>").addClass("image-container").css({
				display: "inline-block",
				margin: "5px"
			});
			const image = $("<img>").css({
				maxWidth: "100px",
				maxHeight: "100px"
			}).attr("src", URL.createObjectURL(file));

			imageContainer.append(image);
			previewImages.append(imageContainer);
		}
		console.log(fileInput[0].files)
	});
});


$(document).ready(function() {
	$('#formProduct').submit(function(event) {
		event.preventDefault();
		// Lấy dữ liệu từ form
		var formData = new FormData(this);

		var descriptions = layDuLieuMoTa();
		formData.append("descriptions", JSON.stringify(descriptions));

		console.log(formData);
		for (var pair of formData.entries()) {
			console.log(pair[0] + ': ' + pair[1]);
		}
		$.ajax({
			type: 'POST',
			enctype: 'multipart/form-data',
			upload: true,
			url: '/admin/product',
			processData: false,
			contentType: false,
			cache: false,
			data: formData,
			success: function(data) {
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

					$("#productNameError").html('');
					$("#categoryProductError").html('');
					$("#manufacturerProductError").html('');
					$("#quantityInStockError").html('');
					$("#priceError").html('');
					$('#imageError').html('')
					$("#productNameError").html(data.productName);
					$("#categoryProductError").html(data.categoryProduct);
					$("#manufacturerProductError").html(data.manufacturerProduct);
					$("#quantityInStockError").html(data.quantityInStock);
					$("#priceError").html(data.price);
					$('#imageError').html(data.image)
					Swal.fire({
						icon: 'error',
						title: 'Thêm sản phẩm thất bại',
						text: "Vui lòng kiểm tra lại thông tin !",
						showConfirmButton: true,
						timer: 1500
					});
					console.log(data)
				}
			},
			error: function(xhr, status, error) {
				console
					.log('Ajax errors');
			}
		});
	});
});
