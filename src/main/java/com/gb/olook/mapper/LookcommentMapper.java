package com.gb.olook.mapper;


import java.util.List;
import java.util.Map;


import com.gb.olook.model.FreeboardDTO;
import com.gb.olook.model.LookCommentDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.PageDTO;



public interface LookcommentMapper { 
	
	int getCmtCnt(); //전체 댓글 카운트
	
	List<LookCommentDTO> getCmtList(int idx); //전체 댓글가져오기
	
	int cmtinsert(LookCommentDTO dto); //insert
	
	int cmtdelete(int cmtidx); //delete
	
	int cmtupdate(LookCommentDTO dto); //update
	
	int boarddelete(int ref); //글삭제로인한 댓글삭제
	
}
