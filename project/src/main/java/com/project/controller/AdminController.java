package com.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.AlcoholVO;
import com.project.domain.AuthVO;
import com.project.domain.RestaurantVO;
import com.project.domain.UserListVO;
import com.project.service.AdminService;

import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("restaurantAdd")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void restaurantAdd() {
		
	}
	@GetMapping("adminMain")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void adminMain() {
		
		
	}
	@PostMapping("restaurantAdd")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String restaurantAddPro(RestaurantVO rest, RedirectAttributes rttr,
			MultipartHttpServletRequest request) {
		
		try {
			
			MultipartFile mf = request.getFile("res_menuu");
			request.getFiles("res_menuu");
			String path = request.getRealPath("/resources/save");
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String newFileName = uuid + ext;
			String imgPath = path + "\\" + newFileName;
			
			File copyFile = new File(imgPath);
			mf.transferTo(copyFile);
			rest.setRes_menu(newFileName);
			for(int i = 1; i <=3; i++) {
				
				if(!((request.getFile("res_img0"+i)).isEmpty())) {
					mf = null; path=null; uuid=null; orgName=null; ext=null; newFileName=null; imgPath=null; copyFile=null;
					mf = request.getFile("res_img0"+i);
					request.getFiles("res_img0"+i);
					path = request.getRealPath("/resources/save");
					uuid = UUID.randomUUID().toString().replaceAll("-", "");
					orgName = mf.getOriginalFilename();
					ext = orgName.substring(orgName.lastIndexOf("."));
					newFileName = uuid + ext;
					imgPath = path + "\\" + newFileName;
					
					copyFile = new File(imgPath);
					mf.transferTo(copyFile);
					if(i == 1) {
						rest.setRes_img1(newFileName);
					}else if(i == 2) {
						rest.setRes_img2(newFileName);
					}else if(i == 3) {
						rest.setRes_img3(newFileName);
					}
				}else if((request.getFile("res_img0"+i)).isEmpty()) {
					if(i == 2) {
						rest.setRes_img2("default");
					}else if(i == 3) {
						rest.setRes_img3("default");
					}
				}
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		service.restaurantAdd(rest);
		
		rttr.addFlashAttribute("result", rest.getRes_no());
		
		return "redirect:/admin/restaurantAdd";
	}
	
	@GetMapping("userManagement")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void userManagement(Model model, Authentication auth) {
			
		List<UserListVO> userList = service.userListGet();
		List<AuthVO> authList = service.authListGet();
		model.addAttribute("userList", userList);
		model.addAttribute("authList", authList);
		
	}
	
	@PostMapping("reviewControl")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	public int reviewControl(String user_id, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		int result2 = 0;
		log.info("user_id!!!!!!!!!"+user_id);
		result2 = service.reviewControl(user_id);
		
		return result2;
	}
	@PostMapping("reviewControl2")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	public int reviewControl2(String user_id, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		int result2 = 0;
		
		result2 = service.reviewControl2(user_id);
		
		return result2;
	}
	
	@PostMapping("roleControl")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	public int roleControl(String user_id, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		int result3 = 0;
		log.info("user_id!!!!!!!!!"+user_id);
		result3 = service.roleControl(user_id);
		
		return result3;
	}
	@PostMapping("roleControl2")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	public int roleControl2(String user_id, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		int result3 = 0;
		log.info("user_id!!!!!!!!!"+user_id);
		result3 = service.roleControl2(user_id);
		
		return result3;
	}
	@GetMapping("alcoholAdd")
	public void alcoholAdd() {
		
	}
	@PostMapping("alcoholAdd")
	public String alcoholAddPro(AlcoholVO alcol, RedirectAttributes rttr, MultipartHttpServletRequest request) {
		try {
			MultipartFile mf = request.getFile("alcol_img1");
			request.getFiles("alcol_img1");
			String path = request.getRealPath("/resources/save");
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String newFileName = uuid + ext;
			String imgPath = path + "\\" + newFileName;
			
			File copyFile = new File(imgPath);
			mf.transferTo(copyFile);
			alcol.setAlcol_img(newFileName);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		service.alcoholAdd(alcol);
		rttr.addFlashAttribute("result", service.alcoholCheck(alcol.getAlcol_img()));
		return "redirect:/admin/alcoholAdd";
	}
	@GetMapping("alcoholDel")
	public String alcoholDel(int alcol_no, Model model) {
		int result = service.alcoholDel(alcol_no);
		if(result == 1) {
			model.addAttribute("alcoholDel", 1);
			return "redirect:/content/main";
		}else {
			model.addAttribute("alcoholDel", 1);
			return "redirect:/content/alcoholView?alcol_no="+alcol_no;
		}
	}
	
}
