package com.project.persistence;

import java.util.List;

import com.project.domain.AlcoholVO;
import com.project.domain.AuthVO;
import com.project.domain.RestaurantVO;
import com.project.domain.UserListVO;

public interface AdminMapper {
	
	public int restaurantAdd(RestaurantVO rest);
	
	public List<UserListVO> userListGet();
	
	public List<AuthVO> authListGet();
	
	public List<AuthVO> authListGet2(String user_id);
	
	public int reviewControl(String user_id);
	
	public int reviewControl2(String user_id);
	
	public int roleControl(String user_id);
	
	public int roleControl2(String user_id);
	
	public int alcoholAdd(AlcoholVO alcohol);
	
	public int alcoholCheck(String key);
	
	public int alcoholDel(int alcol_no);
}
