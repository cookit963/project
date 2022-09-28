package com.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
	
		log.info("************* Login Success ***********");
		
		List<String> roleNames = new ArrayList<String>();
		// 로그인한 사람의 권한 목록 얻어오기 
	 	authentication.getAuthorities()
	 	.forEach(authority -> roleNames.add(authority.getAuthority()));
		
	 	log.info("******** ROLE NAMES : " + roleNames);
		
	 	/* 권한에 따른 페이지 이동 처리
	 	if(roleNames.contains("ROLE_ADMIN")) { // 어드민 권한이 있으면 
	 		response.sendRedirect("/admin/main"); // 어드민 메인페이지로 이동 
	 	}
	 	if(roleNames.contains("ROLE_SALES")) { // 어드민 권한이 있으면 
	 		response.sendRedirect("/sales/main"); // 어드민 메인페이지로 이동 
	 	}
	 	*/
	 	
	 	// 로그인폼으로 강제 이동되어, 로그인처리 성공후 보던곳으로 가기위한 처리 
	 	HttpSession session = request.getSession(); 
	 	if(session != null) {
	 		String redirectURL = (String)session.getAttribute("prevPage");
	 		if(redirectURL != null) {
	 			session.removeAttribute("prevPage");
	 			response.sendRedirect(redirectURL);
	 		}else {
	 			response.sendRedirect("/board/main");
	 		}
	 	}else {
	 		response.sendRedirect("/board/main");
	 	}
	 	
	}

	
	
}
