package com.jejuplan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jejuplan.dao.BoardDao;
import com.jejuplan.model.BoardModel;
import com.jejuplan.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	@Override
	public BoardModel printBoard() {
		BoardModel board = dao.getBoard();
		return board;
	}
}
