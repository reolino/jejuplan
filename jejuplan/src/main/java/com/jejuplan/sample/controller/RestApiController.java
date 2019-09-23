package com.jejuplan.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sample")
public class RestApiController {
	
	@RequestMapping("/rest_api/view")
	private String restView(Model model) throws Exception {
		model.addAttribute("title", "Rest View");
		return "sample/rest_api/rest_api_view";
	}
}
