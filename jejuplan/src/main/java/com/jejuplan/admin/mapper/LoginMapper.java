package com.jejuplan.admin.mapper;

import org.springframework.stereotype.Repository;
import com.jejuplan.admin.domain.MemberVO;

@Repository("com.jejuplan.admin.mapper.LoginMapper")
public interface LoginMapper {
	
    public MemberVO memberDetail(MemberVO memberVO) throws Exception;
}
