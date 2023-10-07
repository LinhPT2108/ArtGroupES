<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Error Page</title>
<!-- Favicon -->
<link rel="icon" type="image/png" href="images/favicon.png">
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">

<!-- StyleSheet -->

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="../../css/reset.css">
<link rel="stylesheet" href="../../style.css">
<link rel="stylesheet" href="../../css/responsive.css">
<style type="text/css">
body {
	background-color: #2F3242;
}

svg {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -250px;
	margin-left: -400px;
}

.message-box {
	height: 200px;
	width: 380px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -100px;
	margin-left: 50px;
	color: #FFF;
	font-family: Roboto;
	font-weight: 300;
}

.message-box h1 {
	font-size: 60px;
	line-height: 46px;
	margin-bottom: 40px;
}

#Polygon-1, #Polygon-2, #Polygon-3, #Polygon-4, #Polygon-4, #Polygon-5 {
	animation: float 1s infinite ease-in-out alternate;
}

#Polygon-2 {
	animation-delay: .2s;
}

#Polygon-3 {
	animation-delay: .4s;
}

#Polygon-4 {
	animation-delay: .6s;
}

#Polygon-5 {
	animation-delay: .8s;
}

@
keyframes float { 100% {
	transform: translateY(20px);
}

}
@media ( max-width : 450px) {
	svg {
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -250px;
		margin-left: -190px;
	}
	.message-box {
		top: 50%;
		left: 50%;
		margin-top: -100px;
		margin-left: -190px;
		text-align: center;
	}
}
</style>
</head>
<body>

	<svg width="380px" height="500px" viewBox="0 0 837 1045" version="1.1"
		xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
    <g id="Page-1" stroke="none" stroke-width="1" fill="none"
			fill-rule="evenodd" sketch:type="MSPage">
        <path
			d="M353,9 L626.664028,170 L626.664028,487 L353,642 L79.3359724,487 L79.3359724,170 L353,9 Z"
			id="Polygon-1" stroke="#007FB2" stroke-width="6"
			sketch:type="MSShapeGroup"></path>
        <path
			d="M78.5,529 L147,569.186414 L147,648.311216 L78.5,687 L10,648.311216 L10,569.186414 L78.5,529 Z"
			id="Polygon-2" stroke="#EF4A5B" stroke-width="6"
			sketch:type="MSShapeGroup"></path>
        <path
			d="M773,186 L827,217.538705 L827,279.636651 L773,310 L719,279.636651 L719,217.538705 L773,186 Z"
			id="Polygon-3" stroke="#795D9C" stroke-width="6"
			sketch:type="MSShapeGroup"></path>
        <path
			d="M639,529 L773,607.846761 L773,763.091627 L639,839 L505,763.091627 L505,607.846761 L639,529 Z"
			id="Polygon-4" stroke="#F2773F" stroke-width="6"
			sketch:type="MSShapeGroup"></path>
        <path
			d="M281,801 L383,861.025276 L383,979.21169 L281,1037 L179,979.21169 L179,861.025276 L281,801 Z"
			id="Polygon-5" stroke="#36B455" stroke-width="6"
			sketch:type="MSShapeGroup"></path>
    </g>
</svg>
	<div class="message-box">
		<c:choose>
			<c:when test="${error=='404' }">
				<h1>${error }</h1>
				<p>Page not found</p>
			</c:when>
			<c:otherwise>
				<h1>${error }</h1>
				<p>Something went Wrong !</p>
			</c:otherwise>
		</c:choose>

		<div class="buttons-con">
			<div class="action-link-wrap">
				<a onclick="history.back(-1)"
					class="link-button link-back-button btn" href="#">Go Back</a> <a
					href="/" class="link-button btn">Go to Home Page</a>
			</div>
		</div>
	</div>
</body>
</html>
