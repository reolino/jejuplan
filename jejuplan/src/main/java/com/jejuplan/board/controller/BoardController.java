package com.jejuplan.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jejuplan.Util.CryptUtil;
import com.jejuplan.Util.FileUtil;
import com.jejuplan.Util.GridUtil;
import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.board.domain.FileVO;
import com.jejuplan.board.service.BoardService;
import com.jejuplan.main.service.MainService;
import com.jejuplan.member.domain.MemberVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name = "com.jejuplan.board.service.BoardService")
	BoardService boardService;

	@Resource(name="com.jejuplan.main.service.MainService")
    MainService mainService;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;

	@RequestMapping("/list/view")
	private String boardListView(Model model) throws Exception {
		return "board/list_view";
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
	private String boardInsertView(Model model) {
		return "board/insert_view";
	}
	
	@RequestMapping(value="/insert/proc", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardInsert(HttpServletRequest request ,@ModelAttribute BoardVO boardVO, Model model) throws Exception { 
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
	
	/*
	 * @RequestMapping("/insert/proc") private String boardInsert(HttpServletRequest
	 * request, @RequestPart MultipartFile files ,Model model) throws Exception{
	 * BoardVO boardVO = new BoardVO(); FileVO fileVO = new FileVO();
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * boardVO.setTitle(request.getParameter("title"));
	 * boardVO.setContent(request.getParameter("content"));
	 * boardVO.setMenu_id(request.getParameter("menuid"));
	 * boardVO.setReg_user_id(session.getAttribute("member_id").toString());
	 * 
	 * boardService.boardInsert(boardVO);
	 * 
	 * if(files.isEmpty()){ boardService.boardInsert(boardVO); } else{
	 * boardService.boardInsert(boardVO); String desUploadFileDir =
	 * uploadFileDir+request.getParameter("menuid")+"/";
	 * 
	 * fileVO = FileUtil.fileUpload(files,fileVO, desUploadFileDir);
	 * //fileVO.setBno(boardVO.getBno()); boardService.fileInsert(fileVO); }
	 * 
	 * 
	 * return ""; }
	 */

	@RequestMapping("/detail/view/{board_no}")
	private String boardDetailView(@PathVariable int board_no, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetail(board_no));
		//model.addAttribute("files", boardService.fileDetail(board_no));
		return "board/detail_view";
	}

	@RequestMapping("/update/view/{bno}")
	private String boardUpdateForm(@PathVariable int bno, Model model) throws Exception {
		model.addAttribute("detail", boardService.boardDetail(bno));
		model.addAttribute("title", "Update View");
		return "board/update_view";
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

	/*
	@RequestMapping("/fileDown/proc/{bno}")
	private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		FileVO fileVO = boardService.fileDetail(bno);
		FileUtil.fileDownload(fileVO, request, response);
	}
	*/

	@RequestMapping("/rest/view")
	private String restView(Model model) throws Exception {
		model.addAttribute("title", "Rest View");
		return "board/rest_view";
	}
}
