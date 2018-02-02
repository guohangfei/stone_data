package com.wskj.app.service.back;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wskj.app.mapper.back.PublicityBackMapper;
import com.wskj.app.vo.Publicity;
import com.wskj.app.vo.PublicityType;


@Service
public class PublicityBackService {
	
	@Autowired
	private PublicityBackMapper publicityBackMapper;
	
	//查询展示广告所有信息
	public List<Map> getPubList() {
		return publicityBackMapper.getPubList();
	}
	
	//查询所有广告分类信息
	public List<Map>getPubTypeList() {
		return publicityBackMapper.getPubTypeList();
	}
	//删除广告分类(执行删除广告分类)
	public String delPubTyExecute(Integer noid){
		return publicityBackMapper.delPubTyExecute(noid);
	}
	//增加广告分类(执行增加广告分类)
	public Integer addPubTyExecute(String type_name, Integer type_symbol, Integer order_numb){
		return publicityBackMapper.addPubTyExecute(type_name,type_symbol,order_numb);
	}
	//回顯要修改的項
	public List<Map> getPubTypeListByNoid(Integer noid) {
		// TODO Auto-generated method stub
		return publicityBackMapper.getPubTypeListByNoid(noid);
	}
	//執行修改分類
	public Integer updatePubTyExecute(String type_name, Integer type_symbol, Integer order_numb, Integer noid) {
		// TODO Auto-generated method stub
		return publicityBackMapper.updatePubTyExecute(type_name,type_symbol,order_numb,noid);
	}
	//执行删除广告信息
	public void delPubExecute(Integer noid) {
		// TODO Auto-generated method stub
		publicityBackMapper.delPubExecute(noid);
	}

	//查询分类的可选项内容
	public List<Map> getAllTypes() {
		// TODO Auto-generated method stub
		return publicityBackMapper.getAllTypes();
	}
	//执行增加广告
	public Integer addPubExecute(String title, String content, Integer type_id, String pic_url, String link_url,
			Integer order_numb, Date create_time, Integer state, Integer click) {
		// TODO Auto-generated method stub
		return publicityBackMapper.addPubExecute(title,content,type_id,pic_url,link_url,
				order_numb,create_time,state,click);
	}
	//查询回显要修改的广告项
	public List<Map> getPubOne(Integer noid) {
		// TODO Auto-generated method stub
		return publicityBackMapper.getPubOne(noid);
	}

	public Integer updatePubExecute(String title, String content, Integer type_id, String pic_url, String link_url,
			Integer order_numb, Integer state,  Integer noid) {
		// TODO Auto-generated method stub
		return publicityBackMapper.updatePubExecute(title,content,type_id,pic_url,link_url,order_numb,state,noid);
	}
	
}
