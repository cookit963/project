package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.persistence.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getReviewList() {
		
		return mapper.getReviewList();
	}

	@Override
	public int reviewAdd(ReviewVO review) {
		
		return mapper.reviewAdd(review);
	}

	@Override
	public RestaurantVO getResName(int res_no) {
		
		return mapper.getResName(res_no);
	}

	@Override
	public ReviewVO reviewGet(String key) {
		
		return mapper.reviewGet(key);
	}
	
}
