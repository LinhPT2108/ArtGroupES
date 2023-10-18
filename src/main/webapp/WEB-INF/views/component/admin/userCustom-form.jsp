<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="site-product">
	<form:form cssClass="row g-3 needs-validation"
		action="/admin/userCustom" modelAttribute="userCustom" method="POST"
		id="formUserCustom" enctype="multipart/form-data">
		<div class="row">
			<div class="col-xs-12 col-md-7">
				<div class="row">
					<div class="col-12 mb-3">
						<%--  <form:label path="userId" cssClass="form-label">UserId:</form:label>  --%>
						<form:input type="hidden" cssClass="form-control" path="userId" 
							readonly="true"></form:input>
						<form:errors path="userId" cssClass="text-danger"></form:errors>
					</div>
					<div class="col-12 mb-3">
						<form:label path="email" cssClass="form-label">Email</form:label>
						<form:input type="email" cssClass="form-control" path="email" ></form:input>
						<form:errors path="email" cssClass="text-danger"></form:errors>
					</div>
					<div class="col-12 mb-3">
						<form:label path="roleName" class="form-label">Chức vụ</form:label>
						<form:select path="roleName" class="form-select" >
							<form:option value="" label="Chọn..." />
							<form:options items="${roles}" />
						</form:select>
							
					</div>
					<div class="col-12 mb-3">
						<form:label path="fullname" cssClass="form-label">Họ và tên</form:label>
						<form:input type="text" cssClass="form-control" path="fullname" ></form:input>
						<form:errors path="fullname" cssClass="text-danger"></form:errors>
					</div>
					<div class="col-12 mb-3">
						<form:label path="password" cssClass="form-label">Mật khẩu</form:label>
						<form:input type="password" cssClass="form-control"
							path="password"></form:input>
						<form:errors path="password" cssClass="text-danger"></form:errors>
					</div>
				</div>
				<div class="col-12">
					<button class="btn btn-success"
						formaction="/admin/userCustom/create">${typeButton}</button>
					<button formaction="/admin/userCustom/update"
						class="btn btn-warning">${updateButton}</button>
					<button formaction="/admin/userCustom/delete/${userCustom.userId}"
						class="btn btn-danger">${deleteButton}</button>
					<a href="/admin/userCustom"
						class="btn btn-primary">Reset</a>
				</div>
			</div>
			<div class="col-xs-12 col-md-5">
				<div class="mb-3">
					<form:label path="image" cssClass="form-label">Hình ảnh</form:label> <br>
					<img alt="" src="../../../images/avatar/${userCustom.image }" id="image" width="300" height="300" style="margin: 10px">
						
						<input name="avatar" type="file" id="imageFile" 
						accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)"/>
				</div>
			</div>
		</div>
	</form:form>
	<hr>
	<br>
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="row">
				<table border="1" style="width: 100%">
					<tr>
						<th>Email</th>
						<th>Fullname</th>
						<th>Role</th>
						<th>Image</th>
						<th>Trạng thái</th>
						<th></th>
					</tr>
					<c:forEach var="userCustom" items="${userCustoms}">
						<tr>
							<td>${userCustom.email}</td>
							<td>${userCustom.fullname}</td>
							<td>${userCustom.roleName.roleName}</td>
							<td>${userCustom.image}</td>
							<td>${userCustom.del}</td>
							<td><a href="/admin/userCustom/edit/${userCustom.userId}">Edit</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript">

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
console.log(randomString);
$(document).ready(function(){
	console.log($('#userId').val()=='')
$('#userId').val()==''?$('#userId').val(randomString):'' ;	
})
</script>
