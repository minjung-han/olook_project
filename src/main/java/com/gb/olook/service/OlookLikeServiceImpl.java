package com.gb.olook.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gb.olook.mapper.OlookLikeMapper;
import com.gb.olook.model.OlookLikeDTO;


@Service
public class OlookLikeServiceImpl implements OlookLikeService{
	
	@Autowired
	OlookLikeMapper dao;

	@Override
	public int likecnt() {
		return dao.likecnt();
	}

	@Override
	public int like(OlookLikeDTO dto) {
		return dao.like(dto);
	}

	@Override
	public int likedelete(OlookLikeDTO dto) {
		return dao.likedelete(dto);
	}

	@Override
	public int likeinsert(OlookLikeDTO dto) {
		return dao.likeinsert(dto);
	}

	@Override
	   public int likedelete2(int idx) {
	      // TODO Auto-generated method stub
	      return dao.likedelete2(idx);
	   }
}
