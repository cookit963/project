package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.domain.UserListVO;
import com.project.service.domain.CustomUser;
import com.project.persistence.UserMapper;

import lombok.extern.log4j.Log4j;

// 스프링 시큐리티의 권한 인증을 처리해주는 비지니스 로직 서비스 클래스 
// 시큐리티에서 내부에서 사용되어지는 UserDetailsService 인터페이스를 
// 구현하는 클래스로 작성 
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;
	
	// username을 주면 회원정보를 UserDatails로 리턴해주는 처리가 되어야한다. 
	// 우리가 사용하는 회원정보(회원테이블)는 MemberVO이며, 
	// 이 메서드가 리턴해주는 타입은 UserDetails 인터페이스이다. 
	// -> MemberVO를 UserDetails 타입으로 변환해주는 처리가 필요함. 
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("LoadUserByUsername username : " + username);
		
		UserListVO vo = mapper.getUser(username);
		log.info("*************** loadUserByUsername vo : " + vo);
		
		return vo == null? null : new CustomUser(vo); 
	}
	
}
