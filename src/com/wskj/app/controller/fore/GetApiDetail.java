package com.wskj.app.controller.fore;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wskj.app.service.AppkeyHandleService;
/**
 * 说明：此类用于用户通过接口调用数据
 * @author Administrator
 *
 */

//fore/apidata/getdata.do "92cc004b-2544-4a22-9f48-1a02f370ac28", 3, 1, "2017-04-24"
//http://localhost:8080/stone_data/fore/apidata/getdata.do?appkey=3b6c6b15-6ee4-4da3-b2de-06977e630390&conNum=1&date=2017-04-24
@Controller
@RequestMapping("/fore/apidata")
public class GetApiDetail {
	@Autowired
	private AppkeyHandleService appkeyHandleService;//星座查询服务对象
	
	//01.测试反馈数据
	@RequestMapping("/getdata.do")
	@ResponseBody
	public String getData(String appkey,Integer conNum,String date){
		return appkeyHandleService.doGetConstellData(appkey, 3, conNum, date);
	}
}
