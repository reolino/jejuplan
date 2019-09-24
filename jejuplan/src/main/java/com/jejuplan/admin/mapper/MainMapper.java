package com.jejuplan.admin.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.jejuplan.admin.domain.MenuVO;

@Repository("com.jejuplan.admin.mapper.MainMapper")
public interface MainMapper {
	public List<MenuVO> mainMenuList() throws Exception;
	
	public List<MenuVO> subMenuList() throws Exception;
	
    public MenuVO firstMenuDetail() throws Exception;
}
