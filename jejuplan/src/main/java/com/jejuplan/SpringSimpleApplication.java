package com.jejuplan;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class SpringSimpleApplication {
	
	public static void main(String[] args) {
		new SpringApplicationBuilder()
		.sources(SpringSimpleApplication.class)
		.logStartupInfo(false)
		.run(args);
	}
}
