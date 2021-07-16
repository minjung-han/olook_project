package com.gb.olook.mapper;


import java.util.List;
import java.util.Map;


import com.gb.olook.model.FreeboardDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.PageDTO;



public interface LookboardMapper { 
	//mapper로 dao 동작을 하도록 설정 -> spring mybatis 에서 구현체를 생성하여 bean 등록
	//sql 실행에 필요한 메소드 시그니쳐 정의
	int getCount();								//전체 게시글 카운트
	
	List<LookboardDTO> getAll();					//전체 게시글
	
	List<LookboardDTO> getPagelist(PageDTO dto);	//한페이지 게시글
	
	int insert(LookboardDTO dto);					//insert
	
	int delete(int idx);						//delete
	
	LookboardDTO getBoardOne(int idx);				//한개 검색
	
	int update(LookboardDTO dto);					//update
	
	int searchCount(Map<String,String> map);	//검색 카운트
	List<LookboardDTO> searchList(PageDTO dto);		//검색 게시글
	
	int cnt(int idx);//조회수

	int cmt(int idx);//댓글수
	
	int rcnt(int idx);//조회수 감소

	int likeupdate(int idx);

	
}
