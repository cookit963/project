package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.UserListVO;
import com.project.service.ReviewService;
import com.project.service.UserService;
import com.project.service.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("login")
	public void loginPro(String error, HttpServletRequest request) {
		log.info("************** login!!!! *************");
		log.info("error : " + error);
		
		// 접근제한때문에 로그인폼으로 강제 이동되었다면 직전 url 뽑아서 session 임시저장 
//		String referrer = request.getHeader("Referer");
//		request.getSession().setAttribute("prevPage", referrer);
		
	}
	
	@GetMapping("signup")
	@PreAuthorize("isAnonymous()")
	public void signup() {
		log.info("************** signup!!!! *************");
	}
	// 회원가입 처리 
	@PostMapping("signup")
	@PreAuthorize("isAnonymous()")
	public String signupPro(UserListVO vo, String au, String check1, String check2, String check3, String check4, RedirectAttributes rttr) {
		
		log.info("*********** signupPro MemberVO : " + vo);
		log.info("*********** signupPro au : " + au);
		log.info("!!!!!!!!!!! check1 : "+check1);
		log.info("!!!!!!!!!!! check2 : "+check2);
		log.info("!!!!!!!!!!! check3 : "+check3);
		log.info("!!!!!!!!!!! check4 : "+check4);
		if(check1.equals("yes") && check2.equals("yes") && check3.equals("yes") && check4.equals("yes")) {
			int result = service.addUser(vo);  // 회원 추가 
			service.addAuth(au, vo.getUser_id());	// 권한 추가 
			
			if(result == 1) {
				rttr.addFlashAttribute("msg", "success");
			}
			rttr.addFlashAttribute("signResult", 1);
			return "redirect:/content/main";
		}else {
			rttr.addFlashAttribute("signResult", 1);
			return "redirect:/user/signup";
		}
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
	
	@GetMapping("customLogout")
	
	public String customLogout() {
		log.info("로그아웃....");
		
		//TODO 0901 페이지 만들어주기... view...없이...
		return "user/logout";
	}
	
	@GetMapping("mypage")
	@PreAuthorize("isAuthenticated()")
	public void mypage(Authentication auth, Model model) {
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user", service.getUser(user));
		}
	}
	
	@GetMapping("modify")
	@PreAuthorize("isAuthenticated()")
	public void modify(Authentication auth, Model model) {
		CustomUser cUser = (CustomUser)auth.getPrincipal();
		UserListVO user = service.getUser(cUser.getUsername());
		model.addAttribute("user", user);
	}
	@PostMapping("modify")
	@PreAuthorize("isAuthenticated()")
	public String modifyPro(UserListVO vo, Model model, Authentication auth) {
		vo.setUser_id(((CustomUser)auth.getPrincipal()).getUsername());
		int result = service.modifyUser(vo);
		model.addAttribute("result", result);
		
		return "user/modifyPro";
	}
	
	@GetMapping("delete")
	@PreAuthorize("isAuthenticated()")
	public void delete(Authentication auth, Model model) {
		CustomUser cUser = (CustomUser)auth.getPrincipal();
		UserListVO user = service.getUser(cUser.getUsername());
		model.addAttribute("user", user);
	}
	
	// 회원 삭제 처리 
	@PostMapping("delete")
	@PreAuthorize("isAuthenticated()")
	public String deletePro(UserListVO vo, Authentication auth, Model model, HttpServletRequest request) {
		vo.setUser_id(((CustomUser)auth.getPrincipal()).getUsername());
		
		
		String userPass = request.getParameter("user_pawd");
		
		int result = service.deleteUser(vo, userPass);
		model.addAttribute("result", result);
		return "user/deletePro"; 
	}
	
	@PostMapping("emailAvail")
	@ResponseBody
	public int emailAvail(String user_email, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		int result = 0;
		
		if(service.emailCheck(user_email) != 0) {
			result = 0;
		}else {
			result = 1;
		}
		
		return result;
	}
	@PostMapping("nicnameAvail")
	@ResponseBody
	public int nicnameAvail(String user_nicname, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		int result = 0;
		
		if(service.nicnameCheck(user_nicname) != 0) {
			result = 0;
		}else {
			result = 1;
		}
		
		return result;
	}
	
}
