package com.gb.olook.mapper;

import com.gb.olook.model.OlookLikeDTO;
import com.gb.olook.model.OlookUserDTO;

public interface OlookLikeMapper {
	int likecnt();
	int like(OlookLikeDTO dto);
	int likedelete(OlookLikeDTO dto);
	int likeinsert(OlookLikeDTO dto);
	int likedelete2(int idx);
	int likeselect(OlookLikeDTO dto);
}
