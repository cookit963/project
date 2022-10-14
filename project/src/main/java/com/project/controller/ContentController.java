package com.project.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

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
import com.project.domain.ReviewVO;
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
	public void main(Model model, Authentication auth) {
		log.info("main");
		List<ReviewVO> reviewList = service.reviewGet();
		for(int i=1; i<5; i++) {
			model.addAttribute("review"+i, reviewList.get(i));
		}
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user_id", user);
		}
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
		DecimalFormat form = new DecimalFormat("#.##");
		
		log.info("stars : "+service.stars(res_no));
		if(!(service.stars(res_no).isEmpty())) {
			List<ReviewVO> starsList = service.stars(res_no);
			int starsCount = service.starsCount(res_no);
			int tmp = 0;
			for(int i=0; i<starsList.size(); i++) {
				tmp += starsList.get(i).getRe_stars();	
			}
			log.info("tmp!!!!!!!!!!!! : "+tmp);
			log.info("stars!!!!!!!!!!!!! : "+starsCount);
			double result3 = (double)tmp / starsCount;
			model.addAttribute("starsCount", form.format(result3));
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
	
	@GetMapping("restaurantWishList")
	public void restaurantWishList(Model model, Authentication auth, Criteria cri) {
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user", service.addUserGet(user));
			model.addAttribute("user_id", user);
			List<WishRestVO> wishRestList = service.wishRestList(user);
			List<RestaurantVO> restaurantList = new ArrayList<RestaurantVO>();
			List<RestaurantVO> restaurantModul = service.getResList(cri);
			for(int i=0; i<wishRestList.size(); i++) {
				for(int j=0; j<restaurantModul.size(); j++) {
					if(wishRestList.get(i).getRes_no() == restaurantModul.get(j).getRes_no()) {
						restaurantList.add(restaurantModul.get(j));
					}
				}
			}
			model.addAttribute("restaurantList", restaurantList);
		}
	}
	
	@PostMapping("heartCountGet")
	@ResponseBody
	public String heartCountGet(int res_no, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		DecimalFormat form = new DecimalFormat("#.##");
		double result4 = 0;
		if(!(service.stars(res_no).isEmpty())) {
			List<ReviewVO> starsList = service.stars(res_no);
			int starsCount = service.starsCount(res_no);
			int tmp = 0;
			for(int i=0; i<starsList.size(); i++) {
				tmp += starsList.get(i).getRe_stars();	
			}
			result4 = (double)tmp / starsCount;
		}
		String starsNum = form.format(result4);
		return starsNum;
	}
	
	@GetMapping("restaurantDel")
	public String restaurantDel(int res_no, Model model) {
		int result = service.restaurantDel(res_no);
		if(result == 1) {
			model.addAttribute("restaurantDel", 1);
			return "redirect:/content/main";
		}else {
			model.addAttribute("restaurantDel", 1);
			return "redirect:/content/restaurantView?res_no="+res_no;
		}
	}
}
