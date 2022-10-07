package com.project.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	private int r_no;
	private String user_id;
	private String user_nicname;
	private int re_no;
	private String r_content;
	private Timestamp r_reg;
}
