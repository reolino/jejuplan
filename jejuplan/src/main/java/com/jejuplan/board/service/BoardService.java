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
    
    public List<BoardVO> boardList() throws Exception{
        return boardMapper.boardList();
    }
    
    public BoardVO boardDetail(int bno) throws Exception{
        return boardMapper.boardDetail(bno);
    }
    
    public int boardInsert(BoardVO board) throws Exception{
        return boardMapper.boardInsert(board);
    }
    
    public int boardUpdate(BoardVO board) throws Exception{
        return boardMapper.boardUpdate(board);
    }
    
    public int boardDelete(int bno) throws Exception{
        return boardMapper.boardDelete(bno);
    }
    
    public int fileInsert(FileVO file) throws Exception{
        return boardMapper.fileInsert(file);
    }
    
    public FileVO fileDetail(int bno) throws Exception{
        return boardMapper.fileDetail(bno);
    }
}
