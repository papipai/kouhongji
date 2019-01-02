package com.suibianshuo.entity.mobile;

import java.io.Serializable;

/**
 * 游戏参数配置类
 * @author Administrator
 *
 */
public class GameConfig implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int mode;//游戏模式(1-挑战，2-体验)
	private int num;
	private int time;
	private int hard;
	private String speed_arr;//转速数组
	private String is_enable;//是否启用
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMode() {
		return mode;
	}
	public void setMode(int mode) {
		this.mode = mode;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getHard() {
		return hard;
	}
	public void setHard(int hard) {
		this.hard = hard;
	}
	public String getSpeed_arr() {
		return speed_arr;
	}
	public void setSpeed_arr(String speed_arr) {
		this.speed_arr = speed_arr;
	}
	public String getIs_enable() {
		return is_enable;
	}
	public void setIs_enable(String is_enable) {
		this.is_enable = is_enable;
	}
	
	
}
