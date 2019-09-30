package com.jejuplan.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jejuplan.admin.mapper.DataMngMapper;

@Service("com.jejuplan.admin.service.DataMngService")
public class DataMngService {
	@Resource(name="com.jejuplan.admin.mapper.DataMngMapper")
	DataMngMapper dataMngMapper;
	    
}
