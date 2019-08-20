package com.jejuplan.main.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.jejuplan.main.domain.MenuVO;

@Repository("com.jejuplan.main.mapper.MainMapper")
public interface MainMapper {
	public List<MenuVO> mainMenuList() throws Exception;
	
	public List<MenuVO> subMenuList() throws Exception;
	
    public MenuVO firstMenuDetail() throws Exception;
}
