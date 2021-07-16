package com.gb.olook.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gb.olook.mapper.MypageMapper;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookUserDTO;

@Service
public class MypageServiceImpl implements MypageService{

	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	MypageMapper udao;
	
	@Override
	public OlookUserDTO getUser(String user_email) {
		return udao.getUser(user_email);
	}
	
	@Override
	public void updateUser(OlookUserDTO dto) {
		udao.updateUser(dto);
		return;
	}

	@Override
	public int getboardCnt() {
		return udao.getboardCnt();
	}

	@Override
	public List<LookboardDTO> list() {
		return udao.list();
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void deleteUser(OlookUserDTO dto) {
		udao.deleteUser(dto);
	}




}
