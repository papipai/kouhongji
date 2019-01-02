package com.suibianshuo.entity.mobile;

import java.io.Serializable;
import java.util.Date;

import com.suibianshuo.entity.util.PageBean;

/**
 * 用户游戏日志
 * @author Administrator
 *
 */
public class UserPlayLog extends PageBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String openid;
	private int mode;
	private int goodsid;
	private Date play_time;
	private int fail_level;
	private String is_success;
	private String device;//设备类型
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public int getMode() {
		return mode;
	}
	public void setMode(int mode) {
		this.mode = mode;
	}
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public Date getPlay_time() {
		return play_time;
	}
	public void setPlay_time(Date play_time) {
		this.play_time = play_time;
	}
	public int getFail_level() {
		return fail_level;
	}
	public void setFail_level(int fail_level) {
		this.fail_level = fail_level;
	}
	public String getIs_success() {
		return is_success;
	}
	public void setIs_success(String is_success) {
		this.is_success = is_success;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	
	
	
}
