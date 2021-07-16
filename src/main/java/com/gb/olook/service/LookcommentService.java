package com.gb.olook.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.gb.olook.model.LookCommentDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.PageDTO;

public interface LookcommentService {
	
	int getCmtCnt(); //전체 댓글 카운트
	
	List<LookCommentDTO> getCmtList(int idx); //전체 댓글가져오기
	
	int cmtinsert(LookCommentDTO dto); //insert
	
	int cmtdelete(int cmtidx); //댓글 삭제
	
	int cmtupdate(LookCommentDTO dto);
	
	int boarddelete(int ref); //글삭제로인한 댓글삭제
}
