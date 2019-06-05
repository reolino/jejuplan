package com.jejuplan.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter
public class BoardModel {
	private int id;
	private String subject;
	private String content;
	private Date reg_date;
}
