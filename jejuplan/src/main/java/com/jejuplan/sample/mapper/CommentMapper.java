package com.jejuplan.sample.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.jejuplan.sample.domain.CommentVO;

@Repository("com.jejuplan.sample.mapper.CommentMapper")
public interface CommentMapper {
	
    public int commentCount() throws Exception;
 
    public List<CommentVO> commentList(CommentVO comment) throws Exception;
 
    public int commentInsert(CommentVO comment) throws Exception;
    
    public int commentUpdate(CommentVO comment) throws Exception;
 
    public int commentDelete(int cno) throws Exception;
}
