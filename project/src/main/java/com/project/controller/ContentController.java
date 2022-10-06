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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.domain.RestaurantVO;
import com.project.domain.UserListVO;
import com.project.domain.WishRestVO;
import com.project.service.ContentService;
import com.project.service.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/content/*")
@Log4j
public class ContentController {
	
	@Autowired
	private ContentService service;
	
	@GetMapping("main")
	public void main() {
		log.info("main");
	}
	
	@GetMapping("restaurantList")
	public void restaurantList(Model model, String res_ca, Criteria cri) {
		model.addAttribute("restaurantList", service.getResList(cri));
		log.info("res_ca = " + res_ca);
		model.addAttribute("res_ca", res_ca);
//		int total = service.getResTotal(cri);
//		model.addAttribute("paper", new PageDTO(cri, total));
	}
	@GetMapping("restaurantView")
	public void restaruantView(Model model,@RequestParam int res_no, RedirectAttributes rttr, Authentication auth) {
		model.addAttribute("restaurantVO", service.getResView(res_no));
		
		log.info("stars : "+service.stars(res_no));
		if(!(service.stars(res_no).isEmpty())) {
			model.addAttribute("stars", service.stars(res_no));
		}
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			log.info("!!!!!!!!!!user : "+user);
			log.info("!!!!!!!!!!res_no : "+res_no);
			model.addAttribute("user", user);
			WishRestVO wishVO = new WishRestVO();
			wishVO.setUser_id(user);
			wishVO.setRes_no(res_no);
			model.addAttribute("getWishRest", service.getWishRest(wishVO));
			
		}
		
		int result = 1;
		rttr.addAttribute("result", result);
		
	}
	@RequestMapping(value = "wishRestAdd", method = RequestMethod.POST)
	@ResponseBody
	public int WishRestAdd(WishRestVO wishVO, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		log.info("asdasda");
		int result2 = service.wishRestAdd(wishVO);
		log.info("result2 : "+result2);
		return result2;
	}
	@RequestMapping(value = "wishRestDel", method = RequestMethod.POST)
	@ResponseBody
	public int WishRestDel(WishRestVO wishVO, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		log.info("asdasda2");
		int result2 = service.wishRestDel(wishVO);
		log.info("result2 : "+result2);
		return result2;
	}
	@GetMapping("colkageMap")
	public void colkageMap(Model model, String res_ca, Criteria cri) {
		model.addAttribute("restaurantList", service.getResList(cri));
	}
}
