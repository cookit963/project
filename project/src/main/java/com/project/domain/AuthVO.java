package com.project.domain;

import lombok.Data;

@Data
public class AuthVO {
	private String user_id; 
	private String auth; // 'ROLE_MEMBER' | 'ROLE_ADMIN'
}
