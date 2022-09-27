package com.project.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	private int re_no;
	private String res_name;
	private String re_img1;
	private String re_img2;
	private String re_img3;
	private String re_content;
	private String re_hashtag;
	private String user_id;
	private Timestamp re_reg;
}
