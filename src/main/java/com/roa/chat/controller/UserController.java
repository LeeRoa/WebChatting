package com.roa.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.roa.chat.dto.UserDTO;
import com.roa.chat.service.UserService;

@RequestMapping(value="user/")
@RestController
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "idCheck.do", method = RequestMethod.GET, produces = "application/json")
	public boolean idCheck(String user_id) {
		return userService.isUseUserID(user_id);
	}
	
	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST, produces = "application/json")
	public UserDTO loginCheck(@RequestBody UserDTO user) {
		return userService.loginCheck(user);
	}
	
	/** 
	 * return 값
	 * 0 : 이미 사용중인 아이디
	 * 1 : 사용 가능 및 회원가입 완료
	 * */
	@RequestMapping(value = "addUser", method = RequestMethod.POST, produces = "application/json")
	public int addUser(@RequestBody UserDTO user) {
		return userService.addUser(user);
	}
}
