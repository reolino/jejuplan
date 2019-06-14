package com.jejuplan.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.service.BoardService;

@Controller
public class BoardController {
	@Resource(name="com.jejuplan.board.service.BoardService")
    BoardService mBoardService;
	
    @RequestMapping("/board/list_view")
    private String boardListView(Model model) throws Exception{
        model.addAttribute("list", mBoardService.boardListService());
        return "board/list_view"; 
    }
    
    @RequestMapping("/board/insert_view")
    private String boardInsertView(){
        return "board/insert_view";
    }
    
    @RequestMapping("/board/insert")
    private String  boardInsert(HttpServletRequest request) throws Exception{
    	BoardVO board = new BoardVO();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));

        mBoardService.boardInsertService(board);
        return  "redirect:/board/list_view";
    }
    
    @RequestMapping("/board/detail/{bno}") 
    private String boardDetailView(@PathVariable int bno, Model model) throws Exception{
    	model.addAttribute("detail", mBoardService.boardDetailService(bno));
        return "board/detail_view";
    }
    
    @RequestMapping("/board/update/{bno}")
    private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{
        model.addAttribute("detail", mBoardService.boardDetailService(bno));
        return "board/update_view";
    }
    
    @RequestMapping("/board/update")
    private String boardUpdate(HttpServletRequest request) throws Exception{
    	 BoardVO board = new BoardVO();
         board.setSubject(request.getParameter("subject"));
         board.setContent(request.getParameter("content"));
         board.setBno(Integer.parseInt(request.getParameter("bno")));
         
         mBoardService.boardUpdateService(board);
         return "redirect:/board/detail/"+request.getParameter("bno"); 
    }
 
    @RequestMapping("/board/delete/{bno}")
    private String boardDelete(@PathVariable int bno) throws Exception{
        mBoardService.boardDeleteService(bno);
        return "redirect:/board/list_view";
    }
}
