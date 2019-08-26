package com.jejuplan.board.domain;

import com.jejuplan.common.domain.commonVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO extends commonVO {
	private int board_no;
    private String menu_id;
    private String title;
    private String content;
    private String reg_user_id;
    private String reg_user_nm;
    private String mod_user_id;
    private String reg_date;
    private String mod_date;
    private String use_yn;
    private String sort_no;
}
