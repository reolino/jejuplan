package com.jejuplan.common.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;

public class OpenApiImpl {
	
	public static JSONObject callOpenApiXMl(String requestUrl) throws Exception {    	
		BufferedReader br = null;
		JSONObject xmlJSONObj = null;
		
        try{
            URL url = new URL(requestUrl);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String result = "";
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            
            xmlJSONObj = XML.toJSONObject(result);

        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return xmlJSONObj;
	}
}
