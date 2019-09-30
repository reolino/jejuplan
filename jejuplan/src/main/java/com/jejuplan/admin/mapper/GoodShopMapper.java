package com.jejuplan.admin.mapper;

import org.springframework.stereotype.Repository;

import com.jejuplan.admin.domain.GoodShopVO;

@Repository("com.jejuplan.admin.mapper.GoodShopMapper")
public interface GoodShopMapper {
    
    public int goodShopInsert(GoodShopVO goodShopVO) throws Exception;
}
