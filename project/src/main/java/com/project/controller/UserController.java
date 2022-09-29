package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.UserListVO;
import com.project.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {
	
	@Autowired
	private UserService service;
	
	@GetMapping("login")
	public void loginPro(String error, HttpServletRequest request) {
		log.info("************** login!!!! *************");
		log.info("error : " + error);
		
		// 접근제한때문에 로그인폼으로 강제 이동되었다면 직전 url 뽑아서 session 임시저장 
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);
		
	}
	
	@GetMapping("signup")
	public void signup() {
		log.info("************** signup!!!! *************");
	}
	// 회원가입 처리 
	@PostMapping("signup")
	public String signupPro(UserListVO vo, String au, RedirectAttributes rttr) {
		
		log.info("*********** signupPro MemberVO : " + vo);
		log.info("*********** signupPro au : " + au);
		
		int result = service.addUser(vo);  // 회원 추가 
		service.addAuth(au, vo.getUser_id());	// 권한 추가 
		
		if(result == 1) {
			rttr.addFlashAttribute("msg", "success");
		}
		
		return "redirect:/board/main";
	}
	
	@PostMapping("idAvail")
	@ResponseBody
	public int checkResult(String user_id, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		int result = 0;
		
		if(service.getUser(user_id) != null) {
			result = 0;
		}else {
			result = 1;
		}
		
		return result;
	}
}
