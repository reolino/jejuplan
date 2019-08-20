package com.jejuplan.main.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jejuplan.main.service.MainService;

import net.sf.json.JSONArray;

@Controller
public class MainController{
	@Resource(name="com.jejuplan.main.service.MainService")
    MainService mainService;
	
	@RequestMapping("/main/view")
    private String main_view(Model model) throws Exception{
		JSONArray jsonArray = new JSONArray();
        model.addAttribute("main_menu_list", jsonArray.fromObject(mainService.mainMenuList()));
        model.addAttribute("sub_menu_list", jsonArray.fromObject(mainService.subMenuList()));
        model.addAttribute("first_menu", mainService.firstMenuDetail());
		return "main_view"; 
    }	
}
