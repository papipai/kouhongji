package com.suibianshuo.entity.mobile;

import java.io.Serializable;

import com.suibianshuo.entity.util.PageBean;

/**
 * 用户分享记录
 * @author Administrator
 *
 */
public class UserShareLog extends PageBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String openid;
	private String share_place;//1朋友圈，2-朋友或群
	private String create_time;
	private String beginTime;
	private String endTime;
	private String source;
	
	
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
	public String getShare_place() {
		return share_place;
	}
	public void setShare_place(String share_place) {
		this.share_place = share_place;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	
	
	
	
}
