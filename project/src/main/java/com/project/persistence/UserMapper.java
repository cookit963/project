package com.project.persistence;

import com.project.domain.AuthVO;
import com.project.domain.UserListVO;

public interface UserMapper {
	public UserListVO getUser(String user_id);
	// 회원 추가 
	public int addUser(UserListVO user);
	// 권한 추가 
	public int addAuth(AuthVO auth);
	
	// 회원 정보수정
	public int updateUser(UserListVO user);
	
	// 회원 삭제
	public int deleteUser(String id, String pw);
	// 권한 삭제 
	public int deleteAuth(String id);
	
	// 아이디 비번 확인 
	public int idPwCheck(UserListVO user);
}
