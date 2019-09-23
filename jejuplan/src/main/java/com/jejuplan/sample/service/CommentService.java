package com.jejuplan.sample.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.sample.domain.CommentVO;
import com.jejuplan.sample.mapper.CommentMapper;

@Service("com.jejuplan.sample.service.CommentService")
public class CommentService {
	@Resource(name="com.jejuplan.sample.mapper.CommentMapper")
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
