package com.project.service;

import java.util.List;

import com.project.domain.HeartsVO;
import com.project.domain.ReplyVO;
import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.domain.UserListVO;

public interface ReviewService {
	public List<ReviewVO> getReviewList();
	
	public int reviewAdd(ReviewVO review);
	
	public RestaurantVO getResName(int res_no);
	
	public ReviewVO reviewGet(String key);
	
	public ReviewVO reviewView(int re_no);
	
	public List<ReplyVO> replyGet(int re_no);
	
	public int replyCountGet(int re_no);
	
	public UserListVO addUserGet(String user_id);
	
	public HeartsVO getHeart(HeartsVO heart);
	
	public int heartAdd(HeartsVO heart);
	
	public int heartDel(HeartsVO heart);
	
	public int heartsCountGet(int re_no);
	
	
}
