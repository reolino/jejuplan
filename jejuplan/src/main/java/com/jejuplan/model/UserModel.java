package com.jejuplan.model;

import org.springframework.boot.autoconfigure.domain.EntityScan;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter 
@Setter
@EntityScan
@ToString
public class UserModel {
	private String user_id;
	private String user_pw;
	private String enabled;
	private String authority;
}
