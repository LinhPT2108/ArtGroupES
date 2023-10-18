<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="site-category">
	<form:form cssClass="row g-3 needs-validation" action="/admin/category"
		modelAttribute="ct" method="POST">
		<div class="col-xs-12 col-md-7">
			<div class="row">

				<form:hidden path="categoryId" value="" />
				<div class="col-12 mb-3">
					<form:label path="categoryName" cssClass="form-label">Loại sản phẩm</form:label>
					<form:input type="text" cssClass="form-control" path="categoryName"
						autocomplete="none" placeholder="Vui lòng nhập loại sản phẩm"></form:input>
				</div>

			</div>
			<div class="col-12">

				<button formaction="/admin/category/create" class="btn btn-primary">Create</button>
				<button formaction="/admin/category/update" class="btn btn-warning">Update</button>
				<button formaction="/admin/category/delete/${categoryId}"
					class="btn btn-danger">Delete</button>
				<a href="/admin/category" class="btn btn-info">Reset</a>
			</div>
		</div>
	</form:form>
	<hr>
	<div class="table-responsive">
		<table id="statisticalTableCategory" class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Loại sản phẩm</th>
					<th>Trạng thái</th>
					<th>Người tạo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cts}" var="category">
					<tr>
						<td>${category.categoryId}</td>
						<td>${category.categoryName}</td>
						<td>${category.del?'Hoạt động':'Ngừng kinh doanh'}</td>
						<td>${category.user.userId}</td>
						<td><a href="/admin/category/edit/${category.categoryId}">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
    var table = $('#statisticalTableCategory').DataTable();

    // Tạo radio buttons
    var radioHtml = `
        <div class="mb-3">
            <label>
                <input type="radio" name="statusFilter" value="" checked> Tất cả
            </label>
            <label class="mx-2">
                <input type="radio" name="statusFilter" value="Hoạt động"> Hoạt động
            </label>
            <label>
                <input type="radio" name="statusFilter" value="Ngừng kinh doanh"> Ngừng kinh doanh
            </label>
        </div>
    `;
    
    // Thêm radio buttons vào phần tử có class "table-responsive"
    $('.table-responsive').prepend(radioHtml);
    
    // Xử lý sự kiện khi radio buttons được chọn
    $('input[name="statusFilter"]').on('change', function() {
        var selectedValue = $(this).val();
        
        // Lọc dữ liệu trong cột "Trạng thái" của DataTable
        table.column(2).search(selectedValue).draw();
    });
});
</script>