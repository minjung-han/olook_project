package com.gb.olook.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gb.olook.mapper.OlookUserMapper;
import com.gb.olook.model.OlookUserDTO;

@Service
public class OlookUserServiceImpl implements OlookUserService{
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	OlookUserMapper userDao;

	@Override
	public OlookUserDTO idCheck(String email) {
		return userDao.idCheck(email);
	}

	@Override
	public OlookUserDTO nickNameCheck(String nickname) {
		return userDao.nickNameCheck(nickname);
	}

	@Override
	public int join(OlookUserDTO userDto, MultipartFile uploadFile) throws IOException {
		String pwd = userDto.getUser_password();
		String path = "C:\\image\\";
		if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName);   //확장자 구하기
            UUID uuid = UUID.randomUUID();   //UUID 구하기
            String fileName=uuid+"."+ext;
            userDto.setFilename(fileName);
            uploadFile.transferTo(new File(path + fileName));
        }
		String encodePwd = pwdEncoder.encode(pwd);
		userDto.setUser_password(encodePwd);
		return userDao.join(userDto);
	}

	@Override
	public OlookUserDTO login(Map<String, Object> map) {
		String user_email = (String) map.get("user_email");
		return userDao.getOneOlookUser(user_email);
	}

	@Override
	public OlookUserDTO findID(Map<String, Object> map) {
		return userDao.findID(map);
	}
	
	@Override
	public void changePwd(Map<String, Object> map) {
		String password = (String) map.get("user_password");
		String user_password = pwdEncoder.encode(password);
		map.put("user_password", user_password);
		userDao.changePwd(map);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
