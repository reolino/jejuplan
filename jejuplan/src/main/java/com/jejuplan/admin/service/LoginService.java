package com.jejuplan.admin.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.jejuplan.admin.domain.MemberVO;
import com.jejuplan.admin.mapper.LoginMapper;

@Service("com.jejuplan.admin.service.LoginService")
public class LoginService {
	@Resource(name="com.jejuplan.admin.mapper.LoginMapper")
	LoginMapper loginMapper;
	
    public MemberVO memberDetail(MemberVO memberVO) throws Exception{
        return loginMapper.memberDetail(memberVO);
    }
}
