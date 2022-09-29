package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.domain.AuthVO;
import com.project.domain.UserListVO;
import com.project.persistence.UserMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService{

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private UserMapper mapper;
	
	@Override
	public int addUser(UserListVO user) {
		user.setUser_pw(bcryptPasswordEncoder.encode(user.getUser_pw()));
		return mapper.addUser(user);
	}

	@Override
	public UserListVO getUser(String user_id) {
		return mapper.getUser(user_id);
	}

	

	@Override
	public int deleteUser(UserListVO user, String userPass) {
		int result = 0;
		log.info(userPass);
		log.info(user.getUser_pw());
		if(bcryptPasswordEncoder.matches(userPass,user.getUser_pw())) {
			result = mapper.deleteUser(user.getUser_id());
			if(result == 1) {
				result = mapper.deleteAuth(user.getUser_id());
				mapper.deleteReview(user.getUser_id());
				mapper.deleteReply(user.getUser_id());
				mapper.deleteHearts(user.getUser_id());
				mapper.deleteWishRest(user.getUser_id());
			}
		} else {
			result = 0;
        }
		log.info(result);
		return result;
	}

	@Override
	public int addAuth(String auth, String id) {
		int result = -1; 
		AuthVO authVO = new AuthVO(); 
		authVO.setUser_id(id);
		if(auth.equals("user")) { // 일반회원 가입시 권한 추가 
			authVO.setAuth("ROLE_USER");
			result = mapper.addAuth(authVO);
		}else if(auth.equals("admin")) { // 관리자로 가입시 권한 추가(2개)  
			authVO.setAuth("ROLE_USER");
			result = mapper.addAuth(authVO);
			authVO.setAuth("ROLE_ADMIN");
			result = mapper.addAuth(authVO);
		}
		return result;
	}
	
	
	@Override
	public int modifyUser(UserListVO user) {
		log.info("nicname : " + user.getUser_nicname());
		log.info("pw : " + user.getUser_pw());
		if(user.getUser_pw() != "" || user.getUser_nicname() != "") {
			if(user.getUser_pw() != "") {
				user.setUser_pw(bcryptPasswordEncoder.encode(user.getUser_pw()));
			}
			return mapper.updateUser(user);
		}else {
			return -1;
		}
	}
}
