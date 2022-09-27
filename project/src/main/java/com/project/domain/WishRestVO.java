package com.project.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishRestVO {
	private String user_id;
	private int res_no;
	private Timestamp w_reg;
}
