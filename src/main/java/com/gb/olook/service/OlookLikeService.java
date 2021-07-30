package com.gb.olook.service;

import com.gb.olook.model.OlookLikeDTO;

public interface OlookLikeService {
	int likecnt();
	int like(OlookLikeDTO dto);
	int likedelete(OlookLikeDTO dto);
	int likeinsert(OlookLikeDTO dto);
	int likedelete2(int idx);
	int likeselect(OlookLikeDTO dto);
}
