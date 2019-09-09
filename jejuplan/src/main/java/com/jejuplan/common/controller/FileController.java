package com.jejuplan.common.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jejuplan.Util.FileUtil;
import com.jejuplan.common.domain.FileVO;
import com.jejuplan.common.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {
	
	@Resource(name = "com.jejuplan.common.service.FileService")
	FileService fileService;
	
	@Value("${file.upload.directory}")
	String uploadFileDir;
		
	@RequestMapping(value="/upload/proc", method=RequestMethod.POST)
	@ResponseBody
	private Map<String, Object> fileUpload(HttpServletRequest request,@ModelAttribute FileVO fileVO, @ModelAttribute List<MultipartFile> filelist,Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		fileVO.setReg_user_id(session.getAttribute("member_id").toString());

		if(filelist.size() != 0) {
			for(int i = 0;i<filelist.size();i++) {
				MultipartFile file = filelist.get(i);
				String desUploadFileDir = uploadFileDir+fileVO.getMenu_id()+"/";
				fileVO = FileUtil.fileUpload(file,fileVO, desUploadFileDir); 
				fileService.fileInsert(fileVO);
			}
		}
		
		map.put("result", "true");
		return map; 
	}
	
	@RequestMapping(value="/list/proc", method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> fileList(HttpServletRequest request ,@ModelAttribute FileVO fileVO, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "true");
		map.put("list", fileService.fileList(fileVO));
		return map; 
	}
	
	@RequestMapping("/down/proc/{file_no}")
	private void fileDown(@PathVariable int file_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		FileVO fileVO = fileService.fileDetail(file_no);
		FileUtil.fileDownload(fileVO, request, response);
	}
	
	@RequestMapping("/del/proc")
	@ResponseBody
	private Map<String, Object> fileDel(HttpServletRequest request ,@ModelAttribute FileVO fileVO, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int result = 0;
		int file_no = fileVO.getFile_no();
		fileVO = fileService.fileDetail(file_no);
		FileUtil.fileDelete(fileVO);
		result = fileService.fileDelete(fileVO);
		
		if(result > 0) {
			map.put("result", "true");
			map.put("message", "delete success");
		}else {
			map.put("result", "false");
			map.put("message", "delete fail");
		}
		
		return map; 
	}
}
