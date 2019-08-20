package com.jejuplan.sample.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.Util.CryptUtil;

@Controller
@RequestMapping("/sample")
public class SampleController {
		
	@RequestMapping("/decrypt/view")
    private String index(Model model) throws Exception{
        return "/sample/decrypt_view"; 
    }
	
	@RequestMapping(value="/encrypt/proc", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> cryptProc(HttpServletRequest request, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		String p_txt = request.getParameter("p_txt");
		String encrypt_txt =  CryptUtil.encrypt(p_txt);
		
		if(encrypt_txt != null) {
    		map.put("result", "true");
        	map.put("message", "encrypt success");
    		map.put("encrypt_txt", encrypt_txt);
		}else {
	        map.put("result", "false");
	        map.put("message", "encrypt fail");
		}
		
		return map; 
	}
	
	@RequestMapping(value="/decrypt/proc", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> decryptProc(HttpServletRequest request, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		String p_txt = request.getParameter("p_txt");
		String decrypt_txt =  CryptUtil.decrypt(p_txt);
		
		if(decrypt_txt != null) {
    		map.put("result", "true");
        	map.put("message", "decrypt success");
    		map.put("decrypt_txt", decrypt_txt);
		}else {
	        map.put("result", "false");
	        map.put("message", "decrypt fail");
		}
		
		return map; 
	}
}
