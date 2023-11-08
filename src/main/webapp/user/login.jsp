<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Security-Policy"
	content="upgrade-insecure-requests">
<jsp:include page="/include/assetsHead_inc.jsp" />

<title>회원 로그인</title>

</head>

<body class="login">
	<div class="outer">
		<div class="middle">
			<div class="inner">
				<div class="row">
					<!-- BEGIN LOGIN BOX -->
					<div class="col-lg-12">
						<h3 class="text-center login-title">로그인</h3>
						<div class="account-wall">
							<!-- BEGIN PROFILE IMAGE -->
							<img class="profile-img"
								src="${pageContext.request.contextPath}/assets/img/photo.png"
								alt="">
							<!-- END PROFILE IMAGE -->
							<!-- BEGIN LOGIN FORM -->
							<div class="form-login">
								<input id="input-user-id" type="text" name="user_id"
									class="form-control" placeholder="ID" autofocus> <input
									id="input-user-pw" type="password" name="user_pw"
									class="form-control" placeholder="Password">
								<button id="login-submit"
									class="btn btn-lg btn-primary btn-block" type="button">로그인
									하기</button>
								<a href="${pageContext.request.contextPath}/"
									class="pull-right need-help">Need help?</a><span
									class="clearfix"></span>
							</div>
							<!-- END LOGIN FORM -->
						</div>
						<a href="${pageContext.request.contextPath}/user/register.jsp"
							class="text-center new-account">회원가입 하기</a>
					</div>
					<!-- END LOGIN BOX -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/assetsBody_inc.jsp" />

	<script src="${pageContext.request.contextPath}/js/user/login.js"></script>
</body>
</html>