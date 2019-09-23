package com.jejuplan.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jejuplan.sample.domain.BoardVO;
import com.jejuplan.sample.service.BoardService;
import com.jejuplan.main.service.MainService;

@Controller
@RequestMapping("/sample/board")
public class BoardController {
	@Resource(name = "com.jejuplan.sample.service.BoardService")
	BoardService boardService;

	@Resource(name="com.jejuplan.main.service.MainService")
    MainService mainService;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;

	@RequestMapping("/list/view")
	private String boardListView(Model model) throws Exception {
		return "sample/board/list_view";
	}
	
	@RequestMapping(value="/list/proc", method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> boardList(HttpServletRequest request ,@ModelAttribute BoardVO boardVO, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		int total_cnt = boardService.boardListCount(boardVO);
		map.put("result", "true");
		map.put("total_cnt", total_cnt);
		map.put("list", boardService.boardList(boardVO));
		return map; 
	}

	@RequestMapping("/insert/view")
	private String boardInsertView(Model model) throws Exception {
		model.addAttribute("board_no", boardService.boardNo());
		return "sample/board/insert_view";
	}
	
	@RequestMapping(value="/insert/proc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardInsert(HttpServletRequest request ,@ModelAttribute BoardVO boardVO, @ModelAttribute List<MultipartFile> filelist, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		boardVO.setReg_user_id(session.getAttribute("member_id").toString());
		int res = 0;
		
		res = boardService.boardInsert(boardVO);
		 
		if(res > 0) {
			map.put("result", "true");
			map.put("message", "save success");
		}else {
			map.put("result", "false");
			map.put("message", "save fail");
		}
		
		return map; 
	}
	
	@RequestMapping("/detail/view/{board_no}")
	private String boardDetailView(@PathVariable int board_no, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetail(board_no));
		//model.addAttribute("files", boardService.fileDetail(board_no));
		return "sample/board/detail_view";
	}

	@RequestMapping("/update/view/{bno}")
	private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetail(bno));
		model.addAttribute("title", "Update View");
		return "sample/board/update_view";
	}

	@RequestMapping(value="/update/proc", method=RequestMethod.POST)
	@ResponseBody
	private Map<String, Object> boardUpdate(HttpServletRequest request, @ModelAttribute BoardVO boardVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		boardVO.setMod_user_id(session.getAttribute("member_id").toString());
		int res = 0;
		res = boardService.boardUpdate(boardVO);

		if(res > 0) {
			map.put("result", "true");
			map.put("message", "save success");
		}else {
			map.put("result", "false");
			map.put("message", "save fail");
		}
		
		return map; 
	}

	@RequestMapping("/delete/proc")
	@ResponseBody
	private Map<String, Object> boardDelete(HttpServletRequest request, @ModelAttribute BoardVO boardVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		boardVO.setMod_user_id(session.getAttribute("member_id").toString());
		int res = 0;
		res = boardService.boardDelete(boardVO);
		
		if(res > 0) {
			map.put("result", "true");
			map.put("message", "delete success");
		}else {
			map.put("result", "false");
			map.put("message", "delete fail");
		}
		
		return map; 
	}

}
