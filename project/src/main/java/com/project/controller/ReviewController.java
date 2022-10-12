package com.project.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.HeartsVO;
import com.project.domain.RestaurantVO;
import com.project.domain.ReviewVO;
import com.project.domain.WishRestVO;
import com.project.service.ReviewService;
import com.project.service.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("reviewList")
	public void reviewList(Model model, int res_no, Authentication auth) {
		model.addAttribute("reviewList", service.getReviewList());
		model.addAttribute("res_no", res_no);
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user", service.addUserGet(user));
			model.addAttribute("user_id", user);
		}
		
	}
	
	@GetMapping("reviewAdd")
	@PreAuthorize("isAuthenticated()")
	public void reviewAdd(int res_no, Model model, Authentication auth) {
		
		model.addAttribute("res_no", res_no);
		model.addAttribute("restarauntVO", service.getResName(res_no));
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user", service.addUserGet(user));
		}
	}
	
	@PostMapping("reviewAdd")
	@PreAuthorize("isAuthenticated()")
	public String reviewAddPro(ReviewVO review, RedirectAttributes rttr, MultipartHttpServletRequest request, Model model) {
		
		try {

			for(int i = 1; i <=3; i++) {
				
				if(!((request.getFile("re_img0"+i)).isEmpty())) {
					MultipartFile mf = request.getFile("re_img0"+i);
					request.getFiles("re_img0"+i);
					String path = request.getRealPath("/resources/save");
					String uuid = UUID.randomUUID().toString().replaceAll("-", "");
					String orgName = mf.getOriginalFilename();
					String ext = orgName.substring(orgName.lastIndexOf("."));
					String newFileName = uuid + ext;
					String imgPath = path + "\\" + newFileName;
					
					File copyFile = new File(imgPath);
					mf.transferTo(copyFile);
					if(i == 1) {
						review.setRe_img1(newFileName);
					}else if(i == 2) {
						review.setRe_img2(newFileName);
					}else if(i == 3) {
						review.setRe_img3(newFileName);
					}
				}else if((request.getFile("re_img0"+i)).isEmpty()) {
					if(i == 2) {
						review.setRe_img2("default");
					}if(i == 3) {
						review.setRe_img3("default");
					}
				}
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		int result = service.reviewAdd(review);
		
		rttr.addFlashAttribute("result", result);
		rttr.addFlashAttribute("reviewReturn", service.reviewGet(review.getRe_img1()));
		
		
		return "redirect:/review/reviewAdd?res_no="+review.getRes_no();
	}
	
	@GetMapping("reviewView")
	public void reviewView(int re_no, Model model, Authentication auth, RedirectAttributes rttr) {
		ReviewVO reviewVO2 = service.reviewView(re_no);
		model.addAttribute("reviewVO", service.reviewView(re_no));
		model.addAttribute("replyList", service.replyGet(re_no));
		model.addAttribute("replyCount", service.replyCountGet(re_no));
		model.addAttribute("addUser", service.addUserGet(reviewVO2.getUser_id()));
		log.info("!!!!!!!!!!!heartsCount : "+service.heartsCountGet(re_no));
		model.addAttribute("heartsCount", service.heartsCountGet(re_no));
		model.addAttribute("restarauntVO", service.getResName(reviewVO2.getRes_no()));
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user", service.addUserGet(user));
			model.addAttribute("user_id", user);
			HeartsVO heartVO = new HeartsVO();
			heartVO.setRe_no(re_no);
			heartVO.setUser_id(user);
			model.addAttribute("getHeart", service.getHeart(heartVO));
		}
		
	}
	@RequestMapping(value = "heartAdd", method = RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public int heartAdd(HeartsVO heartVO, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		log.info("asdasda");
		int result2 = 0;
		result2 = service.heartAdd(heartVO);
		log.info("result2 : "+result2);
		return result2;
	}
	@RequestMapping(value = "heartDel", method = RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public int heartDel(HeartsVO heartVO, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		log.info("asdasda2");
		int result2 = 0;
		result2 = service.heartDel(heartVO);
		log.info("result2 : "+result2);
		return result2;
	}
	
	@PostMapping("resGet")
	@ResponseBody
	public RestaurantVO resGet(int res_no, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		
		
		log.info("resGet!!!!!!!!!!!");
		return service.getResName(res_no);
	}

	@PostMapping("heartsCount2")
	@ResponseBody
	public int heartsCount2(int re_no, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		
		
		
		log.info("heartsCount!!!!!!!!!!!");
		return service.heartsCountGet(re_no);
	}
	@PostMapping("heartCheck")
	@ResponseBody
	public int heartCheck(HeartsVO heartsVO, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) {
		int result5 = 0;
		
		if(service.getHeart(heartsVO) != null) {
			result5 = 1;
		}
		
		return result5;
	}
	
	@GetMapping("ReviewUserList")
	public void reviewUserList(Model model, String user_nicname, Authentication auth) {
		model.addAttribute("reviewList", service.getReviewList());
		model.addAttribute("user_nicname", user_nicname);
		if(auth != null) {
			CustomUser cUser = (CustomUser)auth.getPrincipal();
			String user = cUser.getUsername();
			model.addAttribute("user", service.addUserGet(user));
			model.addAttribute("user_id", user);
			
		}
		
	}
	
	@GetMapping("reviewHeartList")
	public void reviewHeartList() {
		
	}

}
