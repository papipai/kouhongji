package com.suibianshuo.controller.mobile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.mobile.Order;
import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.entity.mobile.UserPlayLog;
import com.suibianshuo.entity.web.AdminUser;
import com.suibianshuo.serviceImpl.mobile.OrderServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserPlayLogServiceImpl;
import com.suibianshuo.util.common.SOLEIDUtil;

import net.sf.json.JSONObject;

@Controller
public class OrderController {
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	@Autowired  
    private UserPlayLogServiceImpl userPlayLogServiceImpl;
	
	/**
	 * 游戏通关创建订单
	 * @param goodsId
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/addOrder.java",method= {RequestMethod.POST})
	public void addOrder(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int goodsId = Integer.parseInt(request.getParameter("goodsId"));
		String device = request.getParameter("device");
		//创建订单
		Order order = new Order();
		User user = (User) session.getAttribute("user");
		order.setOrdernum(SOLEIDUtil.getGoodsId());
		order.setOpenid(user.getOpenid());
		order.setGoodsid(goodsId);
		order.setCreate_time(sdf.format(new Date()));
		int result = orderServiceImpl.addOrder(order);
		
		//添加用户游戏日志
    	UserPlayLog userPlayLog = new UserPlayLog();
    	userPlayLog.setOpenid(user.getOpenid());
    	userPlayLog.setMode(1);
    	userPlayLog.setGoodsid(goodsId);
    	userPlayLog.setIs_success("Y");
    	if (StringUtils.isNotEmpty(device)) {
    		userPlayLog.setDevice(device);
		}
    	userPlayLog.setPlay_time(new Date());
    	userPlayLogServiceImpl.addUserPlayLog(userPlayLog);
		
		String data = null;
		if (result > 0) {
			data = "success";//订单创建成功
		}else {
			data = "fail";
		}
		response.getWriter().write(data);
	}
	/**
	 * 订单填写地址
	 * @param response
	 * @throws IOException
	 * @throws ServletException 
	 */
	@RequestMapping(value="/updateorder.java",method= {RequestMethod.GET})
	public void updateOrder(HttpSession session,HttpServletResponse response,
			HttpServletRequest request) throws IOException, ServletException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String addressid = request.getParameter("addressid");
		String ordernum = request.getParameter("ordernum");
		String status = request.getParameter("status");
		String device = request.getParameter("device");
    	
		Order order = new Order();
		
		if (StringUtils.isNotEmpty(addressid)) {
			order.setAddressid(Integer.parseInt(addressid));
		}
		if (StringUtils.isNotEmpty(ordernum)) {
			order.setOrdernum(ordernum);
		}
		if (StringUtils.isNotEmpty(status)) {
			order.setStatus(status);
		}
		
		order.setUpdate_time(sdf.format(new Date()));
		int result = orderServiceImpl.updateOrder(order);
		if (result > 0) {
			if (device.equals("phone")) {
				RequestDispatcher requestDispatcher =request.getRequestDispatcher("myorderlist.html");
	            //调用forward()方法，转发请求      
	            requestDispatcher.forward(request,response);
			}else {
				String data = "success";
				response.getWriter().write(data);
			}
		}
		
	}
	
	/**
	 * 订单列表
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/orderList.html",method= {RequestMethod.GET})
	public String orderList(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		Order order = new Order();
		List<Order> orderList = new ArrayList<>();
		order.setSort("a.create_time");
		order.setOrder("DESC");
		order.setPageSize(5);
		order.setStart(0);
		//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		order.setSource(adminUser.getAccount());
		}
		
		orderList = orderServiceImpl.getAllOrder(order);
		int orderNum = orderServiceImpl.getCount(order);
		double pages = (double)orderNum / 5.00;
		int totalPages = (int) Math.ceil(pages) ;
		if (orderList.size() > 0) {
			session.setAttribute("orderList",orderList);
		}
		if (orderNum > 0) {
			session.setAttribute("orderNum", orderNum);
		}
		Map<String, Integer> pageBean = new HashMap<>();
		pageBean.put("totalPages", totalPages);
		pageBean.put("pageSize", order.getPageSize());
		pageBean.put("totalSize", orderNum);
		pageBean.put("currentPage", 1);
		session.setAttribute("userCount", orderNum);
		session.setAttribute("pageBean", pageBean);
		return "web/orderList";
	}
	
	@RequestMapping(value="/orderListSearch.html",method= {RequestMethod.GET})
	public void orderListSearch(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		String status = request.getParameter("status");
		String phone = request.getParameter("phone");
		String beginTime = request.getParameter("begin");
		String endTime = request.getParameter("end");
		String currentPage = request.getParameter("page");
		String currentPageSize = request.getParameter("pageSize");
		
		int page = 0;
		int pageSize = 0;
		if (StringUtils.isNotEmpty(currentPage)) {
			page = Integer.parseInt(currentPage);
		}
		if (StringUtils.isNotEmpty(currentPageSize)) {
			pageSize = Integer.parseInt(currentPageSize);
		}
		
		List<Order> orderList = new ArrayList<>();
		Order order = new Order();
		
		//设置分页条件
		order.setSort("a.create_time");
		order.setOrder("DESC");
		if(page > 0){
			order.setStart((page-1)*pageSize);
		}
		if(pageSize > 0){
			order.setPageSize(pageSize);
		}
				
		if (StringUtils.isNotEmpty(status)) {
			order.setStatus(status);
		}
		if (StringUtils.isNotEmpty(phone)) {
			order.setPhone(phone);
		}
		if (StringUtils.isNotEmpty(beginTime) &&StringUtils.isNotEmpty(endTime)) {
			if (beginTime.equals(endTime)) {
				order.setCreate_time(beginTime);
			}else {
				order.setBeginTime(beginTime+" 00:00:00");
				order.setEndTime(endTime+" 00:00:00");
			}
		}
		//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		order.setSource(adminUser.getAccount());
		}
    	//调用接口查询数据
		orderList = orderServiceImpl.getAllOrder(order);
		int orderNum = orderServiceImpl.getCount(order);
		//计算总页数
		double pages = (double)orderNum / (double)pageSize;
		int totalPages = (int) Math.ceil(pages) ;//总页数
		
		//把查询结果封装成json传到前台
		JSONObject object = new JSONObject();
		object.put("totalPages", totalPages);
		object.put("pageSize", pageSize);
		object.put("totalSize", orderNum);
		object.put("currentPage", page);
		object.put("orderList", orderList);
		response.getWriter().print(object);
		
	}
}
