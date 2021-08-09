package com.gb.olook.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.gb.olook.mapper.MypageMapper;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookUserDTO;
import com.gb.olook.model.PageDTO;

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
	}

	@Override
	public int getboardCnt() {
		return udao.getboardCnt();
	}

	@Override
	public List<LookboardDTO> getMyBoardList(String user_email) {
		return udao.getMyBoardList(user_email);
	}

	@Override
	public void logout(HttpSession session) {
		udao.logout(session);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		return udao.searchCount(map);
	}

	@Override
	public int searchCount(ModelMap map) {
		return udao.searchCount(map);
	}

	@Override
	public List<LookboardDTO> searchList(PageDTO dto) {
		return udao.searchList(dto);
	}

	@Override
	public LookboardDTO getBoardOne(int idx) {
		return udao.getBoardOne(idx);
	}

	@Override
	public int rcnt(int idx) {
		return udao.rcnt(idx);
	}

	@Override
	public int cnt(int idx) {
		return udao.cnt(idx);
	}

	@Override
	public int updateBoard(LookboardDTO dto) {
		return udao.updateBoard(dto);
	}

	@Override
	public int deleteBoard(int idx) {
		return udao.deleteBoard(idx);
	}

	@Override
	public void deleteUser(OlookUserDTO dto) {
		udao.deleteUser(dto);
	}

	@Override
	public void adminforcedEviction(OlookUserDTO dto) {
		udao.adminforcedEviction(dto);
	}

	@Override
	public List<LookboardDTO> getPagelist(PageDTO pageDTO) {
		return udao.getPagelist(pageDTO);
	}

}
