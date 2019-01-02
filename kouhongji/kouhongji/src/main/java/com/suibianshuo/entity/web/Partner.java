package com.suibianshuo.entity.web;
/**
 * 合作推广商
 * @author Administrator
 *
 */

import java.io.Serializable;
import java.util.Date;

import com.suibianshuo.entity.util.PageBean;

public class Partner extends PageBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String partner_name;//合伙人名称
	private String key;//合伙人名称
	private String url;//推广链接
	private Date create_time;
	private String status;//推广状态（Y-合作，N-非合作）
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPartner_name() {
		return partner_name;
	}
	public void setPartner_name(String partner_name) {
		this.partner_name = partner_name;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
