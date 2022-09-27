package com.project.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int no_no;
	private String no_title;
	private String no_img;
	private String no_content;
	private int no_hidden;
	private Timestamp no_reg;
}
