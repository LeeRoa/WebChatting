<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>[롸] 채팅방입니다.</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- BEGIN CSS FRAMEWORK -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
<!-- END CSS FRAMEWORK -->

<!-- BEGIN CSS TEMPLATE -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<!-- END CSS TEMPLATE -->
</head>
<body>
	<h1 id="index-title">채팅방에 오신걸 환영합니다!</h1>
	<div class="input-group" id="user-input-div">
		<input id="user_id" type="text" class="form-control" placeholder="원하시는 닉네임을 입력해주세요." autofocus="autofocus"> <span
			class="input-group-btn">
			<button id="submit-btn" class="btn btn-primary" type="button">입장하기</button>
		</span>
	</div>


	<!-- BEGIN JS FRAMEWORK -->
	<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<!-- END JS FRAMEWORK -->

</body>
</html>