package com.jejuplan.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.member.domain.MemberVO;
import com.jejuplan.member.service.LoginService;

@Controller
public class LoginController {
	@Resource(name="com.jejuplan.member.service.LoginService")
    LoginService LoginService;
	
	@RequestMapping("/")
    private String index(Model model) throws Exception{
        return "index"; 
    }
	
	@RequestMapping("/login/view")
    private String login_view(Model model) throws Exception{
        return "/login_view"; 
    }
	
	@RequestMapping("/member/register/view")
    private String register_view(Model model) throws Exception{
        return "/member/register_view"; 
    }
	
	@RequestMapping(value="/member/register/proc", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> registerProc(@ModelAttribute MemberVO memberVo) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();

		int checkCnt = LoginService.memberCheck(memberVo); 

		if(checkCnt> 0) {
    		map.put("result", "false");
        	map.put("message", "ID exists");
		}else {
			LoginService.memberInsert(memberVo); 
	        map.put("result", "true");
	        map.put("message", "Resist Ok!");
		}
		
		return map; 
	}
}
