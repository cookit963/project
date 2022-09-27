package com.project.persistence;

import com.project.domain.UserListVO;

public interface UserMapper {
	public UserListVO getUser(String user_id);
}
