package com.project.domain;

import lombok.Data;

@Data
public class RestaurantVO {
	private int res_no;
	private String res_name;
	private String res_call;
	private String res_address;
	private String res_content;
	private String res_menu;
	private String res_img1;
	private String res_img2;
	private String res_img3;
	private String res_genre;
	private String res_colcon;
	private int res_colglass;
	private int res_colser;
	private int res_colopen;
	private int res_amenprivate;
	private int res_amenpaking;
	private int res_amenparty;
	private int res_amenvalet;
	private int res_amenrental;
	private int res_amensoml;
}
