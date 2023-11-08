package com.roa.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.roa.chat.dto.UserDTO;

public interface UserDAO {
	UserDTO getUser(@Param("user_id") String user_id);

	int addUser(@Param("user") UserDTO user);
	
	List<UserDTO> getUserList();
}
