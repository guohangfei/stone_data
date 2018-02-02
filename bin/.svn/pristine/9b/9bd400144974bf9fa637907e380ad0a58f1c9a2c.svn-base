package com.wskj.app.jsoup;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.wskj.app.service.WeatherService;
@Component
public class WeatherJsoup {

	@Autowired
	private WeatherService weatherService;
	
	public Integer cishu=0;
	
	/** 
	 *插入省市区份（每年的1月1号 23点59分58秒更新） 
	 */
	@Scheduled(cron = "58 59 23 1 1 ?")
	public void addDistrict(){
		//需 省 市 区 日期 最高温度 最低温度 风力 天气详情 湿度 空气质量
		//删除原有的省市区区域
		weatherService.delAllDistrict();
		weatherService.delAllCity();
		weatherService.delAllProvince();
		
		Document doc;
		try {
			//获得各省的省份
			doc = Jsoup.connect("http://www.weather.com.cn/province/").timeout(600000).get();
			Elements eles = doc.select(".sheng_rukou li a");
			String province_weather_url=null;
			String province_name=null;
			Document pdoc=null;
			
			
			
			//循环获得各个省份的名称和超链接
			for (Element element : eles) {
				province_weather_url=element.absUrl("href");
				province_name=element.text();
				
				//新增省份方法
				weatherService.addProvince(province_name);
				//获得省份的noid
				Integer proNoid = weatherService.getNoidByProvinceName(province_name);
				
				//根据省份或直辖市的url获得url中的内容
				pdoc = Jsoup.connect(province_weather_url).get();
				
				
				//直辖市的区域
				if(province_name.equals("北京")||province_name.equals("上海")||province_name.equals("天津")||province_name.equals("重庆")){
					//获得直辖市区域名称及url内容
					Elements dise = pdoc.select(".navbox span a");
					String dis_weather_url=null;
					String dis_name=null;
					for (Element dis_element : dise) {
						dis_weather_url=dis_element.absUrl("href");
						if(!dis_element.text().contains("气象局")){
							dis_name=dis_element.text();
						}
						weatherService.addCity(dis_name,proNoid);
					}
						
				}//直辖市判断
				
				
				
				//香港、台湾的城市区域，
				if(province_name.equals("香港")||province_name.equals("台湾")){
					Elements txcitye = pdoc.select(".around_weather dd a");
					for (Element cityelement : txcitye) {
						String city_weather_url=cityelement.absUrl("href");
						String city_name=cityelement.text();
						//新增城市方法
						weatherService.addCity(city_name,proNoid);
					}
				}
				
				
				
				//省份的天气情况
				if(!province_name.equals("浙江")&&!province_name.equals("北京")&&!province_name.equals("上海")&&!province_name.equals("天津")&&!province_name.equals("重庆")&&!province_name.equals("澳门")){
					String city_weather_url=null;
					if(province_name.equals("安徽")){
						pdoc = Jsoup.connect("http://www.weather.com.cn/anhui/index.shtml").timeout(600000).get();
					}else{
						try {
							pdoc = Jsoup.connect(province_weather_url).timeout(600000).get();
						} catch (Exception e) {
							continue;
						}
					}
					//根据省份的url获得城市的url及名称
					Elements citye = pdoc.select(".navbox span a");
						for (Element cityelement : citye) {
							//获得城市名称
							city_weather_url=cityelement.absUrl("href");
							String city_name=null;
							if(!cityelement.text().contains("气象局")){
								city_name=cityelement.text();
							}else{
								continue;
							}
							weatherService.addCity(city_name,proNoid);
							//获得城市的noid
							Integer cityNoid = weatherService.getNoidByCityName(city_name,proNoid);
							//根据城市的url获得区县的名称及url
							Document dise = Jsoup.connect(city_weather_url).get();
							Elements disel = dise.select(".navbox span a");
							
							for (Element diselement :disel) {
								//获得区县名称
								String dis_name=diselement.text();
								if(!dis_name.contains("气象局")){
									weatherService.addDis(dis_name,cityNoid,proNoid);
								}
							}//地区循环
						}//城市循环
						
				}//省份判断
				
				
				//浙江省天气从http://tianqi.2345.com/zhejiang_dz/42.htm 抓取
				if(province_name.equals("浙江")){
					String city_name=null;
					String city_weather_url=null;
					
					pdoc = Jsoup.connect("http://tianqi.2345.com/zhejiang_dz/42.htm").get();
					//根据省份的url获得城市的url及名称
					Elements citye = pdoc.select(".citychk dl");
						for (Element cityelement : citye) {
							//获得城市名称
							String city_name_l=cityelement.select("dt a").text();
							city_name=city_name_l.replace("天气","");
							//根据城市的url获得区县的名称及url
							weatherService.addCity(city_name,proNoid);
							//获得城市的noid
							Integer cityNoid = weatherService.getNoidByCityName(city_name,proNoid);
							Elements disel = cityelement.select("dd a");
							for (Element diselement :disel) {
								//获得区县名称
								String dis_name_l=diselement.text();
								String dis_name="城区";
								if(!dis_name_l.equals(city_name)){
									dis_name=dis_name_l;
								}
								weatherService.addDis(dis_name,cityNoid,proNoid);	
							}//地区循环
						}//城市循环
						
				}//省份判断
				
				
				
				//澳门的天气情况(只有当天数据)
				if(province_name.equals("澳门")){
					Elements omcitye = pdoc.select(".weatherTable tbody tr");
					for (int j = 0; j < omcitye.size(); j++) {
						Elements weather = omcitye.select("tr:eq("+j+")");
						String city_name=weather.select("td:eq(0)").text();
						
						//新增城市方法
						weatherService.addCity(city_name,proNoid);
					}
					
				}//澳门循环
				
			}//省份循环

			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			while(cishu<2){
				cishu++;
				addDistrict();
			
			}
				e.printStackTrace();
				System.out.println("新增省市区异常，三次新增未成功");
		}
		
	}
	
	
	/*
	 * 天气抓取，获得全国各个区县一周的天气状况，
	 */
//	@Scheduled(cron = "1 1 10 * * ?")
//	@Scheduled(cron = "20 19 17 * * ?")
	public void getWeather(){
		//需 省 市 区 日期 最高温度 最低温度 风力 天气详情 湿度 空气质量
		
		weatherService.delAllWeatherData();
		
		Document doc;
		try {
			//获得各省的省份
			doc = Jsoup.connect("http://www.weather.com.cn/province/").timeout(600000).get();
			Elements eles = doc.select(".sheng_rukou li a");
			String province_weather_url=null;
			String province_name=null;
			Document pdoc=null;
			
			//循环获得各个省份的名称和超链接
			for (Element element : eles) {
				province_weather_url=element.absUrl("href");
				province_name=element.text();
				
				//根据省份或直辖市的url获得url中的内容
				pdoc = Jsoup.connect(province_weather_url).timeout(600000).get();
				
				//直辖市的天气情况
				if(province_name.equals("北京")||province_name.equals("上海")||province_name.equals("天津")||province_name.equals("重庆")){
					//获得直辖市区域名称及url内容
					Elements dise = pdoc.select(".navbox span a");
					String dis_weather_url=null;
					String dis_name=null;
					for (Element dis_element : dise) {
						dis_weather_url=dis_element.absUrl("href");
						dis_name=dis_element.text();
						Document disDoc = Jsoup.connect(dis_weather_url).timeout(600000).get();
						
						//循环新增七天的数据
						//需 省 市 区 日期 最高温度 最低温度 风力 天气详情 湿度 空气质量
						Elements weather_num = disDoc.select("ul[class='t clearfix'] li");
							for(Element every_weather : weather_num){
								
								//获得时间
								Date t1 = new Date();
								SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-");
								String date = sdf.format(t1);
								String date_l = every_weather.select("h1").text();
								String weather_da=date_l.substring(0, 2);
								String weather_date=date+weather_da;
								//天气详情
								String weather_detail = every_weather.select(".wea").text();
								//根据天气状况对应的图片地址 开始和结束图片
								String weather_detail_img_sta_all = every_weather.select("big").get(0).attr("class");
								String weather_detail_img_end_all = every_weather.select("big").get(1).attr("class");
								//获得后两个字符
								String weather_detail_img_sta=weather_detail_img_sta_all.substring(weather_detail_img_sta_all.length()-2,weather_detail_img_sta_all.length());
								String weather_detail_img_end=weather_detail_img_end_all.substring(weather_detail_img_end_all.length()-2,weather_detail_img_end_all.length());
								//获得最高温度及最低温度
								String max_temp = every_weather.select(".tem span").text();
								String nin_temp = every_weather.select(".tem i").text();
								//获得风力情况
								String wind_level = every_weather.select(".win i").text();
								//获得湿度
								String humidity = "2";
								//获得空气状况
								String air_quality = "良好";
								String city_name =dis_name;
								weatherService.addDisWeather(province_name,city_name,dis_name,weather_date,
										max_temp,nin_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality);
							}//7天天气循环
					}//区域循环
				}//直辖市判断
				
				
				
				//香港、台湾的天气情况，
				if(province_name.equals("香港")||province_name.equals("台湾")){
					Elements txcitye = pdoc.select(".around_weather dd a");
					for (Element cityelement : txcitye) {
						String city_weather_url=cityelement.absUrl("href");
						String city_name=cityelement.text();
					
					//循环新增七天的数据
					//需 省 市 区 日期 最高温度 最低温度 风力 天气详情 湿度 空气质量
						//根据省份或直辖市的url获得url中的内容
					Document txdoc = Jsoup.connect(city_weather_url).get();
					Elements weather_num = txdoc.select("ul[class='t clearfix'] li");
						for(Element every_weather : weather_num){
							
							//获得时间
							Date t1 = new Date();
							SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-");
							String date = sdf.format(t1);
							String date_l = every_weather.select("h1").text();
							String weather_da=date_l.substring(0, 2);
							String weather_date=date+weather_da;
							//天气详情
							String weather_detail = every_weather.select(".wea").text();
							//根据天气状况对应的图片地址 开始和结束图片
							String weather_detail_img_sta_all = every_weather.select("big").get(0).attr("class");
							String weather_detail_img_end_all = every_weather.select("big").get(1).attr("class");
							//获得后两个字符
							String weather_detail_img_sta=weather_detail_img_sta_all.substring(weather_detail_img_sta_all.length()-2,weather_detail_img_sta_all.length());
							String weather_detail_img_end=weather_detail_img_end_all.substring(weather_detail_img_end_all.length()-2,weather_detail_img_end_all.length());
							//获得最高温度及最低温度
							String max_temp = every_weather.select(".tem span").text();
							String nin_temp = every_weather.select(".tem i").text();
							//获得风力情况
							String wind_level = every_weather.select(".win i").text();
							//获得湿度
							String humidity = "2";
							//获得空气状况
							String air_quality = "良好";
							String dis_name=city_name;
							weatherService.addDisWeather(province_name,city_name,dis_name,weather_date,
									max_temp,nin_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality);
						}//7天天气循环
					}
					
				}
				
				
				
				//省份的天气情况，以上三个区域的方法相同
				if(!province_name.equals("浙江")&&!province_name.equals("北京")&&!province_name.equals("上海")&&!province_name.equals("天津")&&!province_name.equals("重庆")&&!province_name.equals("澳门")){
					String city_name=null;
					String city_weather_url=null;
					if(province_name.equals("安徽")){
						pdoc = Jsoup.connect("http://www.weather.com.cn/anhui/index.shtml").timeout(600000).get();
					}else{
						pdoc = Jsoup.connect(province_weather_url).timeout(600000).get();
					}
					//根据省份的url获得城市的url及名称
					Elements citye = pdoc.select(".navbox span a");
						for (Element cityelement : citye) {
							//获得城市名称
							city_weather_url=cityelement.absUrl("href");
							if(!cityelement.text().contains("气象局")){
								city_name=cityelement.text();
							}
							//根据城市的url获得区县的名称及url
							Document dise=null;
							try {
								dise = Jsoup.connect(city_weather_url).get();
							} catch (Exception e) {
								// TODO: handle exception
								continue;
							}
							
							Elements disel = dise.select(".navbox span a");
							
							for (Element diselement :disel) {
								String dis_weather_url=diselement.absUrl("href");
								//获得区县名称
								String dis_name=diselement.text();
								if(dis_name.equals("石台")){
									System.out.println("aerherh");
								}
								//根据区县的url地址获得区县的天气状况天气状况
								//青岛崂山地址打不开
								Document diswedoc=null;
								if(dis_name.equals("崂山")){
									diswedoc = Jsoup.connect("http://www.weather.com.cn/weather/101120202.shtml").timeout(600000).get();
								}else{
									try {
										diswedoc = Jsoup.connect(dis_weather_url).timeout(600000).get();
									} catch (Exception e) {
										System.out.println("地区天气异常");
										continue;
									}
									
								}
								
								//循环新增七天的数据
								//需 省 市 区 日期 最高温度 最低温度 风力 天气详情 湿度 空气质量
								Elements weather_num = diswedoc.select("ul[class='t clearfix'] li");
									for(Element every_weather : weather_num){
										
										//获得时间
										Date t1 = new Date();
										SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-");
										String date = sdf.format(t1);
										String date_l = every_weather.select("h1").text();
										String weather_da=date_l.substring(0, 2);
										String weather_date=date+weather_da;
										//天气详情
										String weather_detail = every_weather.select(".wea").text();
										//根据天气状况对应的图片地址 开始和结束图片
										String weather_detail_img_sta_all = every_weather.select("big").get(0).attr("class");
										String weather_detail_img_end_all = every_weather.select("big").get(1).attr("class");
										//获得后两个字符
										String weather_detail_img_sta=weather_detail_img_sta_all.substring(weather_detail_img_sta_all.length()-2,weather_detail_img_sta_all.length());
										String weather_detail_img_end=weather_detail_img_end_all.substring(weather_detail_img_end_all.length()-2,weather_detail_img_end_all.length());
										//获得最高温度及最低温度
										String max_temp = every_weather.select(".tem span").text();
										String nin_temp = every_weather.select(".tem i").text();
										//获得风力情况
										String wind_level = every_weather.select(".win i").text();
										//获得湿度
										String humidity = "2";
										//获得空气状况
										String air_quality = "良好";
										
										weatherService.addDisWeather(province_name,city_name,dis_name,weather_date,
												max_temp,nin_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality);
									}//7天天气循环
								
								
								
								
							}//地区循环
						}//城市循环
						
				}//省份判断
				
				
				//浙江省天气从http://tianqi.2345.com/zhejiang_dz/42.htm 抓取
				if(province_name.equals("浙江")){
					String city_name=null;
					String city_weather_url=null;
					
					pdoc = Jsoup.connect("http://tianqi.2345.com/zhejiang_dz/42.htm").timeout(600000).get();
					//根据省份的url获得城市的url及名称
					Elements citye = pdoc.select(".citychk dl");
						for (Element cityelement : citye) {
							//获得城市名称
							String city_name_l=cityelement.select("dt a").text();
							city_name=city_name_l.replace("天气","");
							//根据城市的url获得区县的名称及url
							
							Elements disel = cityelement.select("dd a");
							
							for (Element diselement :disel) {
								String dis_weather_url=diselement.absUrl("href");
								//获得区县名称
								String dis_name_l=diselement.text();
								String dis_name="城区";
								if(!dis_name_l.equals(city_name)){
									dis_name=dis_name_l;
								}
								//根据区县的url地址获得区县的天气状况天气状况
								//青岛崂山地址打不开
								 Document diswedoc = Jsoup.connect(dis_weather_url).timeout(600000).get();
								//循环新增七天的数据
								//需 省 市 区 日期 最高温度 最低温度 风力 天气详情 湿度 空气质量
								Elements weather_num = diswedoc.select(".wea-detail ul[class='clearfix has_aqi'] li");
									for(Element every_weather : weather_num){
										
										//获得时间
										String weather_date=every_weather.select("p strong").text();;
										//天气详情
										String weather_detail = every_weather.select("b").text();
										//根据天气状况对应的图片地址 开始和结束图片
										String weather_detail_img_sta = "-1";
										String weather_detail_img_end = "-1";
										//获得最高温度及最低温度
										String min_temp = every_weather.select("i font").get(0).text();
										String nax_temp = every_weather.select("i font").get(1).text();
										//获得风力情况
										String wind_level_1 = every_weather.select("i").text();
										String wind_level= wind_level_1.split("℃")[1];
										//获得湿度
										String humidity = "2";
										//获得空气状况
										String air_quality = "良好";
										
										weatherService.addDisWeather(province_name,city_name,dis_name,weather_date,
												nax_temp,min_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality);
									}//7天天气循环
									
							}//地区循环
						}//城市循环
						
				}//省份判断
				
				
				
				//澳门的天气情况(只有当天数据)
				if(province_name.equals("澳门")){
					Elements omcitye = pdoc.select(".weatherTable tbody tr");
					for (int j = 0; j < omcitye.size(); j++) {
						Elements weather = omcitye.select("tr:eq("+j+")");
						String city_name_a=weather.select("td:eq(0)").text();
						String weather_detail=weather.select("td:eq(1)").text();
						String max_temp=weather.select("td:eq(2)").text();
						String wind_level=weather.select("td:eq(4)").text();
						String humidity = weather.select("td:eq(3)").text();
						String nin_temp=max_temp;
						String dis_name=city_name_a;
						Date t1 = new Date();
						SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
						String weather_date = sdf.format(t1);
						String weather_detail_img_sta="-1";
						String weather_detail_img_end="-1";
						//新增1天的天气数据
						String air_quality="良好";
						weatherService.addDisWeather(province_name,city_name_a,dis_name,weather_date,
								max_temp,nin_temp,wind_level,weather_detail,weather_detail_img_sta,weather_detail_img_end,humidity,air_quality);
					}
					
				}//澳门循环
				
			}//省份循环
			
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			while(cishu<2){
				cishu=cishu+1;			
				e.printStackTrace();
				getWeather();
			}
				System.out.println("新增天气异常，三次新增未成功");
		}
		
	}
	
}
