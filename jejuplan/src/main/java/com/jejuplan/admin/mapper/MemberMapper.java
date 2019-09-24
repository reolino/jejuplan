package com.jejuplan.admin.mapper;

import org.springframework.stereotype.Repository;

import com.jejuplan.admin.domain.MemberVO;

@Repository("com.jejuplan.admin.mapper.MemberMapper")
public interface MemberMapper {

    public int memberCheck(MemberVO memberVO) throws Exception;
    
    public int memberInsert(MemberVO memberVO) throws Exception;
}
