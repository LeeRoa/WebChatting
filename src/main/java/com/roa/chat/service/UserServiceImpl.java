package com.roa.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.roa.chat.common.SHA256Util;
import com.roa.chat.dao.UserDAO;
import com.roa.chat.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO userDAO;
	
	@Override
	public String getUserOTP() {
		
		String otp = "";
		
		return otp;
	}
	
	@Override
	public UserDTO loginCheck(UserDTO user) {
		
		if (userDAO.getUser(user.getUser_id()) != null) {
			
			UserDTO exist_user = userDAO.getUser(user.getUser_id());
			
			if (exist_user.getUser_pw().equals(user.getUser_pw())) {
				return exist_user;
			}
		}
		
		return null;
	}

	@Override
	public boolean isUseUserID(String user_id) {
		
		if (userDAO.getUser(user_id) != null) {
			return true;
		}
		
		return false;
	}

	@Override
	public int addUser(UserDTO user) {
		
		String salt = SHA256Util.generateSalt();
		
		String user_pw = SHA256Util.getEncrypt(user.getUser_pw(), salt);
		
		user.setUser_pw(user_pw);
		
		return userDAO.addUser(user);
	}

	@Override
	public List<UserDTO> getUserList() {
		return userDAO.getUserList();
	}
}
