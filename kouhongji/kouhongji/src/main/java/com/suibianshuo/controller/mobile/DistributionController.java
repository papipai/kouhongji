package com.suibianshuo.controller.mobile;
/**
 * 用户分销
 * @author Administrator
 *
 */

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.entity.mobile.UserReCharge;
import com.suibianshuo.serviceImpl.mobile.UserReChargeServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserServiceImpl;
@Controller
public class DistributionController {
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private UserReChargeServiceImpl UserReChargeServiceImpl;
	
	@RequestMapping(value="/distribution.html",method= {RequestMethod.GET})
	public String distribution(HttpSession session) {
		//1.从session中获取当前登录的用户
		User user = new User();
		user = (User) session.getAttribute("user");
		//2.获取当前用户的红包总金额
		user = userServiceImpl.getUser(user);
		BigDecimal redpacket = user.getRedpacket();
		//BigDecimal redpacket = new BigDecimal(0);//测试
		session.setAttribute("redpacket", redpacket);
		
		//3.获取当前用户邀请到的好友
		List<User> userList = new ArrayList<>();
		userList = userServiceImpl.getOffLineList(user);
		for (int i = 0; i < userList.size(); i++) {
			System.out.println("nickname="+userList.get(i).getNickname());
		}
		//4.获取从好友那获得的红包金额
		
		if (userList.size() > 0) {
			//4.1获得下线用户openid的集合
			List<String> openIdList= new ArrayList<>();
			for (int i = 0; i < userList.size(); i++) {
				openIdList.add(i, userList.get(i).getOpenid());
			}
			//4.2把list传给接口查询
			List<UserReCharge> userReChargeList = UserReChargeServiceImpl.getOffLineUserSumRecharge(openIdList);
			if (userReChargeList != null) {
				session.setAttribute("userReChargeList", userReChargeList);
			}
		}
		
		return "mobile/distribution";
	}
	
	/**
	 * 用户红包提现到余额
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/tackCash.java",method= {RequestMethod.POST})
	public void tackCash(HttpSession session,HttpServletResponse response) throws IOException {
		User user = new User();
		user = (User) session.getAttribute("user");
		user = userServiceImpl.getUser(user);
		if (user != null) {
			BigDecimal money = user.getMoney();
			BigDecimal redPacket = user.getRedpacket();
			String result = "fail";
			System.out.println("money="+money+" redPacket="+redPacket);
			System.out.println("redPacket.equals(BigDecimal.ZERO)="+redPacket.equals(BigDecimal.ZERO));
			if(redPacket.compareTo(BigDecimal.ZERO)==0){ 
				result = "low";
			}else {
				user.setMoney(money.add(redPacket));
				user.setRedpacket(new BigDecimal(0));
				int num = userServiceImpl.updateUser(user);
				System.out.println("num="+num);
				
				if (num > 0) {
					result = "success";
				}
			}
			
			response.getWriter().write(result);
		}
	}
}
