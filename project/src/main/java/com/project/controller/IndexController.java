package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping()
@Log4j
public class IndexController {
	@GetMapping("index.html")
	public String index() {
		
		return "redirect:/content/main";
	}
}
