package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.domain.WishRestVO;
import com.project.persistence.ContentMapper;

@Service
public class ContentServiceImpl implements ContentService{

	@Autowired
	private ContentMapper mapper;
	
	@Override
	public List<RestaurantVO> getResList(Criteria cri) {
		
		return mapper.getResList(cri);
	}

	@Override
	public RestaurantVO getResView(int res_no) {
		
		return mapper.getResView(res_no);
	}

	@Override
	public List<ReviewVO> stars(int res_no) {
		
		return mapper.stars(res_no);
	}

	@Override
	public int getResTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public int wishRestAdd(WishRestVO restVO) {
		
		return mapper.wishRestAdd(restVO);
	}

	@Override
	public int wishRestDel(WishRestVO restVO) {
		
		return mapper.wishRestDel(restVO);
	}

	@Override
	public WishRestVO getWishRest(WishRestVO restVO) {
		
		return mapper.getWishRest(restVO);
	}

}
