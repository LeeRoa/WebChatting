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
<title>[롸] 채팅방</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- BEGIN CSS FRAMEWORK -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
<!-- END CSS FRAMEWORK -->

<!-- BEGIN CSS TEMPLATE -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/skins.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat_room.css">
<!-- END CSS TEMPLATE -->
</head>
<body>
	<input type="hidden" id="user_id" value="${param.user_id}" />
	<h3 id="chatroom-title">채팅방에 오신걸 환영합니다! ${param.user_id}님</h3>
	<div id="chat-div">
		<button id="exit-btn" class="btn btn-primary" type="button">나가기</button>
		<div id="chatarea"></div>
		<div class="input-group" id="chat-input">
			<input id="input-msg" type="text" class="form-control" autofocus="autofocus" placeholder="내용 입력.."> <span
				class="input-group-btn">
				<button id="send-btn" class="btn btn-primary" type="button">전송</button>
			</span>
		</div>
	</div>


	<!-- BEGIN JS FRAMEWORK -->
	<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/chat_room.js"></script>
	<!-- END JS FRAMEWORK -->
	
</body>
</html>