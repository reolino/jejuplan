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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jejuplan.Util.CryptUtil;
import com.jejuplan.member.domain.MemberVO;
import com.jejuplan.member.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({"member_id", "member_auth", "member_auth_nm"})
public class LoginController {
	@Resource(name="com.jejuplan.member.service.LoginService")
    LoginService LoginService;
	
	@RequestMapping("/")
    private String index(Model model) throws Exception{
		log.debug( "Springboot Start" );
        return "index"; 
    }
	
	@RequestMapping("/login/view")
    private String login_view(Model model) throws Exception{
        return "login_view"; 
    }
	
	@RequestMapping(value="/member/login/proc", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> loginProc(@ModelAttribute MemberVO memberVo, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO resultVo  = LoginService.memberDetail(memberVo); 
			
		if(resultVo != null) {
			String userPw =  CryptUtil.decrypt(resultVo.getMember_pw());
			String paramPw = memberVo.getMember_pw();
			
			if(paramPw.equals(userPw)) {
				model.addAttribute("member_id", resultVo.getMember_id());
		        model.addAttribute("member_auth", resultVo.getMember_auth()); 
		        model.addAttribute("member_auth_nm", resultVo.getMember_auth_nm()); 
		        model.addAttribute("className", this.getClass());

	    		map.put("result", "true");
			}else {
				map.put("result", "false");
	        	map.put("message", "Passwords do not match");
			}
		}else {
	        map.put("result", "false");
	        map.put("message", "User does not exist");
		}
		
		return map; 
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
			String encryptPwd = CryptUtil.encrypt(memberVo.getMember_pw());
			memberVo.setMember_pw(encryptPwd);
			LoginService.memberInsert(memberVo); 
	        map.put("result", "true");
	        map.put("message", "Regist Ok!");
		}
		
		return map; 
	}
}
