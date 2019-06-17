package com.jejuplan.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileVO {
	private int fno;
    private int bno;
    private String fileName;     
    private String fileOriName; 
    private String fileUrl;
}
