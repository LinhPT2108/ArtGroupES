$(document).ready(function() {
	console.log('this is cart js');
	$('.addToCart').click(function(e) {
		e.preventDefault();
		let productId = $(this).data('product-id');
		let isLoggedIn = $(this).data('user-id') !== '';
		let quantityInCart = $(".qty").val() == 'undefined' ? 1 : $(".qty").val();
		console.log(productId + ' - ' + quantityInCart)
		console.log(isLoggedIn)
		if (!isLoggedIn) {
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: 'Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng!',
				confirmButtonColor: '#dc3545',
				confirmButtonText: 'Đăng nhập'
			}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = '/account/sign-in';
				}
			});
		} else {
			$.ajax({
				type: 'POST',
				url: '/cart/add-to-cart',
				data: {
					productId: productId,
					quantityInCart: quantityInCart
				},
				success: function(response) {
					if (response == 'fail') {
						Swal.fire({
							icon: 'warning',
							title: 'Sản phẩm đã có trong giỏ hàng !',
							showConfirmButton: true
						});
					} else if (response == 'success') {
						Swal.fire({
							icon: 'success',
							title: 'Thêm vào giỏ hàng thành công !',
							showConfirmButton: false,
							timer: 1500
						});
						console.log(productId + ' - ' + quantityInCart)
						$('.nothing').remove();
						if ($('.bottomCart').find('.total').length > 0) {
							// Có ít nhất một phần tử con bên trong .bottomCart
						} else {
							// Không có phần tử con bên trong .bottomCart
							$('.cartBottom').append('<div class="bottomCart"><div class="total">' +
								'<span> Tổng tiền</span> <span class="total-amount"> <fmt: formatNumber' +
								'type="number" pattern="###,###,###"' +
								'value="${totalPriceInCart}" /> ₫' +
								'</span></div>' +
								'<a href="/checkout" class="btn animate">Thanh toán</a></div>')
						}


						updateCartInfo(productId, quantityInCart, response, false);
					} else {
						Swal.fire({
							icon: 'success',
							title: 'Thêm vào giỏ hàng thành công !',
							showConfirmButton: false,
							timer: 1500
						});
						updateCartInfo(productId, quantityInCart, response, true);
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
				}
			});

		}
	});




	function updateCartInfo(productId, quantityInCart, cartID, check) {
		console.log(productId + " - " + quantityInCart);
		$.ajax({
			type: "POST",
			url: "/cart/get-cart-info", // Đặt đường dẫn tới servlet để lấy thông tin giỏ hàng ở đây
			data: {
				product_id: productId,
			},
			success: function(response) {
				console.log(response)
				var json = JSON.parse(response);
				console.log(json);
				console.log(cartID)
				console.log($('#' + cartID + '').find('.qtyInStock'));
				var qtyInStockElement = $('#' + cartID).find('.qtyInStock');
				var currentQty = parseInt(qtyInStockElement.text());
				var newQty = currentQty + 1;
				qtyInStockElement.text(newQty);

				let cartId = json.cartId;
				let cartCount = json.cartCount;
				let productName = json.productName;
				let originalPrice = json.originalPrice;
				let discountedPrice = json.discountedPrice;
				let productId = json.productId;

				let image = json.image;
				let totalCart = json.totalPrice;
				let quantityInStock = json.quantityInStock;
				$('.total-count').html(cartCount);
				$('.total-amount').html(formatCurrency(totalCart));
				let quantity = 0;
				if (typeof quantityInCart === 'undefined') {
					quantity = 1;
				} else {
					quantity = quantityInCart;
				}
				if (!check) {
					// Tạo chuỗi HTML đại diện cho khối sản phẩm
					var productHtml = '<li><div class="mb-2 productInCart" id="' + cartId + '">';
					productHtml += '<a class="cart-img" href="/products/' + productId + '"><img src="images/products/' + image + '" alt="' + image + '"></a>';
					productHtml += '<h4><a href="#">' + productName + '</a></h4>';
					productHtml += '<p class="quantity">Số lượng: <span class="qtyInStock">' + quantity + '</span>';
					productHtml += '<span class="amount d-flex flex-column">';

					// Định dạng giá tiền
					if (originalPrice > discountedPrice) {
						productHtml += '<del><span class="text-muted text-decoration-line-through me-2">' + formatCurrency(originalPrice) + ' ₫</span></del>';
						productHtml += '<span class="fw-bold float-end text-danger">' + formatCurrency(discountedPrice) + ' ₫</span>';
					} else {
						productHtml += '<span class="fw-bold float-end text-danger">' + formatCurrency(originalPrice) + ' ₫</span>';
					}

					productHtml += '</span>';
					productHtml += '<button onclick="removeCartItem(' + cartId + ', this)" class="remove remove-product-cart" title="Xóa khỏi giỏ hàng"><i class="fa fa-remove"></i></button>';
					productHtml += '</p>';
					productHtml += '</div></li>';

					// Thêm chuỗi HTML vào danh sách sản phẩm trong giỏ hàng
					$('#listProductCart').append(productHtml);
					console.log(originalPrice + ' - ' + discountedPrice)

				}


			},
			error: function(error) {
				console.log("Đã xảy ra lỗi khi thêm vào giỏ hàng: " + error);
			}
		});
	}



});
function formatCurrency(number) {
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function removeCartItem(cartId, buttonElement) {
	console.log(cartId)
	let method = 'POST';

	$.ajax({
		url: 'cart/remove/' + cartId,
		type: method,
		success: function(response) {
			console.log(method)
			var jsonRemove = JSON.parse(response);
			console.log(jsonRemove)
			if (response == 'fail') {
				Swal.fire({
					icon: 'warning',
					title: 'Có lỗi xảy ra, vui lòng thử lại !',
					showConfirmButton: true
				});
			} else {
				let cartCount = jsonRemove.cartCount;
				let totalPrice = jsonRemove.totalPrice;
				console.log(totalPrice)
				$('.total-count').html(cartCount);
				$('.total-amount').html(formatCurrency(totalPrice));
				let cartItem = document.getElementById(jsonRemove.cartId).parentNode;
				cartItem.remove();
				if (cartCount == 0) {
					$('.bottomCart').remove();
					$('#listProductCart').append('<div' +
						' class="nothing d-flex flex-column align-items-center justify-content-center">' +
						'<i class="bi bi-cart-x display-1"></i> <span>Chưa' +
						'có sản phẩm</span>' +
						'</div>');
				}
				console.log('dek ok')
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
		}
	});
}