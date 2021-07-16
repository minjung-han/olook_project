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
public class ProductCommentDTO {
	private int prod_ref;
	private int prod_cmtidx;
	private String prod_content;
	private String prod_name;
	private Date prod_date;
}
