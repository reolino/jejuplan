package com.jejuplan.admin.service;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.jejuplan.admin.domain.GoodShopVO;
import com.jejuplan.admin.mapper.GoodShopMapper;

@Service("com.jejuplan.admin.service.GoodShopService")
public class GoodShopService {
	
	@Resource(name="com.jejuplan.admin.mapper.GoodShopMapper")
	GoodShopMapper goodShopMapper;
		
    public int goodShopInsert(JSONObject jsonObj) throws Exception{
    
		JSONObject rfcOpenApi =(JSONObject) jsonObj.get("rfcOpenApi");
		JSONObject body =(JSONObject) rfcOpenApi.get("body");
		JSONObject data =(JSONObject) body.get("data");
		Object list = data.get("list");
		JSONArray jsonArray = (JSONArray)list;
		
		GoodShopVO goodShopVO = new GoodShopVO();
		int res = 0;
		
		for(int i=0;i<jsonArray.length();i++){
			JSONObject jObj = (JSONObject)jsonArray.get(i);
			goodShopVO.setData_area(jObj.get("area").toString());
			goodShopVO.setData_sid(jObj.get("dataSid").toString());
			goodShopVO.setData_content(jObj.get("dataContent").toString());
			goodShopVO.setFile_cnt(jObj.get("fileCnt").toString());
			goodShopVO.setHvof_sttus(jObj.get("hvofSttus").toString());
			goodShopVO.setTel_no(jObj.get("telNo").toString());
			goodShopVO.setPosx(jObj.get("posx").toString());
			goodShopVO.setPosy(jObj.get("posy").toString());
			goodShopVO.setInduty(jObj.get("induty").toString());
			goodShopVO.setAppn_prdlst_pc(jObj.get("appnPrdlstPc").toString());
			goodShopVO.setData_title(jObj.get("dataTitle").toString());
			goodShopVO.setAdres(jObj.get("adres").toString());
			goodShopVO.setBsn_time(jObj.get("bsnTime").toString());
			goodShopVO.setReg_date(jObj.get("regDate").toString());
			res = goodShopMapper.goodShopInsert(goodShopVO);
		}

        return res;
    }
    
}
