package com.roa.chat.service;

import java.util.List;

import com.roa.chat.dto.UserDTO;

public interface UserService {

	String getUserOTP();

	UserDTO loginCheck(UserDTO user);

	boolean isUseUserID(String user_id);

	int addUser(UserDTO user);

	List<UserDTO> getUserList();
}
