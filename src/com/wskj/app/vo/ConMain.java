package com.wskj.app.vo;

import java.util.Date;

public class ConMain {
	private Integer noid;
	private String conName;
	private String dateRange;
	private Date startDate;
	private Date endDate;
	private Integer orderNum;
	
	public Integer getNoid() {
		return noid;
	}
	public void setNoid(Integer noid) {
		this.noid = noid;
	}
	public String getConName() {
		return conName;
	}
	public void setConName(String conName) {
		this.conName = conName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	public String getDateRange() {
		return dateRange;
	}
	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}
	
}
