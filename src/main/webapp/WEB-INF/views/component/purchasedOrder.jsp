<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-profile">
	<div
		class="title  border border-right-0 border-top-0 border-left-0 py-2 d-flex justify-content-between">
		<span class="display-6">Đơn hàng đã hoàn thành</span> <span
			class="display-7 font-weight-bold">Số lượng: ${sizeInvoice }</span>
	</div>
	<div class="main-content p-3">
		<c:forEach items="${listInvoice.content }" var="iv" varStatus="i">
			<c:if test="${iv.status==typeInvoice }">
				<div class="invoice-item mb-3 p-3 bg-white border">
					<div class="site-inf d-flex">
						<div class="start mr-auto">
							<i class="bi bi-calendar2-check"></i> <span
								class="font-weight-bold">Ngày đặt hàng: <fmt:formatDate
									value="${iv.invoiceDate}" pattern="dd-MM-yyyy" />
							</span>

						</div>
						<div class="delivery ml-auto">
							<c:choose>
								<c:when test="${typeInvoice==1 }">
									<span class="text-danger mr-3"><i class="ti ti-package"></i>
										Đơn hàng đang được xử lí</span>
								</c:when>
								<c:when test="${typeInvoice==2 }">
									<span class="text-warning mr-3"><i class="ti ti-truck"></i>
										Đang giao hàng</span>
								</c:when>
								<c:otherwise>
									<span class="text-success mr-3"><i class="ti ti-check"></i>
										Giao hàng thành công</span>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
					<hr>

					<c:set var="totalPrice" scope="page" value="0"></c:set>
					<c:forEach var="p" items="${iv.invoiceDetails}">
						<div class="list-product-invoice">
							<div class="row mb-3">
								<div
									class="col-12 col-md-2 me-0 d-flex align-items-center justify-content-center">
									<div class="img-product d-inline position-relative">
										<img alt="Hình ảnh sản phẩm"
											src="../../images/products/${p.product.productImage[0].image}"
											width="150px" height="100%"
											class="img-thumbnail mx-auto align-middle">
									</div>
								</div>
								<div class="title-product col-12  col-md-7 ps-0 ms-0">
									<div class="d-flex flex-column mb-3">
										<span
											class="product-description-name display-6 font-weight-bold">${p.product.productName}</span>
										<span class="text-muted fs-6">Loại hàng:
											${p.product.categoryProduct.categoryName}</span> <span
											class="text-muted ">Hãng:
											${p.product.manufacturerProduct.manufacturerName}</span> <span>x3</span>
									</div>

								</div>
								<div class="price-product col-12 col-md-3 d-flex flex-column">
									<c:if test="${typeInvoice==3 }">
										<c:choose>
											<c:when test="${p.comment==null }">
												<a type="button"
													class="btn-warning p-2  text-white align-self-end mb-3 showComment"
													href="" data-toggle="modal" data-target="#modalReviews">Chưa
													đánh giá</a>
											</c:when>
											<c:otherwise>
												<a type="button"
													class="btn-success p-2 align-self-end mb-3 showComment rounded text-white"
													href="" data-toggle="modal" data-target="#modalReviews"
													data-invoice-detail-id="${p.id}"
													data-product-id="${p.product.productId}">Đã đánh giá</a>
											</c:otherwise>
										</c:choose>
									</c:if>
									<span
										class="font-weight-bold float-right text-danger align-self-end mt-3"><fmt:formatNumber
											type="number" pattern="###,###,###" value="${p.price}" /> ₫</span>
									<c:set var="totalPrice" value="${totalPrice + p.price}"
										scope="page"></c:set>
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>
					<div
						class="site-button d-flex justify-content-beetween align-items-center">
						<div class="col-4">
							<a class="btn-success p-2 rounded text-white" href="#"
								role="button">Mua lại</a>
						</div>
						<div class="price col-8">
							<div class="float-end">
								<span class="float-right">Tổng tiền: <span
									class="text-danger font-weight-bold display-6 "><fmt:formatNumber
											type="number" pattern="###,###,###" value="${totalPrice}" />
										₫</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<c:if test="${listInvoice.totalPages>1 }">
			<div class="paganation-site">
				<nav aria-label="..." class="">
					<ul
						class="pagination d-flex justify-content-center align-items-center">
						<li class="page-item ${listInvoice.number==0?'disabled':'' }"><a
							class="page-link" href="?p=${listInvoice.number-1}" tabindex="-1"><i
								class="ti ti-arrow-left"></i></a></li>
						<li class="page-item active"><a class="page-link"
							href="?p=${listInvoice.number }">${listInvoice.number+1}</a></li>

						<li
							class="page-item ${listInvoice.number+1==listInvoice.totalPages?'disabled':'' }"><a
							class="page-link " href="?p=${listInvoice.number+1 }"><i
								class="ti ti-arrow-right"></i></a></li>
						<li class="ml-3 choose-page"><select name="selectedPage mb-0"
							id="selectedPage">
								<option value="">--Chọn trang--</option>
								<c:forEach begin="1" end="${listInvoice.totalPages }"
									varStatus="i" var="page">
									<option value="${i.index}" class="option-page">${i.index}</option>
								</c:forEach>
						</select></li>
					</ul>
				</nav>
			</div>
		</c:if>
	</div>
</div>
<div class="modal fade bd-example-modal-sm" id="modalReviews"
	tabindex="-1" role="dialog" aria-labelledby="modalReviewsTitle"
	aria-hidden="true" style="max-width: 600px; margin: auto;">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content" style="max-width: 600px; height: 508px">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Đánh giá sản
					phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form action="" class="form-reviews" method="post"
					modelAttribute="cmt">
					<div class="form-group row  justify-content-start">
						<label for="" class="col-12 col-sm-4 col-form-label">Chất
							lượng sản phẩm:</label>
						<form:input path="star" type="hidden" />
						<div class="col-12 col-sm-8 d-flex align-items-center">
							<div class="rating float-left">
								<!-- Tuyệt vời, Hài lòng, Bình thường, Không hài lòng, tệ -->
								<input value="5" name="rate" id="star5" type="radio"
									checked="checked"> <label title="text" for="star5"></label>

								<input value="4" name="rate" id="star4" type="radio"> <label
									title="text" for="star4"></label> <input value="3" name="rate"
									id="star3" type="radio"> <label title="text"
									for="star3"></label> <input value="2" name="rate" id="star2"
									type="radio"> <label title="text" for="star2"></label>

								<input value="1" name="rate" id="star1" type="radio"> <label
									title="text" for="star1"></label>
							</div>
							<span class="ml-2 status-ratting" style="color: #ffa723">Tuyệt
								vời</span>
						</div>
					</div>
					<div class="form-group text-muted">
						<form:input path="date" type="hidden" />
						<span>Ngày đánh giá: </span><span class="dateComment"></span>
					</div>
					<div class="form-group">
						<label class="form-label" for="">Hình ảnh</label>
						<form:input type="hidden" path="image"></form:input>
						<ul id="imageList">
							<li class="" style="list-style: none; max-width: 100px"><label
								class="custum-file-upload" for="file">
									<div class="icon2">
										<i class="ti ti-image"></i>
									</div> <input type="file" id="file" multiple
									accept=".jpg, .jpeg, .png" onchange="choosePic()">

							</label></li>
						</ul>
					</div>
					<div class="form-group">
						<form:label path="content">Chi tiết đánh
							giá:</form:label>
						<form:textarea cssClass="form-control" path="content" rows="5"
							placeholder=""></form:textarea>
						<small class="contentError"></small>
					</div>
				</form:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Trở
					lại</button>
				<button type="button" class="btn btn-primary" id="btnCheck">Hoàn
					thành</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* //Lấy tất cả các input radio trong .rating
	var ratingInputs = document.querySelectorAll(".rating input");

	// Lấy thẻ <span> có class "status-ratting"
	var statusSpan = document.querySelector(".status-ratting");
	// Sự kiện khi một sao được chọn
	ratingInputs.forEach(function(input) {
		input.addEventListener("change", function() {
			// Lấy giá trị của input radio đã chọn
			var selectedValue = this.value;

			// Mảng văn bản tương ứng với từng giá trị
			var statusTexts = [ "Tệ", "Không hài lòng", "Bình thường",
					"Hài lòng", "Tuyệt vời" ];

			// Hiển thị văn bản tương ứng trong thẻ <span>
			statusSpan.textContent = statusTexts[selectedValue - 1];
			$('#star').val(selectedValue);
		});
	}); */

	// Lấy phần tử input và ul (danh sách hình ảnh)
	/* const fileInput = document.getElementById("file");
	const imageList = document.getElementById("imageList");
	const selectedImages = []; // Danh sách các tệp đã chọn

	// Thêm sự kiện khi người dùng chọn tệp hình ảnh
	fileInput.addEventListener("change", function () {
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
		listItem.style.maxWidth  = "100px"; 
	    // Tạo nút X để xóa hình ảnh
	    const deleteButton = document.createElement("button");
	    deleteButton.classList.add("ti");
	    deleteButton.classList.add("ti-close");
	    deleteButton.classList.add("delete-button");
	    deleteButton.addEventListener("click", function () {
	      // Xóa hình ảnh và cập nhật danh sách
	      listItem.remove();
	      selectedImages.splice(selectedImages.indexOf(selectedFile), 1);
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
	    selectedImages.push(selectedFile);
	  }
	}); */
</script>

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