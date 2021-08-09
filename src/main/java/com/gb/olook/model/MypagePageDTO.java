package com.gb.olook.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MypagePageDTO {
	private int num;
	private int count;
	private int postNum = 10;
	private int pageNum;
	private int displayPost;
	private int pageNumCnt = 10;
	private int endPageNum;
	private int startPageNum;
	private String searchType;
	private String keyword;	
	private int prev;
	private int next;
	
	private void dataCalc() {
		
		// 마지막 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		// 시작 번호
		startPageNum = endPageNum - (pageNumCnt - 1);
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		displayPost = (num - 1) * postNum;
	}
	
public String getSearchTypeKeyword() {
		
		if(searchType.equals("") || keyword.equals("")) {
			return "";	
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;	
		}
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;		
	}
	
	public String getSearchType() {
		return searchType;
	}	
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;		
	}	
	
	public String getKeyword() {
		return keyword;
	}
	
}


