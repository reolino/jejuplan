package com.jejuplan.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class CommonController{
 
	@RequestMapping("/")
    private String index(Model model) throws Exception{
        return "index"; 
    }
}
