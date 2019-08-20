package com.jejuplan.board.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.domain.FileVO;

@Repository("com.jejuplan.board.mapper.BoardMapper")
public interface BoardMapper {
	
    public int boardCount() throws Exception;
    
    public List<BoardVO> boardList() throws Exception;
    
    public BoardVO boardDetail(int board_no) throws Exception;
    
    public int boardInsert(BoardVO board) throws Exception;
    
    public int boardUpdate(BoardVO board) throws Exception;
    
    public int boardDelete(BoardVO board) throws Exception;
    
    public int fileInsert(FileVO board) throws Exception;
    
    public FileVO fileDetail(int bno) throws Exception;
}
