package com.project.service;

import com.project.domain.UserListVO;

public interface UserService {
		//회원 가입 
		public int addUser(UserListVO user);
		//권한 추가 (회원 가입과 분리)
		public int addAuth(String auth, String id);
		
		// 회원 정보 가져오기 
		public UserListVO getUser(String user_id);
		
		// 회원 정보 수정처리 
		public int modifyUser(UserListVO user);
		
		// 회원 탈퇴 처리
		public int deleteUser(UserListVO user);
}
