package com.jejuplan.sample.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.sample.domain.BoardVO;
import com.jejuplan.sample.mapper.BoardMapper;

@Service("com.jejuplan.sample.service.BoardService")
public class BoardService {
	@Resource(name="com.jejuplan.sample.mapper.BoardMapper")
    BoardMapper boardMapper;
    
	public int boardNo() throws Exception{
		return boardMapper.boardNo();
	}
	
	public int boardListCount(BoardVO board) throws Exception{
		return boardMapper.boardListCount(board);
	}
	
    public List<BoardVO> boardList(BoardVO board) throws Exception{
        return boardMapper.boardList(board);
    }
    
    public BoardVO boardDetail(int board_no) throws Exception{
        return boardMapper.boardDetail(board_no);
    }
    
    public int boardInsert(BoardVO board) throws Exception{
        return boardMapper.boardInsert(board);
    }
    
    public int boardUpdate(BoardVO board) throws Exception{
        return boardMapper.boardUpdate(board);
    }
    
    public int boardDelete(BoardVO board) throws Exception{
        return boardMapper.boardDelete(board);
    }
}
