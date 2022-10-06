package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.domain.WishRestVO;

public interface ContentService {
	
	public List<RestaurantVO> getResList(Criteria cri);
	
	public RestaurantVO getResView(int res_no);
	
	public List<ReviewVO> stars(int res_no);
	
	public int getResTotal(Criteria cri);
	
	public int wishRestAdd(WishRestVO restVO);
	
	public int wishRestDel(WishRestVO restVO);
	
	public WishRestVO getWishRest(WishRestVO restVO);
}
