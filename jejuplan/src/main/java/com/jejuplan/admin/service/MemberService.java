package com.jejuplan.admin.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.jejuplan.admin.domain.MemberVO;
import com.jejuplan.admin.mapper.MemberMapper;

@Service("com.jejuplan.admin.service.MemberService")
public class MemberService {
	@Resource(name="com.jejuplan.admin.mapper.MemberMapper")
	MemberMapper memberMapper;
	
	public int memberCheck(MemberVO memberVO) throws Exception{
        return memberMapper.memberCheck(memberVO);
    }
    
	public int memberInsert(MemberVO memberVO) throws Exception{
        return memberMapper.memberInsert(memberVO);
    }
}
