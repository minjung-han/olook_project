package com.gb.olook.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OlookLikeDTO {
	private int like_idx;
	private int look_ref;
	private String user_email;
	private String user_nickname;
	
	
}
