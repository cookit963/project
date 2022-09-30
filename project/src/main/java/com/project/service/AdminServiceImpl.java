package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.RestaurantVO;
import com.project.persistence.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int restaurantAdd(RestaurantVO rest) {
		
		return mapper.restaurantAdd(rest);
	}
	
}
