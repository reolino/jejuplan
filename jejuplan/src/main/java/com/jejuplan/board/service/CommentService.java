package com.jejuplan.board.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.board.domain.CommentVO;
import com.jejuplan.board.mapper.CommentMapper;

@Service("com.jejuplan.board.service.CommentService")
public class CommentService {
	@Resource(name="com.jejuplan.board.mapper.CommentMapper")
	CommentMapper mCommentMapper;
    
    public List<CommentVO> commentListService() throws Exception{
        return mCommentMapper.commentList();
    }
    
    public int commentInsertService(CommentVO comment) throws Exception{
        return mCommentMapper.commentInsert(comment);
    }
    
    public int commentUpdateService(CommentVO comment) throws Exception{
        return mCommentMapper.commentUpdate(comment);
    }
    
    public int commentDeleteService(int cno) throws Exception{
        return mCommentMapper.commentDelete(cno);
    }
}
