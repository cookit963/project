package com.project.service;

import java.util.List;

import com.project.domain.AlcoholVO;
import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.domain.UserListVO;
import com.project.domain.WishRestVO;

public interface ContentService {
	
	public List<RestaurantVO> getResList(Criteria cri);
	
	public RestaurantVO getResView(int res_no);
	
	public List<ReviewVO> stars(int res_no);
	
	public int getResTotal(Criteria cri);
	
	public int wishRestAdd(WishRestVO restVO);
	
	public int wishRestDel(WishRestVO restVO);
	
	public WishRestVO getWishRest(WishRestVO restVO);
	
	public UserListVO addUserGet(String user_id);
	
	public List<WishRestVO> wishRestList(String user_id);
	
	public int starsCount(int res_no);
	
	public int restaurantDel(int res_no);
	
	public List<ReviewVO> reviewGet();
	
	public List<AlcoholVO> alcoholListGet();
	
	public AlcoholVO alcoholGet(int alcol_no);
}
