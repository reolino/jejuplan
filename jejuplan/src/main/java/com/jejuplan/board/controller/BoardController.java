package com.jejuplan.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.jejuplan.Util.FileUtil;
import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.domain.FileVO;
import com.jejuplan.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name="com.jejuplan.board.service.BoardService")
    BoardService boardService;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;
	
    @RequestMapping("/list_view")
    private String boardListView(Model model) throws Exception{
        model.addAttribute("list", boardService.boardListService());
        return "board/list_view"; 
    }
    
    @RequestMapping("insert_view")
    private String boardInsertView(){
        return "board/insert_view";
    }
    
    @RequestMapping("/insert")
    private String  boardInsert(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
    	BoardVO boardVO = new BoardVO();
    	FileVO  fileVO  = new FileVO();

    	boardVO.setSubject(request.getParameter("subject"));
    	boardVO.setContent(request.getParameter("content"));
    	boardVO.setWriter(request.getParameter("writer"));
    	boardVO.setMenuid(request.getParameter("menuid"));
    	
        if(files.isEmpty()){
            boardService.boardInsertService(boardVO); 
        }
        else{
        	
            boardService.boardInsertService(boardVO); 
            String desUploadFileDir = uploadFileDir+request.getParameter("menuid")+"/";

            fileVO = FileUtil.fileUpload(files,fileVO, desUploadFileDir);
            fileVO.setBno(boardVO.getBno());
            boardService.fileInsertService(fileVO); 
        }
     
        return  "redirect:/board/list_view";
    }
    
    @RequestMapping("/detail/{bno}") 
    private String boardDetailView(@PathVariable int bno, Model model) throws Exception{
    	model.addAttribute("detail", boardService.boardDetailService(bno));
        model.addAttribute("files", boardService.fileDetailService(bno)); 
        return "board/detail_view";
    }
    
    @RequestMapping("/update/{bno}")
    private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{
        model.addAttribute("detail", boardService.boardDetailService(bno));
        return "board/update_view";
    }
    
    @RequestMapping("/update")
    private String boardUpdate(HttpServletRequest request) throws Exception{
    	 BoardVO boardVO = new BoardVO();
    	 boardVO.setSubject(request.getParameter("subject"));
    	 boardVO.setContent(request.getParameter("content"));
    	 boardVO.setBno(Integer.parseInt(request.getParameter("bno")));
         
         boardService.boardUpdateService(boardVO);
         return "redirect:/board/detail/"+request.getParameter("bno"); 
    }
 
    @RequestMapping("/delete/{bno}")
    private String boardDelete(@PathVariable int bno) throws Exception{
    	boardService.boardDeleteService(bno);
        return "redirect:/board/list_view";
    }
    
    @RequestMapping("/fileDown/{bno}")
    private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
        FileVO fileVO = boardService.fileDetailService(bno);
        FileUtil.fileDownload(fileVO, request, response);
    }
    
    @RequestMapping("/test") 
    private String test() throws Exception{
        return "test";
    }
}
