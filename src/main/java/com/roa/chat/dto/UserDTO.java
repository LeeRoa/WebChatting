package com.roa.chat.dto;

import javax.websocket.Session;

public class UserDTO {
	
	// DB
	public String user_id;
	public String nick_name;
	public String user_otp;
	public String user_pw;
	
	// Session
	public Session session;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getUser_otp() {
		return user_otp;
	}

	public void setUser_otp(String user_otp) {
		this.user_otp = user_otp;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
}
