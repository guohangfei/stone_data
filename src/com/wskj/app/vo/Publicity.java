package com.wskj.app.vo;

public class Publicity {
	
	private Integer noid;
	private Integer type_id;
	private String pic_url;
	private String title;
	private String content;
	private String link_url;
	private Integer order_numb;
	private String create_time;
	private Integer state;
	private Integer click;
	public Integer getNoid() {
		return noid;
	}
	public void setNoid(Integer noid) {
		this.noid = noid;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getPic_url() {
		return pic_url;
	}
	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLink_url() {
		return link_url;
	}
	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}
	public Integer getOrder_numb() {
		return order_numb;
	}
	public void setOrder_numb(Integer order_numb) {
		this.order_numb = order_numb;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getClick() {
		return click;
	}
	public void setClick(Integer click) {
		this.click = click;
	}
	@Override
	public String toString() {
		return "Publicity [noid=" + noid + ", type_id=" + type_id + ", pic_url=" + pic_url + ", title=" + title
				+ ", content=" + content + ", link_url=" + link_url + ", order_numb=" + order_numb + ", create_time="
				+ create_time + ", state=" + state + ", click=" + click + "]";
	}
	
	
	
}
