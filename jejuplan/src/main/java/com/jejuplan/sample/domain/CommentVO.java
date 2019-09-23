package com.jejuplan.sample.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVO {
	private int comment_no;
    private int board_no;
    private String menu_id;
    private String reg_user_id;
    private String reg_user_nm;
    private String content;
    private Date reg_date;
    private Date mod_date;
}



