package com.gb.olook.service;


import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.gb.olook.model.OlookUserDTO;

public interface OlookUserService {
	OlookUserDTO idCheck(String email);
	OlookUserDTO nickNameCheck(String nickname);
	int join(OlookUserDTO userDto, MultipartFile uploadFile) throws IOException;
	OlookUserDTO login(Map<String, Object> map);
	OlookUserDTO findID(Map<String, Object> map);
	void changePwd(Map<String, Object> map);
	void logout(HttpSession session);
}
