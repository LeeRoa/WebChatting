const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const webOrigin = `https://192.168.0.44:8443`;

const webContextPath = webOrigin + pathname;

const sendBtn = $('#send-btn');
const exitBtn = $('#exit-btn');

let webSocket;
let user_id = $('#user_id').val();

sendBtn.attr("disabled", true);

connect();

function connect() {
    console.log('커넥션');
    webSocket = new WebSocket(`wss://192.168.0.44:8443/chat/chat_ws`);

    webSocket.onopen = onOpen;
    webSocket.onmessage = onMessage;
}

function onOpen() {
    webSocket.send(user_id + "님이 입장하셨습니다.");
}

sendBtn.click(function () {
    send();
});

$('#input-msg').on("propertychange change keyup paste input", function() {
    if (!$.trim($('#input-msg').val()) == "") {
        sendBtn.attr("disabled", false);
    } else {
        sendBtn.attr("disabled", true);
    }
});

$('#chat-input').click(function() {
    $('#input-msg').focus();
});

function send() {
    let msg = $('#input-msg').val();

    if (!$.trim($('#input-msg').val()) == "") {
        webSocket.send(user_id + ":" + msg);
        $('#input-msg').val("");
    }
}

function onMessage(e) {
    var data = e.data;
    var chatarea = $('#chatarea');
    chatarea.html(chatarea.html() + "<br/>" + data);
}

function disConnect() {
    webSocket.send(user_id + "님이 퇴장하셨습니다.");
    webSocket.close();
}

exitBtn.click(function () {
    disConnect();
    location.replace(webContextPath + 'index.jsp');
});

$('#input-msg').keypress(function press(e) {
    if(e.keyCode && e.keyCode == 13){
        send();
    }
});