package com.project.persistence;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;

public interface ContentMapper {
	
	public List<RestaurantVO> getResList(Criteria cri);
}
