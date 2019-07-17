package com.jejuplan.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.board.domain.CommentVO;
import com.jejuplan.board.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Resource(name="com.jejuplan.board.service.CommentService")
	CommentService commentService;
	
	@RequestMapping("/list/proc") 
    @ResponseBody
    private List<CommentVO> commentList(@RequestParam int bno, Model model) throws Exception{
		CommentVO comment = new CommentVO();
		comment.setBno(bno);
	    return commentService.commentList(comment);
    }
    
    @RequestMapping("/insert/proc") 
    @ResponseBody
    private int commentInsert(@RequestParam int bno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setBno(bno);
        comment.setContent(content);
        comment.setWriter("test");  
        
        return commentService.commentInsert(comment);
    }
    
    @RequestMapping("/update/proc") 
    @ResponseBody
    private int commentUpdate(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return commentService.commentUpdate(comment);
    }
    
    @RequestMapping("/delete/proc/{cno}")
    @ResponseBody
    private int commentDelete(@PathVariable int cno) throws Exception{
        
        return commentService.commentDelete(cno);
    }


    
}
