package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.RestaurantVO;
import com.project.service.ContentService;

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
	public void restaurantList(Model model, Criteria cri) {
		model.addAttribute("restorauntList", service.getResList(cri));
	}
}
