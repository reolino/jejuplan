package com.jejuplan.member.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.member.domain.MemberVO;
import com.jejuplan.member.mapper.LoginMapper;

@Service("com.jejuplan.member.service.LoginService")
public class LoginService {
	@Resource(name="com.jejuplan.member.mapper.LoginMapper")
	LoginMapper loginMapper;
	
	public int memberCheck(MemberVO memberVO) throws Exception{
        return loginMapper.memberCheck(memberVO);
    }
    
	public int memberInsert(MemberVO memberVO) throws Exception{
        return loginMapper.memberInsert(memberVO);
    }
	
    public MemberVO memberDetail(MemberVO memberVO) throws Exception{
        return loginMapper.memberDetail(memberVO);
    }
}
