package com.gb.olook.mapper;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.gb.olook.model.OlookUserDTO;

public interface OlookUserMapper {
	OlookUserDTO idCheck(String email);
	OlookUserDTO nickNameCheck(String nickname);
	int join(OlookUserDTO userDto);
	OlookUserDTO getOneOlookUser(String user_email);
	OlookUserDTO findID(Map<String, Object> map);
	void changePwd(Map<String, Object> map);
	void logout(HttpSession session);
	
}
