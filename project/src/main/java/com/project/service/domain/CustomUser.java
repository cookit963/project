package com.project.service.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.project.domain.UserListVO;

import lombok.Getter;

@Getter
public class CustomUser extends User { // principal 

	private static final long serialVersionUID = 1L;
	
	// 회원 정보 담을 인스턴스 변수 추가 
	private UserListVO member; 
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(UserListVO vo) {
		super(vo.getUser_id(), vo.getUser_pw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList())
		);
		this.member = vo; 
	}
	
	
}
