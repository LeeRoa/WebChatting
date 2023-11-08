const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const apiOrigin = 'https://192.168.0.131:28445';
const webOrigin = 'https://192.168.0.131:8445';

const webContextPath = webOrigin + pathname;
const apiContextPath = apiOrigin + pathname;

let isIdCheck = false;
let isEmailCheck = false;

$('#input-user-id').change(function () {
    isIdCheck = false;
});

$('#input-user-email').change(function () {
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
        user_email: $.trim($('#input-user-email').val())
    }

    if (!isIdCheck) {
        alert('아이디 중복확인을 해주세요.');
        return;
    }

    if (!isEmailCheck) {
        alert('이메일 인증을 완료해주세요.');
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

let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");

$('#email-check-btn').click(function() {
    var user_email = $.trim($('#input-user-email').val());
    
    if (user_email == "") {
        alert('이메일을 입력해주세요.');
        return;
    }

    if (!regex.test(user_email)) {
        alert('형식에 맞지 않습니다.');
        return;
    }

    $.ajax({
        url: apiContextPath + "user/emailCheck.do?user_email=" + user_email,
        type: "GET",
        contentType: "application/json",
        success: (reg_result) => {
            if (reg_result == 1) {
                alert('이메일 인증번호가 전송되었습니다.');
            }
        }
    });
});

$('#email-cert-btn').click(function() {

    $.ajax({
        url: apiContextPath + "user/emailCheck2.do?user_email=" + $.trim($('#input-user-email').val()),
        type: "GET",
        contentType: "application/json",
        dataType: "text",
        success: (cert) => {
            console.log(1111);
            console.log(cert);
            if (cert != "") {
                console.log('1');
                if (cert === $.trim($('#input-email-cert').val())) {
                    alert('인증이 완료되었습니다.');
                    isEmailCheck = true;
                } else {
                    alert('인증번호가 맞지 않습니다.');
                    isEmailCheck = false;
                }
            } else {
                alert('이메일을 다시 입력해주세요.');
                isEmailCheck = false;
            }
        }
    });
});