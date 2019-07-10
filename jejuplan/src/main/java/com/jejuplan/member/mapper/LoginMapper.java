package com.jejuplan.member.mapper;

import org.springframework.stereotype.Repository;
import com.jejuplan.member.domain.MemberVO;

@Repository("com.jejuplan.member.mapper.LoginMapper")
public interface LoginMapper {
	
    public int memberCheck(MemberVO memberVO) throws Exception;
    
    public int memberInsert(MemberVO memberVO) throws Exception;
    
    public MemberVO memberDetail(MemberVO memberVO) throws Exception;
}
