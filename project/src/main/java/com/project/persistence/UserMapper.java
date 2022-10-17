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
	public int deleteUser(String id);
	// 권한 삭제 
	public int deleteAuth(String id);
	public int deleteReview(String id);
	public int deleteReply(String id);
	public int deleteHearts(String id);
	public int deleteWishRest(String id);
	
	// 아이디 비번 확인 
	public int idPwCheck(UserListVO user);
	
	public int emailCheck(String email);
	public int nicnameCheck(String nicname);
}
