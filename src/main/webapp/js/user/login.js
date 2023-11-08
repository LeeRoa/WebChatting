const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const apiOrigin = 'https://192.168.0.131:28445';
const webOrigin = 'https://192.168.0.131:8445';

const webContextPath = webOrigin + pathname;
const apiContextPath = apiOrigin + pathname;

$('#login-submit').click(function () {
    var user = {
        user_id : $.trim($('#input-user-id').val()),
        user_pw : $.trim($('#input-user-pw').val())
    }

    if (user.user_id == "" || user.user_pw == "") {
        alert('아이디와 비밀번호를 입력하세요.');
        return;
    }

    $.ajax({
        url: apiContextPath + "user/loginCheck.do",
        type: "POST",
        contentType: "application/json",
        data:JSON.stringify(user),
        success: (login_result) => {
            if (login_result != "") {
                alert('로그인에 성공했습니다.');
                location.replace(webContextPath + "home.jsp?page=1&num=" + login_result.user_num + "&nick=" + login_result.nick_name);
            } else {
                alert('로그인에 실패하였습니다.')       
            }
        }
    });
});