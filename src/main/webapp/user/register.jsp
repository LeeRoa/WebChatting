<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Security-Policy"
	content="upgrade-insecure-requests">
<jsp:include page="/include/assetsHead_inc.jsp" />

<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/register.css">
</head>

<body class="login">
	<div class="outer">
		<div class="middle">
			<div class="inner">
				<div class="row">
					<!-- BEGIN BOX REGISTER -->
					<div class="col-lg-12">
						<h3 class="text-center login-title">채팅방 회원가입</h3>
						<div class="account-wall">
							<!-- BEGIN REGISTER FORM -->
							<div class="form-login">
								<div id="user-id-form">
									<input type="text" id="input-user-id" class="form-control"
										placeholder="ID" autofocus value="${serverHost}">
									<button id="id-check-btn" class="btn btn-default btn-radius check-btn">중복확인</button>
								</div>
								<!-- <div id="user-id-form">
									<input type="text" id="input-user-email" class="form-control"
										placeholder="E-mail">
									<button id="email-check-btn" class="btn btn-default btn-radius check-btn">번호전송</button>
								</div>
								<div id="user-id-form">
									<input type="text" id="input-email-cert" class="form-control"
										placeholder="E-mail Cert">
									<button id="email-cert-btn" class="btn btn-default btn-radius check-btn">인증확인</button>
								</div> -->
								<input type="text" id="input-nick-name" class="form-control"
									placeholder="Nick name"> <input type="password"
									id="input-user-pw" class="form-control" placeholder="Password">
								<input type="password" id="input-re-pw" class="form-control"
									placeholder="Re-enter Password">
								<button id="reg-submit" class="btn btn-lg btn-primary btn-block"
									type="button">회원가입 하기</button>
								<label class="pull-left"></label> <a
									href="${pageContext.request.contextPath}/"
									class="pull-right need-help">Need help?</a><span
									class="clearfix"></span>
							</div>
							<!-- END REGISTER FORM -->
						</div>
						<a href="${pageContext.request.contextPath}/user/login.jsp"
							class="text-center new-account">이미 계정이 있으신가요?</a>
					</div>
					<!-- END BOX REGISTER -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/assetsBody_inc.jsp" />
	<script type="text/javascript">
	const pathname = `${pageContext.request.contextPath}/`;
	const origin = 'https://192.168.0.44:8443';

	const webContextPath = origin + pathname;
	const apiContextPath = origin + pathname;

	let isIdCheck = false;

	$('#input-user-id').change(function () {
	    isIdCheck = false;
	});

	$('#id-check-btn').click(function () {
	    var user_id = $.trim($('#input-user-id').val());

	    if (user_id == "") {
	        alert('아이디를 입력해주세요.');
	        return;
	    }

	    $.ajax({
	        url: apiContextPath + "user/idCheck.do?user_id=" + user_id,
	        type: "GET",
	        contentType: "application/json",
	        success: (check_result) => {
	            if (!check_result) {
	                alert('사용가능한 아이디입니다.');
	                isIdCheck = true;
	            } else {
	                alert('이미 사용중인 아이디입니다.')
	                isIdCheck = false;
	            }
	        }
	    });
	});

	$('#reg-submit').click(function () {
	    var user = {
	        user_id: $.trim($('#input-user-id').val()),
	        user_pw: $.trim($('#input-user-pw').val()),
	        nick_name: $.trim($('#input-nick-name').val()),
	        re_pw: $.trim($('#input-re-pw').val()),
	    }

	    if (!isIdCheck) {
	        alert('아이디 중복확인을 해주세요.');
	        return;
	    }

	    if (user.user_id == "" || user.user_pw == "" || user.nick_name == "" || user.re_pw == "") {
	        alert('입력되지 않은 정보가 있습니다.');

	        return;
	    }

	    if (user.user_pw != user.re_pw) {
	        alert('비밀번호가 일치하지 않습니다.');

	        return;
	    }

	    $.ajax({
	        url: apiContextPath + "user/addUser.do",
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(user),
	        success: (reg_result) => {
	            if (reg_result == 1) {
	                alert('회원가입이 완료되었습니다.');
	                location.replace(webContextPath);
	            }
	        }
	    });
	});
	</script>
</body>
</html>