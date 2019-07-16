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
	
    @RequestMapping("/list/view")
    private String boardListView(Model model) throws Exception{
        model.addAttribute("list", boardService.boardList());
        return "board/list_view"; 
    }
    
    @RequestMapping("/insert/view")
    private String boardInsertView(){
        return "board/insert_view";
    }
    
    @RequestMapping("/insert/proc")
    private String  boardInsert(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
    	BoardVO boardVO = new BoardVO();
    	FileVO  fileVO  = new FileVO();

    	boardVO.setSubject(request.getParameter("subject"));
    	boardVO.setContent(request.getParameter("content"));
    	boardVO.setWriter(request.getParameter("writer"));
    	boardVO.setMenuid(request.getParameter("menuid"));
    	
        if(files.isEmpty()){
            boardService.boardInsert(boardVO); 
        }
        else{
            boardService.boardInsert(boardVO); 
            String desUploadFileDir = uploadFileDir+request.getParameter("menuid")+"/";

            fileVO = FileUtil.fileUpload(files,fileVO, desUploadFileDir);
            fileVO.setBno(boardVO.getBno());
            boardService.fileInsert(fileVO); 
        }
     
        return  "redirect:/board/list/view";
    }
    
    @RequestMapping("/detail/view/{bno}") 
    private String boardDetailView(@PathVariable int bno, Model model) throws Exception{
    	model.addAttribute("detail", boardService.boardDetail(bno));
        model.addAttribute("files", boardService.fileDetail(bno)); 
        return "board/detail_view";
    }
    
    @RequestMapping("/update/view/{bno}")
    private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{
        model.addAttribute("detail", boardService.boardDetail(bno));
        return "board/update_view";
    }
    
    @RequestMapping("/update/proc")
    private String boardUpdate(HttpServletRequest request) throws Exception{
    	 BoardVO boardVO = new BoardVO();
    	 boardVO.setSubject(request.getParameter("subject"));
    	 boardVO.setContent(request.getParameter("content"));
    	 boardVO.setBno(Integer.parseInt(request.getParameter("bno")));
         
         boardService.boardUpdate(boardVO);
         return "redirect:/board/detail/view/"+request.getParameter("bno"); 
    }
 
    @RequestMapping("/delete/proc/{bno}")
    private String boardDelete(@PathVariable int bno) throws Exception{
    	boardService.boardDelete(bno);
        return "redirect:/board/list/view";
    }
    
    @RequestMapping("/fileDown/proc/{bno}")
    private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	request.setCharacterEncoding("UTF-8");
        FileVO fileVO = boardService.fileDetail(bno);
        FileUtil.fileDownload(fileVO, request, response);
    }
    
    @RequestMapping("/rest/view") 
    private String test() throws Exception{
        return "board/rest_view";
    }
}
