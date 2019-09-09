package com.jejuplan.board.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.jejuplan.board.domain.BoardVO;

@Repository("com.jejuplan.board.mapper.BoardMapper")
public interface BoardMapper {
	
    public int boardNo() throws Exception;

    public int boardCount() throws Exception;
    
    public int boardListCount(BoardVO board) throws Exception;
    
    public List<BoardVO> boardList(BoardVO board) throws Exception;
    
    public BoardVO boardDetail(int board_no) throws Exception;
    
    public int boardInsert(BoardVO board) throws Exception;
    
    public int boardUpdate(BoardVO board) throws Exception;
    
    public int boardDelete(BoardVO board) throws Exception;
}
