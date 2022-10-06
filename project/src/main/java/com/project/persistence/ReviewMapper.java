package com.project.persistence;

import java.util.List;

import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;

public interface ReviewMapper {
	
	public List<ReviewVO> getReviewList();
	
	public int reviewAdd(ReviewVO review);
	
	public RestaurantVO getResName(int res_no);
	
	public ReviewVO reviewGet(String key); 
}
