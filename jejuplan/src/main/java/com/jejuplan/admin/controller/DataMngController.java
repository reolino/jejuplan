package com.jejuplan.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jejuplan.admin.service.DataMngService;
import com.jejuplan.admin.service.GoodShopService;
import com.jejuplan.common.domain.CommonVO;
import com.jejuplan.common.impl.OpenApiImpl;

/***
 [note] 
  		 Controller for data management.
		 1. Menu to call public data
		 2. Menus related to the batch scheduler
***/
@Controller
public class DataMngController {
	@Resource(name="com.jejuplan.admin.service.DataMngService")
	DataMngService dataMngService;
	
	@Resource(name="com.jejuplan.admin.service.GoodShopService")
	GoodShopService goodShopService;
		
	/***
	  [name]    /data_mng/open_api/view
	  [deatail] Call the open data page.
	***/
	@RequestMapping("/data_mng/open_api/view")
    private String open_api_view(Model model) throws Exception{
        return "/admin/data_mng/open_api_view"; 
    }
	
	/***
	  [name]      /data_mng/open_api/proc
	  [deatail]   Execute open data call with ajax.
	***/
	@RequestMapping(value="/data_mng/open_api/proc", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> open_api_proc(@ModelAttribute CommonVO commonVO, Model model) throws Exception { 
		Map<String, Object> map = new HashMap<String, Object>();
		int res = 0;

        String urlstr = commonVO.getUrl()+"?authApiKey="+commonVO.getKey()+"&"+commonVO.getParam();
		String api = commonVO.getApi();
        JSONObject xmlJsonObj = OpenApiImpl.callOpenApiXMl(urlstr);
		
        res = openApiProcess(api, xmlJsonObj);
		
        if(res > 0) {
			map.put("result", "true");
			map.put("message", "save success");
		}else {
			map.put("result", "false");
			map.put("message", "save fail");
		}
		
		return map; 
	}
	
	/***
	  [class] : openApiProcess
	  [deatail] : Store open data in DB.
	***/
	private int openApiProcess(String api,JSONObject jsonObj) throws Exception{
		int res = 0;
		
		if("getGoodShopList".equals(api)){
			res = goodShopService.goodShopInsert(jsonObj);
    	}
		
		return res;
    }
}
