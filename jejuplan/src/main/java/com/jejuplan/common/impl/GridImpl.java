package com.jejuplan.common.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GridImpl {
	public static JSONObject getGridListJson(List list, int current_page, int total_cnt) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jo1 = new JSONObject();
		JSONObject jo2 = new JSONObject();
		JSONObject jo3 = new JSONObject();
		
		jo1.put("result" , true);
		jo2.put("contents", jsonArray.fromObject(list));
		jo3.put("page" , current_page);
		jo3.put("totalCount" , total_cnt);
		jo2.put("pagination", jo3);
		jo1.put("data" , jo2);
		
		return jo1;
	}
}
