package com.jejuplan.board.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.board.domain.CommentVO;
import com.jejuplan.board.mapper.CommentMapper;

@Service("com.jejuplan.board.service.CommentService")
public class CommentService {
	@Resource(name="com.jejuplan.board.mapper.CommentMapper")
	CommentMapper commentMapper;
    
    public List<CommentVO> commentList(CommentVO comment) throws Exception{
        return commentMapper.commentList(comment);
    }
    
    public int commentInsert(CommentVO comment) throws Exception{
        return commentMapper.commentInsert(comment);
    }
    
    public int commentUpdate(CommentVO comment) throws Exception{
        return commentMapper.commentUpdate(comment);
    }
    
    public int commentDelete(int cno) throws Exception{
        return commentMapper.commentDelete(cno);
    }
}
