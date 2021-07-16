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
public class ProductboardDTO {
	private String user_email;
	private int product_idx;
	private String product_filename;
	private String product_price;
	private String product_title;
	private String product_content;
	private int proview;
	private int prod_cmt;
	private Date prod_date;
}
