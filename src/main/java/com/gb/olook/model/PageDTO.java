package com.gb.olook.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
public class PageDTO {
	//생성자로 전달받을값
	private int currentPage; 	//현재페이지
	private int pageSize;		//한 화면에 띄움 게시클 limit범위
	private int totalCount;		//전체 게시글
	
	//계산에 필요한 값
	private int startNo;		//limit 시작인덱스
	private int totalPage;		//전체 페이지 개수   처음<1 2 3>끝
	private int startPage;		//페이지 안에 띄울 게시글 시작 idx
	private int endPage;		//페이지 안에 띄울 게시글 끝 idx
	
	//검색에 필요한 값
	private String field;
	private String findText;
	
	//생성자
	public PageDTO(int currentPage, int pageSize, int totalCount, String field, String findText) {
		super();
	//	this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		totalPage = (totalCount-1)/pageSize +1; //ex) (81-1)/(10+1)=8 > �젙�닔/�젙�닔=�젙�닔
		
		//현재페이지가 계산한 로컬페이지보다 크거나 1보다 작으면 무조건 1이고 아니면 가져온 현재페이지로 진행
		//잘못 요청된 correntPage를 1~totalPage 범위값으로 설정해야 하므로 1로 초기화.
		this.currentPage = (currentPage>totalPage || currentPage < 1)? 1:currentPage; 
		startNo = (this.currentPage-1) * pageSize;
		
		//startPage, endPage 의 수식은 나중에 추가
		startPage = (this.currentPage - 1) / 10 * 10 +1;	
		endPage = startPage + pageSize - 1;
		endPage = endPage > totalPage ? totalPage : endPage; //마지막 페이지 목록에서 필요함
		
		this.field = field;
		this.findText = findText;
	}
	//===================================

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getFindText() {
		return findText;
	}

	public void setFindText(String findText) {
		this.findText = findText;
	}
	

	// ===========================================
	
}
