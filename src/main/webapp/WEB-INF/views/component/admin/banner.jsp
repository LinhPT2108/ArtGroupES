<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<h1>BANNER</h1>


<form action="/admin/banner" method="post" enctype="multipart/form-data">
	<!-- add banner -->
	<div class="input-group mb-3">
		<span class="input-group-text">Add Banner</span> <input type="file"
			name="banner" class="form-control"
			aria-label="Amount (to the nearest dollar)">

		<button type="submit" class="btn btn-primary">Save</button>
	</div>
</form>
 

<div class="table-responsive">
	<table id="statisticalTable" class="table table-hover" style="vertical-align: middle !important;">
		<thead>
			<tr>
				<th>Id</th>
				<th>Ảnh banner</th>
				<th>Thao tác</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${banners}">
				<tr>
					<td>${item.id}</td>
					<td><img alt="" src="../../images/banner/${item.bannerName}"
						height="100" width="200"></td>
			<td><a href="/admin/banner/delete/${item.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</div>

<!-- End -->





