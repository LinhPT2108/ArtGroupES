<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="site-manufacturer">
	<form:form cssClass="row g-3 needs-validation"
		action="/admin/manufacturer" modelAttribute="mn" method="POST">
		<div class="col-xs-12 col-md-7">
			<div class="row">

				<form:hidden path="id" value="" />
				<div class="col-12 mb-3">
					<form:label path="manufacturerName" cssClass="form-label">Tên Thương Hiệu</form:label>
					<form:input type="text" cssClass="form-control"
						path="manufacturerName" autocomplete="none"
						placeholder="Vui lòng nhập tên thương hiệu"></form:input>
				</div>
			</div>
			<div class="col-12">
				<button formaction="/admin/manufacturer/create"
					class="btn btn-primary">Create</button>
				<button formaction="/admin/manufacturer/update"
					class="btn btn-warning">Update</button>
				<button formaction="/admin/manufacturer/delete/${id}"
					class="btn btn-danger">Delete</button>
				<a href="/admin/manufacturer" class="btn btn-info">Reset</a>
			</div>
		</div>
	</form:form>
	<hr>

	<div class="table-responsive">
		<table id="statisticalTableManu" class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên thương hiệu</th>
					<th>Trạng thái</th>
					<th>Người tạo</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mns}" var="manufacturer">
					<tr>
						<td>${manufacturer.id}</td>
						<td>${manufacturer.manufacturerName}</td>
						<td>${manufacturer.del?'Hoạt động':'Ngừng hợp tác'}</td>
						<td>${manufacturer.user.userId}</td>
						<td><a href="/admin/manufacturer/edit/${manufacturer.id}">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    var table = $('#statisticalTableManu').DataTable();

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
                <input type="radio" name="statusFilter" value="Ngừng hợp tác"> Ngừng hợp tác
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
