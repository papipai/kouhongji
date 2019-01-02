package com.suibianshuo.entity.web;

import java.io.Serializable;

/**
 * 后台系统用户
 * @author Administrator
 *
 */
public class AdminUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String account;
	private String password;
	private int role;
	private String status;
	private String create_timr;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getCreate_timr() {
		return create_timr;
	}
	public void setCreate_timr(String create_timr) {
		this.create_timr = create_timr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
