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
public class FreeCommentDTO {
	private int free_ref;
	private int free_cmtidx;
	private String free_content;
	private String free_name;
	private Date free_date;
}
