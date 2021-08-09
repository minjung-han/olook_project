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
	int searchCount(Map<String,String> map);
	int searchCount(ModelMap map);
	List<LookboardDTO> searchList(PageDTO dto);
	LookboardDTO getBoardOne(int idx);
	int rcnt(int idx);//조회수 감소
	int cnt(int idx);
	int updateBoard(LookboardDTO dto);
	int deleteBoard(int idx);
	void deleteUser(OlookUserDTO dto);	//회원탈퇴
	void adminforcedEviction(OlookUserDTO dto);
	List<LookboardDTO> getPagelist(PageDTO pageDTO);
}
