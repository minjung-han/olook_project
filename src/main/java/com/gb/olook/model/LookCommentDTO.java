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
public class LookCommentDTO {
	private int look_ref;
	private int look_cmtidx;
	private String look_content;
	private String look_name;
	private Date look_date;
	private String user_nickname;
}
