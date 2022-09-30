package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;

public interface ContentService {
	
	public List<RestaurantVO> getResList(Criteria cri);
}
