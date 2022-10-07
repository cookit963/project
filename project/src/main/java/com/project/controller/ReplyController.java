package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.ReplyVO;
import com.project.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reply/*")
@Log4j
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@PostMapping("replyAdd")
	@ResponseBody
	public int replyAdd(ReplyVO replyVO, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		int result3 = 0;
		result3 = service.replyAdd(replyVO);
		return result3;
	}
}
