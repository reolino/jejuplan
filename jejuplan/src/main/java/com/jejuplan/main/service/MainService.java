package com.jejuplan.main.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.main.domain.MenuVO;
import com.jejuplan.main.mapper.MainMapper;

@Service("com.jejuplan.main.service.MainService")
public class MainService {
	@Resource(name="com.jejuplan.main.mapper.MainMapper")
    MainMapper mainMapper;
    
	public List<MenuVO> mainMenuList() throws Exception{
		return mainMapper.mainMenuList();
	}
	
	public List<MenuVO> subMenuList() throws Exception{
		return mainMapper.subMenuList();
	}
	    
	public MenuVO firstMenuDetail() throws Exception{
		return mainMapper.firstMenuDetail();
	}
   
}
