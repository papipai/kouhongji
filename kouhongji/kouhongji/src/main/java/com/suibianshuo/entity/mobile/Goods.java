package com.suibianshuo.entity.mobile;

import java.io.Serializable;
import java.math.BigDecimal;

import com.suibianshuo.entity.util.PageBean;

/**
 * 口红商品
 * @author Administrator
 *
 */
public class Goods extends PageBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private BigDecimal shop_price;
	private String goods_name;
	private String color_number;
	private String is_zheng;
	private BigDecimal goods_price;
	private String goods_img;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BigDecimal getShop_price() {
		return shop_price;
	}
	public void setShop_price(BigDecimal shop_price) {
		this.shop_price = shop_price;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getColor_number() {
		return color_number;
	}
	public void setColor_number(String color_number) {
		this.color_number = color_number;
	}
	public String getIs_zheng() {
		return is_zheng;
	}
	public void setIs_zheng(String is_zheng) {
		this.is_zheng = is_zheng;
	}
	public BigDecimal getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(BigDecimal goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	
	
}
