package com.jejuplan.common.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileVO {
	private int file_no;
    private int board_no;
    private String menu_id;     
    private String file_nm;     
    private String file_origin_nm; 
    private String file_url; 
	private long file_size;
    private String file_ext; 
    private String reg_user_id;
}
