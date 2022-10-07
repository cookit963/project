package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ReplyVO;
import com.project.persistence.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;

	@Override
	public int replyAdd(ReplyVO reply) {
		
		return mapper.replyAdd(reply);
	}
	
}
