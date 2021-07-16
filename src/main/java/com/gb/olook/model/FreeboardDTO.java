package com.gb.olook.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeboardDTO {
	private String user_email;
	private int free_idx;
	private String free_title;
	private String free_content;
	private String htitle;	
	private int frview_cnt;
	private int free_cmt;
	private Date fre_date;
}
