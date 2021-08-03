package com.gb.olook.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;

import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookUserDTO;
import com.gb.olook.model.PageDTO;

public interface MypageMapper {
	OlookUserDTO getUser(String user_email);
	
	void updateUser(OlookUserDTO dto);	//자기소개 수정
	
	int getboardCnt();	//내가 쓴 글 갯수

	List<LookboardDTO> getMyBoardList(String user_email);	//내가 쓴 글 리스트

	void logout(HttpSession session); //로그아웃
	
	void deleteUser(OlookUserDTO dto);	//회원탈퇴

	int searchCount(ModelMap modelMap);
	
	List<LookboardDTO> searchList(PageDTO dto);
	
	void updateProfile(OlookUserDTO dto);
	
}
