package com.jejuplan.sample.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.common.domain.CommonVO;
import com.jejuplan.common.impl.OpenApiImpl;

@Controller
@RequestMapping("/sample")
public class OpenApiController {
	
	@RequestMapping("/open_api/view")
	private String OpenApiView(Model model) throws Exception {
		model.addAttribute("title", "Rest View");
		return "sample/open_api/open_api_view";
	}
	
	@RequestMapping(value="/open_api/proc", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> loginProc(@ModelAttribute CommonVO commonVO, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();

        String urlstr = commonVO.getUrl()+"?authApiKey="+commonVO.getKey();
		JSONObject xmlJsonObj = OpenApiImpl.callOpenApiXMl(urlstr);
		String jsonObj = xmlJsonObj.toString();
		//JSONObject rfcOpenApi =(JSONObject) xmlJSONObj.get("rfcOpenApi");
		map.put("str", jsonObj);

		return map; 
	}
	
}
