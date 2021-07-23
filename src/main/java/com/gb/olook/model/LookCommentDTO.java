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
	public int getLook_ref() {
		return look_ref;
	}
	public void setLook_ref(int look_ref) {
		this.look_ref = look_ref;
	}
	public int getLook_cmtidx() {
		return look_cmtidx;
	}
	public void setLook_cmtidx(int look_cmtidx) {
		this.look_cmtidx = look_cmtidx;
	}
	public String getLook_content() {
		return look_content;
	}
	public void setLook_content(String look_content) {
		this.look_content = look_content;
	}
	public String getLook_name() {
		return look_name;
	}
	public void setLook_name(String look_name) {
		this.look_name = look_name;
	}
	public Date getLook_date() {
		return look_date;
	}
	public void setLook_date(Date look_date) {
		this.look_date = look_date;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
}
