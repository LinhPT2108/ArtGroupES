<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="site-category">
	<form:form cssClass="row g-3 needs-validation"
		action="/admin/category/create" modelAttribute="ct" method="POST">
		<div class="col-xs-12 col-md-7">
			<div class="row">

				<form:hidden path="categoryId" value="" />
				<div class="col-12 mb-3">
					<form:label path="categoryName" cssClass="form-label">Loại sản phẩm</form:label>
					<form:input type="text" cssClass="form-control" path="categoryName"
						autocomplete="none"></form:input>
				</div>

				<div class="col-md-6 mb-3">
					<form:label path="" class="form-label">Trạng Thái</form:label>
					<br>
					<form:radiobutton path="del" value="true" />
					Tồn tại
					<form:radiobutton path="del" value="false" />
					Không tồn tại
				</div>
			</div>
			<div class="col-12">
				<form:button class="btn btn-primary">${typeButton}</form:button>
					<form:button formmethod="post"
					formaction="/admin/category/${categoryId}" class="btn btn-warning">Cập nhật</form:button>
			</div>
		</div>
	</form:form>
	<hr>
	<table border="1" style="width: 50%">
		<tr>
			<th>ID</th>
			<th>Loại sản phẩm</th>
			<th>Trạng thái</th>
			<th>Người tạo</th>
			<th></th>
		</tr>
		<c:forEach items="${cts}" var="category">
			<tr>
				<td>${category.categoryId}</td>
				<td>${category.categoryName}</td>
				<td>${category.del?'Tồn tại':'Không tồn tại'}</td>
				<td>${category.user.userId}</td>
				<td><a href="/admin/category/edit/${category.categoryId}">Edit</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
