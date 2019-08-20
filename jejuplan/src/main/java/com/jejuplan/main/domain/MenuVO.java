package com.jejuplan.main.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuVO {
	private String menu_id;
	private String menu_nm;
	private String menu_url;
	private int menu_lv;
	private String menu_desc;
	private String parent_menu_id;
	private String tree_order;
	private String tree_menu;
	private String sort_no;
	private String reg_user_id;
	private String mod_user_id;
	private String use_yn;
	private Date reg_date;
	private Date mod_date; 
	private String lv_cnt; 
}