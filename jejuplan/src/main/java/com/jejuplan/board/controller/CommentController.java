package com.jejuplan.board.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.domain.CommentVO;
import com.jejuplan.board.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Resource(name="com.jejuplan.board.service.CommentService")
	CommentService commentService;
	
	@RequestMapping(value="/list/proc", method=RequestMethod.POST)
    @ResponseBody
    private List<CommentVO> commentList(@ModelAttribute CommentVO commentVO, Model model) throws Exception{
	    return commentService.commentList(commentVO);
    }
    
    @RequestMapping("/insert/proc") 
    @ResponseBody
    private int commentInsert(HttpServletRequest request, @ModelAttribute CommentVO commentVO, @RequestParam int board_no, @RequestParam String content) throws Exception{
    	HttpSession session = request.getSession();
    	commentVO.setReg_user_id(session.getAttribute("member_id").toString());
        return commentService.commentInsert(commentVO);
    }
    
    @RequestMapping("/update/proc") 
    @ResponseBody
    private int commentUpdate(@ModelAttribute CommentVO commentVO) throws Exception{
        return commentService.commentUpdate(commentVO);
    }
    
    @RequestMapping("/delete/proc/{comment_no}")
    @ResponseBody
    private int commentDelete(@PathVariable int comment_no) throws Exception{
        return commentService.commentDelete(comment_no);
    }
}
