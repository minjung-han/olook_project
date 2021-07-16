package com.gb.olook.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OlookUserDTO {
	private String user_name;
	private String user_nickname;
	private String user_phone;
	private String user_email;
	private String user_password;
	private String filename;
	private String intro;
}