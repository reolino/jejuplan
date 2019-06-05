package com.jejuplan.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jejuplan.model.BoardModel;
import com.jejuplan.service.BoardService;


@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/list") // URL 주소
	public String list(Model model) {
		
		Logger log = LoggerFactory.getLogger("LOGIN_LOG");
		log.info("안녕하세요. 테스트입니다.");

		BoardModel board = boardService.printBoard();
		
		model.addAttribute("id", board.getId());
		model.addAttribute("subject", board.getSubject());
		model.addAttribute("content", board.getContent());
		model.addAttribute("regDate", board.getReg_date());
		
		return "list"; // JSP 파일명
	}
}
