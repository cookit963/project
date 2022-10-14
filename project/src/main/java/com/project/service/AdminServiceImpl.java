package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AlcoholVO;
import com.project.domain.AuthVO;
import com.project.domain.RestaurantVO;
import com.project.domain.UserListVO;
import com.project.persistence.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int restaurantAdd(RestaurantVO rest) {
		
		return mapper.restaurantAdd(rest);
	}

	@Override
	public List<UserListVO> userListGet() {
		
		return mapper.userListGet();
	}

	@Override
	public List<AuthVO> authListGet() {

		return mapper.authListGet();
	}

	@Override
	public List<AuthVO> authListGet2(String user_id) {
		
		return mapper.authListGet2(user_id);
	}

	@Override
	public int reviewControl(String user_id) {

		return mapper.reviewControl(user_id);
	}

	@Override
	public int reviewControl2(String user_id) {
		
		return mapper.reviewControl2(user_id);
	}

	@Override
	public int roleControl(String user_id) {

		return mapper.roleControl(user_id);
	}

	@Override
	public int roleControl2(String user_id) {

		return mapper.roleControl2(user_id);
	}

	@Override
	public int alcoholAdd(AlcoholVO alcohol) {

		return mapper.alcoholAdd(alcohol);
	}

	@Override
	public int alcoholCheck(String key) {

		return mapper.alcoholCheck(key);
	}

	@Override
	public int alcoholDel(int alcol_no) {

		return mapper.alcoholDel(alcol_no);
	}

	
}
