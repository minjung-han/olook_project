package com.gb.olook.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class LookboardDTO {
	private String user_email;
	private int look_idx;
	private String look_intro;
	private String look_filename;
	private String look_content;
	private String look_top;
	private String look_bottom;
	private String look_shoes;
	private String look_acc;
	private String look_height;
	private String look_weight;
	private int loview_cnt;
	private int look_like;
	private int look_cmt;
	private Date look_date;
	private String user_nickname;
	private MultipartFile uploadFile;
	@Override
	public String toString() {
		return "LookboardDTO [user_email=" + user_email + ", look_idx=" + look_idx + ", look_intro=" + look_intro
				+ ", look_filename=" + look_filename + ", look_content=" + look_content + ", look_top=" + look_top
				+ ", look_bottom=" + look_bottom + ", look_shoes=" + look_shoes + ", look_acc=" + look_acc
				+ ", look_height=" + look_height + ", look_weight=" + look_weight + ", loview_cnt=" + loview_cnt
				+ ", look_like=" + look_like + ", look_cmt=" + look_cmt + ", look_date=" + look_date + ", uploadFile="
				+ uploadFile + "]";
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getLook_idx() {
		return look_idx;
	}
	public void setLook_idx(int look_idx) {
		this.look_idx = look_idx;
	}
	public String getLook_intro() {
		return look_intro;
	}
	public void setLook_intro(String look_intro) {
		this.look_intro = look_intro;
	}
	public String getLook_filename() {
		return look_filename;
	}
	public void setLook_filename(String look_filename) {
		this.look_filename = look_filename;
	}
	public String getLook_content() {
		return look_content;
	}
	public void setLook_content(String look_content) {
		this.look_content = look_content;
	}
	public String getLook_top() {
		return look_top;
	}
	public void setLook_top(String look_top) {
		this.look_top = look_top;
	}
	public String getLook_bottom() {
		return look_bottom;
	}
	public void setLook_bottom(String look_bottom) {
		this.look_bottom = look_bottom;
	}
	public String getLook_shoes() {
		return look_shoes;
	}
	public void setLook_shoes(String look_shoes) {
		this.look_shoes = look_shoes;
	}
	public String getLook_acc() {
		return look_acc;
	}
	public void setLook_acc(String look_acc) {
		this.look_acc = look_acc;
	}
	public String getLook_height() {
		return look_height;
	}
	public void setLook_height(String look_height) {
		this.look_height = look_height;
	}
	public String getLook_weight() {
		return look_weight;
	}
	public void setLook_weight(String look_weight) {
		this.look_weight = look_weight;
	}
	public int getLoview_cnt() {
		return loview_cnt;
	}
	public void setLoview_cnt(int loview_cnt) {
		this.loview_cnt = loview_cnt;
	}
	public int getLook_like() {
		return look_like;
	}
	public void setLook_like(int look_like) {
		this.look_like = look_like;
	}
	public int getLook_cmt() {
		return look_cmt;
	}
	public void setLook_cmt(int look_cmt) {
		this.look_cmt = look_cmt;
	}
	public Date getLook_date() {
		return look_date;
	}
	public void setLook_date(Date look_date) {
		this.look_date = look_date;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	
	
}
