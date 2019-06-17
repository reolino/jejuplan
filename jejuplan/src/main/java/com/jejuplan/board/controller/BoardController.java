package com.jejuplan.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.domain.FileVO;
import com.jejuplan.board.service.BoardService;

@Controller
public class BoardController {
	@Resource(name="com.jejuplan.board.service.BoardService")
    BoardService boardService;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;
	
    @RequestMapping("/board/list_view")
    private String boardListView(Model model) throws Exception{
        model.addAttribute("list", boardService.boardListService());
        return "board/list_view"; 
    }
    
    @RequestMapping("/board/insert_view")
    private String boardInsertView(){
        return "board/insert_view";
    }
    
    @RequestMapping("/board/insert")
    private String  boardInsert(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
    	BoardVO board = new BoardVO();
    	FileVO  file  = new FileVO();
    	
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        
        if(files.isEmpty()){
            boardService.boardInsertService(board); 
        }
        else{
            String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(uploadFileDir+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            
            boardService.boardInsertService(board); 
            
            file.setBno(board.getBno());
            file.setFileName(destinationFileName);
            file.setFileOriName(fileName);
            file.setFileUrl(uploadFileDir);
            
            boardService.fileInsertService(file); 
        }
     
        return  "redirect:/board/list_view";
    }
    
    @RequestMapping("/board/detail/{bno}") 
    private String boardDetailView(@PathVariable int bno, Model model) throws Exception{
    	model.addAttribute("detail", boardService.boardDetailService(bno));
        model.addAttribute("files", boardService.fileDetailService(bno)); 
        return "board/detail_view";
    }
    
    @RequestMapping("/board/update/{bno}")
    private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{
        model.addAttribute("detail", boardService.boardDetailService(bno));
        return "board/update_view";
    }
    
    @RequestMapping("/board/update")
    private String boardUpdate(HttpServletRequest request) throws Exception{
    	 BoardVO board = new BoardVO();
         board.setSubject(request.getParameter("subject"));
         board.setContent(request.getParameter("content"));
         board.setBno(Integer.parseInt(request.getParameter("bno")));
         
         boardService.boardUpdateService(board);
         return "redirect:/board/detail/"+request.getParameter("bno"); 
    }
 
    @RequestMapping("/board/delete/{bno}")
    private String boardDelete(@PathVariable int bno) throws Exception{
    	boardService.boardDeleteService(bno);
        return "redirect:/board/list_view";
    }
    
    @RequestMapping("/board/fileDown/{bno}")
    private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
    	request.setCharacterEncoding("UTF-8");
        FileVO fileVO = boardService.fileDetailService(bno);
        
        try{
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();
            
            String oriFileName = fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
    }
    
    @RequestMapping("/test") 
    private String test() throws Exception{
        return "test";
    }
}
