package com.gb.olook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.gb.olook.mapper.LookboardMapper;
import com.gb.olook.mapper.LookcommentMapper;
import com.gb.olook.model.FreeboardDTO;
import com.gb.olook.model.LookCommentDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.PageDTO;





@Service
public class LookCommentServiceImpl implements LookcommentService{
	
	@Autowired
	LookcommentMapper dao;

	@Override
	public int getCmtCnt() {
		return dao.getCmtCnt();
	}

	@Override
	public List<LookCommentDTO> getCmtList(int idx) {
		return dao.getCmtList(idx);
	}

	@Override
	public int cmtinsert(LookCommentDTO dto) {
		return dao.cmtinsert(dto);
	}

	@Override
	public int cmtdelete(int cmtidx) {
		return dao.cmtdelete(cmtidx);
	}

	@Override
	public int cmtupdate(LookCommentDTO dto) {
		return dao.cmtupdate(dto);
	}

	@Override
	public int boarddelete(int ref) {
		return dao.boarddelete(ref);
	}


	
	

}
