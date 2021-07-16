package com.gb.olook.service;

import java.util.List;

import javax.servlet.http.HttpSession;


import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookUserDTO;

public interface MypageService {
	OlookUserDTO getUser(String user_email);
	
	void updateUser(OlookUserDTO dto);	//자기소개 수정
	
	int getboardCnt();	//내가 쓴 글 갯수

	List<LookboardDTO> list();	//내가 쓴 글 리스트
	
	void logout(HttpSession session); //로그아웃
	
	void deleteUser(OlookUserDTO dto);	//회원탈퇴
}
