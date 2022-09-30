package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;
import com.project.persistence.ContentMapper;

@Service
public class ContentServiceImpl implements ContentService{

	@Autowired
	private ContentMapper mapper;
	
	@Override
	public List<RestaurantVO> getResList(Criteria cri) {
		
		return mapper.getResList(cri);
	}

}
