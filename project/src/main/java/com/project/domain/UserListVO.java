package com.project.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class UserListVO {
	private String user_id;
	private String user_pw;
	private String user_nicname;
	private String user_email;
	private Timestamp user_reg;
	private int user_delete;
	private Timestamp user_deletereg;
	private int user_reviewon;
	private List<AuthVO> authList;
}
