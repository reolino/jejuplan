package com.jejuplan.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.admin.domain.MemberVO;
import com.jejuplan.admin.service.MemberService;
import com.jejuplan.common.impl.CryptImpl;

@Controller
public class MemberController{
	@Resource(name="com.jejuplan.admin.service.MemberService")
    MemberService memberService;
	
	@RequestMapping("/member/register/view")
    private String register_view(Model model) throws Exception{
        return "/admin/register_view"; 
    }
	
	@RequestMapping(value="/member/register/proc", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> registerProc(@ModelAttribute MemberVO memberVo) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		int checkCnt = memberService.memberCheck(memberVo); 
		
		if(checkCnt> 0) {
    		map.put("result", "false");
        	map.put("message", "ID exists");
		}else {
			String encryptPwd = CryptImpl.encrypt(memberVo.getMember_pw());
			memberVo.setMember_pw(encryptPwd);
			memberService.memberInsert(memberVo); 
	        map.put("result", "true");
	        map.put("message", "Regist Ok!");
		}
		
		return map; 
	}
}
