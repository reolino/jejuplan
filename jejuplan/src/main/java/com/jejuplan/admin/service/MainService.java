package com.jejuplan.admin.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jejuplan.admin.domain.MenuVO;
import com.jejuplan.admin.mapper.MainMapper;

@Service("com.jejuplan.admin.service.MainService")
public class MainService {
	@Resource(name="com.jejuplan.admin.mapper.MainMapper")
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
