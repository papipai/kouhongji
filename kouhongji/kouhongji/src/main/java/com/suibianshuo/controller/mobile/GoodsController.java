package com.suibianshuo.controller.mobile;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.suibianshuo.entity.mobile.Goods;
import com.suibianshuo.serviceImpl.mobile.GoodsServiceImpl;
import com.suibianshuo.serviceImpl.mobile.OrderServiceImpl;

@Controller
public class GoodsController {
	@Autowired
	private GoodsServiceImpl goodsServiceImpl;
	
	@Autowired  
    private OrderServiceImpl orderServiceImpl;
	
	/**
	 * 商品列表
	 */
	@RequestMapping(value="/goodslist.java",method= {RequestMethod.GET})
	public void goodsList(HttpServletResponse response) throws IOException {
		List<Goods> list = goodsServiceImpl.getAllGoods();
		Gson gson = new Gson();
		String recJson = gson.toJson(list);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(recJson);
	}
	
	/**
	 * 中奖公告
	 * @throws IOException 
	 */
//	@RequestMapping(value="/noticeList.java",method= {RequestMethod.GET})
//	public void noticeList(HttpServletResponse response) throws IOException {
//		List<Order> orderList = new ArrayList<>();
//    	Order order = new Order();
//    	orderList = orderServiceImpl.getAllOrder(order);
//		Gson gson = new Gson();
//		String recJson = gson.toJson(orderList);
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().append(recJson);
//	}
	
}
