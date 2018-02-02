package com.wskj.app.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface LotteryMapper {

	/**
	 * 根据时间查询当天的彩票数据
	 * @param cdate
	 * @return
	 */
	@Select("select * from t_lottery where run_date=#{cdate} order by lottery_numb desc")
	List<Map<String, Object>> selectLottery(String cdate);

}
