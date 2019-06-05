package com.jejuplan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jejuplan.model.BoardModel;
import com.jejuplan.service.BoardService;

@Controller
public class LoginController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/") 
	public String index() {		
		return "admin/login_view"; 
	}
}
