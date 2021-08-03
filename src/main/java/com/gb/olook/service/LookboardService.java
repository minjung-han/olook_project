package com.gb.olook.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;


import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookLikeDTO;
import com.gb.olook.model.PageDTO;

public interface LookboardService {
	int insert(LookboardDTO dto);
	int getCount();
	List<LookboardDTO> getPagelist(PageDTO dto);
	int delete(int idx);
	LookboardDTO getBoardOne(int idx);
	int update(LookboardDTO dto);
	int searchCount(ModelMap map);
	List<LookboardDTO> getAll();
	int searchCount(Map<String,String> map);
	int cnt(int idx);
	int cmt(int idx);
	List<LookboardDTO> searchList(PageDTO dto);
	int likeupdate(int idx);
	int rcnt(int idx);//조회수 감소
	int look_likedelete(OlookLikeDTO dto);
	int look_likeinsert(OlookLikeDTO dto);
}
