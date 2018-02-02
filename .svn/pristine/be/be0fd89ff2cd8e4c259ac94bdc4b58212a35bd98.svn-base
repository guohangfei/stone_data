package com.wskj.app.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页查询类
 * 
 * @author Administrator
 *
 */
public class PageInfo<T> {
	private Integer currPage=1;// 当前页
	private Integer pageSize=5;// 每页显示信息数
	private Integer total;// 总信息数
	private List<T> rows = new ArrayList<T>();// 详细信息的集合

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	
	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	/**
	 * 获得总页数的方法
	 * @return
	 */
	public Integer getTotalPage() {
		if (total % pageSize == 0) {
			return total / pageSize;
		} else {
			return total /pageSize + 1;
		}
	}
}
