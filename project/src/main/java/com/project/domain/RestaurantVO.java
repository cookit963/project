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
	private String res_colCon;
	private int res_colGlass;
	private int res_colSer;
	private int res_colOpen;
	private int res_amenPrivate;
	private int res_amenPaking;
	private int res_amenParty;
	private int res_amenValet;
	private int res_amenRental;
	private int res_amenSoml;
}
