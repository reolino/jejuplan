package com.jejuplan.sample.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jejuplan.sample.domain.BoardVO;
import com.jejuplan.sample.service.BoardService;

@RestController
@RequestMapping("/sample")
public class RestApiRestController {
	@Resource(name="com.jejuplan.sample.service.BoardService")
    BoardService boardService;
		
	@RequestMapping(value = "/rest_api/list/proc", method = RequestMethod.GET)
	public ResponseEntity<List<BoardVO>> list() throws Exception {
		List<BoardVO> boardlist = new ArrayList<BoardVO>();
		BoardVO board = new BoardVO();
		boardlist = boardService.boardList(board);
	    
	    return new ResponseEntity<List<BoardVO>>(boardlist, HttpStatus.OK) ;
	}
}
