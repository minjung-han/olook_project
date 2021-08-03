package com.gb.olook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.gb.olook.mapper.LookboardMapper;
import com.gb.olook.model.FreeboardDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookLikeDTO;
import com.gb.olook.model.PageDTO;





@Service
public class LookBoardServiceImpl implements LookboardService{
	
	@Autowired
	LookboardMapper dao;
	
	

	
	@Override
	public List<LookboardDTO> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}
	
	@Override
	public int insert(LookboardDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int getCount() {
		return dao.getCount();
	}

	@Override
	public List<LookboardDTO> getPagelist(PageDTO dto) {
		return dao.getPagelist(dto);
	}

	@Override
	public int delete(int idx) {
		return dao.delete(idx);
	}

	@Override
	public LookboardDTO getBoardOne(int idx) {
		return dao.getBoardOne(idx);
	}

	@Override
	public int update(LookboardDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		return dao.searchCount(map);
	}
	
	@Override
	//public int searchCount(Map<String,String> map) {
	public int searchCount(ModelMap map) {
		//paging에 검색을 위한 필드의 검색어 속성 포함
		Map<String,String> daomap = new HashMap<String, String>();
		//ModelMap -> HashMap
		daomap.put("field", (String) map.get("field"));
		daomap.put("findText", (String) map.get("findText"));
		return dao.searchCount(daomap);
	}
	
	@Override
	public List<LookboardDTO> searchList(PageDTO dto) {
		return dao.searchList(dto);
	}

	@Override
	public int cnt(int idx) {
		return dao.cnt(idx);
	}

	@Override
	public int cmt(int idx) {
		return dao.cmt(idx);
	}

	@Override
	public int likeupdate(int idx) {
		return dao.likeupdate(idx);
	}

	@Override
	public int rcnt(int idx) {
		return dao.rcnt(idx);
	}

	@Override
	public int look_likedelete(OlookLikeDTO dto) {
		// TODO Auto-generated method stub
		return dao.look_likedelete(dto);
	}

	@Override
	public int look_likeinsert(OlookLikeDTO dto) {
		// TODO Auto-generated method stub
		return dao.look_likeinsert(dto);
	}

}
