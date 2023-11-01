const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const webOrigin = 'https://192.168.0.44:8443';

const webContextPath = webOrigin + pathname;

const submitBtn = $('#submit-btn');

submitBtn.click(function () {
    submit();
});

$('#user_id').keypress(function press(e) {
    if(e.keyCode && e.keyCode == 13){
        submit();
    }
});

function submit() {
    let inputUserID = $.trim($('#user_id').val());
    if (inputUserID == "") {
        alert('닉네임을 입력해주세요.');

        return;
    }

    location.replace(webContextPath + 'chat_room.jsp?user_id=' + inputUserID);
}