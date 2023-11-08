package com.roa.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

import com.roa.chat.dto.UserDTO;

@Controller
@ServerEndpoint(value= "/chat_ws")
public class WebSocketChatController {

	private static final List<UserDTO> sessionList = new ArrayList<UserDTO>();
	
	public WebSocketChatController() {
		System.out.println("웹소켓(서버) 객체 생성");
	}

	@OnOpen
	public void onOpen(Session session) {
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("채팅방에 연결 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}

//		sessionList.add(session);
	}

	void sendAllSessionToMessage(Session self, String message) {

//		try {
//			for (Session session : sessionList) {
//				if (!self.getId().equals(session.getId())) {
//					session.getBasicRemote().sendText(message);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("정보: " + message);
		
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		sendAllSessionToMessage(session, message);
	}

	@OnClose
	public void onClose(Session session) {
		sessionList.remove(session);
	}
}
