package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.HeartsVO;
import com.project.domain.ReplyVO;
import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.domain.UserListVO;
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

	@Override
	public ReviewVO reviewView(int re_no) {

		return mapper.reviewView(re_no);
	}

	@Override
	public List<ReplyVO> replyGet(int re_no) {
		
		return mapper.replyGet(re_no);
	}

	@Override
	public UserListVO addUserGet(String user_id) {
		
		return mapper.addUserGet(user_id);
	}

	@Override
	public HeartsVO getHeart(HeartsVO heart) {
		
		return mapper.getHeart(heart);
	}

	@Override
	public int heartAdd(HeartsVO heart) {
		
		return mapper.heartAdd(heart);
	}

	@Override
	public int heartDel(HeartsVO heart) {
		
		return mapper.heartDel(heart);
	}

	@Override
	public int heartsCountGet(int re_no) {
		
		return mapper.heartsCountGet(re_no);
	}

	@Override
	public int replyCountGet(int re_no) {

		return mapper.replyCountGet(re_no);
	}

	@Override
	public UserListVO userGet(String user_nicname) {

		return mapper.userGet(user_nicname);
	}

	@Override
	public List<HeartsVO> heartsList(String user_id) {

		return mapper.heartsList(user_id);
	}

	

	
}
