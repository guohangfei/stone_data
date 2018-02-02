package com.wskj.app.util.other;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.junit.Test;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;   

public class GetIP {
	 public static String getIpAddr(HttpServletRequest request) {  
         String ip = request.getHeader("X-Forwarded-For");  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("Proxy-Client-IP");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("WL-Proxy-Client-IP");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("HTTP_CLIENT_IP");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getRemoteAddr();  
         }  
         return ip;  
     }  
	 
	 /**
	  * 根据ip获得位置
	 * @throws IOException 
	  */
	 public static String getLocationByIp() throws UnsupportedEncodingException { 
	        String res = "";   
	        try {   
	            URL url = new URL("http://ip.taobao.com//service/getIpInfo.php?ip=117.136.2.17");  
	            java.net.HttpURLConnection conn = (java.net.HttpURLConnection)url.openConnection();  
	            conn.setDoOutput(true);  
	            conn.setRequestMethod("POST");  
	            conn.setConnectTimeout(500);
	            conn.setReadTimeout(500);
	            java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream(),"UTF-8"));  
	            String line;  
	            while ((line = in.readLine()) != null) {  
	                res += line;  
	            }  
	            in.close();  
	        } catch (Exception e) { 
	        	res="{\"code\":0,\"data\":{\"country\":\"\u4e2d\u56fd\",\"country_id\":\"CN\",\"area\":\"\u534e\u5317\",\"area_id\":\"100000\",\"region\":\"\u6cb3\u5317\u7701\",\"region_id\":\"130000\",\"city\":\"\u77f3\u5bb6\u5e84\u5e02\",\"city_id\":\"130100\",\"county\":\"\",\"county_id\":\"-1\",\"isp\":\"\u79fb\u52a8\",\"isp_id\":\"100025\",\"ip\":\"117.136.2.17\"}}";
	            System.out.println("链接淘宝ip地址库超时");
	        }  
	      //创建一个Gson对象
	        Gson gson = new Gson();  
	        java.lang.reflect.Type type = new TypeToken<JsonBean>() {}.getType();  
	        JsonBean jsonBean = gson.fromJson(res, type);
	        String region = jsonBean.getData().get("region").toString();
	        String city = jsonBean.getData().get("city").toString();
	        region=region.replace("省","").trim();
	        city=city.replace("市","").trim();
//	        System.out.println(region+"&"+city);
	        return region+"&"+city;
	    }
	 
}
