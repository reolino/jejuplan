package com.jejuplan.board.domain;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int bno;
    private String menuid;
    private String subject;
    private String content;
    private String writer;
    private Date reg_date;
}
