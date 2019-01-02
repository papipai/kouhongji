package com.suibianshuo.entity.util;

import java.io.Serializable;

/**
 * 分页Model类
 * @author 
 *
 */

public class PageBean implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int page; // 第几页
	
	private Integer pageSize; // 每页记录数
	
	private long totolSize; //总条数
	
	private Integer start;  // 起始页
	
	private String sort; //排序字段
	
	private String order; //排序方式(ASC升序，DESC降序)	
	
	public PageBean(int page, int pageSize) {
		super();
		this.page = page;
		this.pageSize = pageSize;
	}
	
	
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

//	public static int getByStart(int page, int pageSize) {
//		return (page-1)*pageSize;
//	}
	
	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getStart() {
		return start;
	}

	
//	public Integer getStart() {
//		if(pageSize != null  ){
//			return (page-1)*pageSize;
//		}else{
//			return null;
//		}
//		
//	}
	

	public String getSort() {
		return sort;
	}

//	public void setStart(Integer start) {
//		this.start = start;
//	}


	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public long getTotolSize() {
		return totolSize;
	}

	public void setTotolSize(long totolSize) {
		this.totolSize = totolSize;
	}

	public PageBean(int page, int pageSize, int totolSize, int start) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.totolSize = totolSize;
	}
	
	
	
	
	
}
