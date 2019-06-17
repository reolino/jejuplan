package com.jejuplan.board.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.domain.FileVO;
import com.jejuplan.board.mapper.BoardMapper;

@Service("com.jejuplan.board.service.BoardService")
public class BoardService {
	@Resource(name="com.jejuplan.board.mapper.BoardMapper")
    BoardMapper boardMapper;
    
    public List<BoardVO> boardListService() throws Exception{
        return boardMapper.boardList();
    }
    
    public BoardVO boardDetailService(int bno) throws Exception{
        return boardMapper.boardDetail(bno);
    }
    
    public int boardInsertService(BoardVO board) throws Exception{
        return boardMapper.boardInsert(board);
    }
    
    public int boardUpdateService(BoardVO board) throws Exception{
        return boardMapper.boardUpdate(board);
    }
    
    public int boardDeleteService(int bno) throws Exception{
        return boardMapper.boardDelete(bno);
    }
    
    public int fileInsertService(FileVO file) throws Exception{
        return boardMapper.fileInsert(file);
    }
    
    public FileVO fileDetailService(int bno) throws Exception{
        return boardMapper.fileDetail(bno);
    }
}
