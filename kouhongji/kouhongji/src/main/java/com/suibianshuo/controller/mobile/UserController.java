package com.suibianshuo.controller.mobile;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.entity.mobile.UserReCharge;
import com.suibianshuo.entity.web.AdminUser;
import com.suibianshuo.entity.web.Partner;
import com.suibianshuo.serviceImpl.mobile.UserReChargeServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserServiceImpl;
import com.suibianshuo.serviceImpl.web.PartnerServiceImpl;
import com.suibianshuo.util.wechat.WeiXinConfig;
import com.suibianshuo.util.wechat.WeiXinUtil;

import net.sf.json.JSONObject;

@Controller
public class UserController {
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@Autowired
	private PartnerServiceImpl partnerServiceImpl;
	
	@Autowired
	private UserReChargeServiceImpl userReChargeServiceImpl;
	
	@RequestMapping(value="/userMsg",method= {RequestMethod.POST})
	public void userMsg(String code,HttpSession session,HttpServletRequest request) throws ClientProtocolException, IOException {
		if (code != null && code != "null" && code !="") {
			WeiXinUtil wx = new WeiXinUtil();
			User user = new User();
			User user2 = new User();
			Map<String,String> map = wx.getOpenIdAndAccessToken(code);
			
			String url = WeiXinConfig.USER_INFO_URL.replace("ACCESS_TOKEN", map.get("access_token")).replace("OPENID", map.get("openid"));
			JSONObject jsonObject = WeiXinUtil.doGetStr(url);
			
			String source = request.getParameter("source");
			if (source != null) {
				user.setSource(source);
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if (jsonObject != null) {
				user2.setOpenid(jsonObject.getString("openid"));
				user.setOpenid(jsonObject.getString("openid"));
				user.setNickname(jsonObject.getString("nickname"));
				user.setSex(jsonObject.getString("sex"));
				user.setLanguage(jsonObject.getString("language"));
				user.setCity(jsonObject.getString("city"));
				user.setProvince(jsonObject.getString("province"));
				user.setCountry(jsonObject.getString("country"));
				user.setHeadimgurl(jsonObject.getString("headimgurl"));
				user.setUnionid(jsonObject.getString("unionid"));
				user.setCreate_time(sdf.format(new Date()));
				user.setUpdate_time(sdf.format(new Date()));
				user.setMoney(new BigDecimal(0));
				user.setRedpacket(new BigDecimal(0));
				user.setStatus("Y");
				//保存用户
				//user2 = userServiceImpl.getUserList(user2).get(0);
				user2 = userServiceImpl.getUser(user2);
				if (user2 == null) {
					userServiceImpl.addUser(user);
					session.setAttribute("user", user);
				}else {
					session.setAttribute("user", user2);
				}
				
				
			}
			
		}
	}
	
	/**
	 * 判断用户余额是否大于商品的挑战价，大于则从余额中扣除商品挑战价并更新
	 * @param goodsPrice
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/updateMyBalance.java",method= {RequestMethod.POST})
	public void updateMyBalance(@RequestParam("goodsPrice")BigDecimal goodsPrice,HttpSession session,HttpServletResponse response) throws IOException {
		User user = (User) session.getAttribute("user");
		
		//BigDecimal money = userServiceImpl.getUserList(user).get(0).getMoney();
		BigDecimal money = userServiceImpl.getUser(user).getMoney();
		//Long money = (long) 0;//测试数据，正式环境删除
		
		String code = null;
		//判断余额与商品挑战价
		if (money.compareTo(goodsPrice) == 0 || money.compareTo(goodsPrice) == 1) {
			code = "yes,";//余额大于商品挑战价
			user.setMoney(money.subtract(goodsPrice));
			int result = userServiceImpl.updateUser(user);
			if (result > 0) {
				code += "startGame";//扣除成功，开启挑战
			}else {
				code += "recharge";//余额不足，去充值
			}
		}else {
			code = "no,";
		}
		response.getWriter().write(code);
	}
	
	/**
	 * 用户充值
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@Transactional
	@RequestMapping(value="/toSavePayInfo.java",method= {RequestMethod.POST})
	public void addRecharge(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		User user = (User) session.getAttribute("user");
		//user = userServiceImpl.getUserList(user).get(0);
		user = userServiceImpl.getUser(user);
		String openid = user.getOpenid();
		String spbill_create_ip = request.getParameter("spbill_create_ip");
		String detail = request.getParameter("detail");
		String body = request.getParameter("body");
		String out_trade_no = request.getParameter("out_trade_no");
		String total_fee = request.getParameter("total_fee");
		UserReCharge userReCharge = new UserReCharge();
		userReCharge.setOpenid(openid);
		userReCharge.setDetail(detail);
		userReCharge.setBody(body);
		userReCharge.setSpbill_create_ip(spbill_create_ip);
		userReCharge.setOut_trade_no(out_trade_no);
		userReCharge.setTotal_fee(new BigDecimal(total_fee));
		userReCharge.setCreate_time(sdf.format(new Date()));
		//添加用户充值记录
		userReChargeServiceImpl.addUserReCharge(userReCharge);
		user.setMoney(user.getMoney().add(new BigDecimal(total_fee)));
		//更新用户余额
		int num = userServiceImpl.updateUser(user);
		
		//更新改用户推荐人的红包
		//1.查询改用户是否有推荐人
		user = userServiceImpl.getUpperLine(user);
		if (user != null) {
			//1.1拿到推荐人的openID
			String upperLineOpenid = user.getOpenid();
			
			//1.2获取推荐人原有的红包金额
			User upUser = new User();
			upUser.setOpenid(upperLineOpenid);
			upUser = userServiceImpl.getUser(upUser);
			BigDecimal redpacket = upUser.getRedpacket();
			
			//1.3推荐人从下线处应得的红包金额（得到用户充值金额的15%）
			BigDecimal redpacket2 = new BigDecimal(Integer.parseInt(total_fee)*0.15);
			
			//1.4用原有红包加上获得的红包并更新
			upUser.setRedpacket(redpacket.add(redpacket2));
			userServiceImpl.updateUser(upUser);
		}
		user.setRedpacket(user.getRedpacket().add(new BigDecimal(total_fee)));
		userServiceImpl.updateUser(user);
		String result = null;
		if (num > 0) {
			result = "success";
		}else {
			result = "fail";
		}
		Gson gson = new Gson();
		String recJson = gson.toJson(result);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(recJson);
	}
	
	/**
	 * 用户列表
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userList.html",method= {RequestMethod.GET})
	public String getUserList(HttpServletRequest request,HttpSession session) {
		List<User> userList = new ArrayList<>();
		List<Partner> partnerList = new ArrayList<>();
		User user = new User();
		Partner partner = new Partner();
		user.setSort("a.create_time");
		user.setOrder("DESC");
		user.setPageSize(50);
		user.setStart(0);
		
		//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		user.setSource(adminUser.getAccount());
		}
		userList = userServiceImpl.getUserList(user);
		partnerList = partnerServiceImpl.getAllPartner(partner);
		int userCount = userServiceImpl.getCount(user);
		double pages = (double)userCount / 50.00;
		int totalPages = (int) Math.ceil(pages) ;
		if (userList.size() > 0) {
			session.setAttribute("userList", userList);
		}
		if (partnerList.size() > 0) {
			session.setAttribute("partnerList", partnerList);
		}
		Map<String, Integer> pageBean = new HashMap<>();
		pageBean.put("totalPages", totalPages);
		pageBean.put("pageSize", user.getPageSize());
		pageBean.put("totalSize", userCount);
		pageBean.put("currentPage", 1);
		session.setAttribute("userCount", userCount);
		session.setAttribute("pageBean", pageBean);
		
		return "web/userList";
	}
	
	/**
	 * 查询用户
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/userListSearch.html",method= {RequestMethod.GET})
	public void getUserListBySearch(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		//接收页面参数
		String sex = request.getParameter("sex");
		String status = request.getParameter("status");
		String source = request.getParameter("source");
		String nickname = request.getParameter("nickname");
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
		
		List<User> userList = new ArrayList<>();
		User user = new User();
		
		//设置分页条件
		user.setSort("a.create_time");
		user.setOrder("DESC");
		if(page > 0){
			user.setStart((page-1)*pageSize);
		}
		if(pageSize > 0){
			user.setPageSize(pageSize);
		}
		
		//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		user.setSource(adminUser.getAccount());
		}
		
		if (StringUtils.isNotEmpty(sex)) {
			user.setSex(sex);
		}
		if (StringUtils.isNotEmpty(status)) {
			user.setStatus(status);
		}
		if (StringUtils.isNotEmpty(source)) {
			user.setSource(source);
		}
		if (StringUtils.isNotEmpty(nickname)) {
			user.setNickname(nickname);
		}
		if (StringUtils.isNotEmpty(beginTime) &&StringUtils.isNotEmpty(endTime)) {
			if (beginTime.equals(endTime)) {
				user.setCreate_time(beginTime);
			}else {
				user.setBeginTime(beginTime+" 00:00:00");
				user.setEndTime(endTime+" 00:00:00");
			}
		}
		
		//调用接口查询数据
		userList = userServiceImpl.getUserList(user);
		int userCount = userServiceImpl.getCount(user);
		//计算总页数
		double pages = (double)userCount / (double)pageSize;
		int totalPages = (int) Math.ceil(pages) ;//总页数
		
		//把查询结果封装成json传到前台
		JSONObject object = new JSONObject();
		object.put("totalPages", totalPages);
		object.put("pageSize", pageSize);
		object.put("totalSize", userCount);
		object.put("currentPage", page);
		object.put("userCount", userCount);
		object.put("userList", userList);
		response.getWriter().print(object);
	}
	
	/**
	 * 用户充值列表
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/userChargeList.html",method= {RequestMethod.GET})
	public String userChargeList(HttpServletRequest request,HttpSession session) {
		List<Partner> partnerList = new ArrayList<>();
		Partner partner = new Partner();
		List<UserReCharge> userReChargeList = new ArrayList<>();
		UserReCharge userReCharge = new UserReCharge();
		
		userReCharge.setSort("a.create_time");
		userReCharge.setOrder("DESC");
		userReCharge.setPageSize(50);
		userReCharge.setStart(0);
		
		//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		userReCharge.setSource(adminUser.getAccount());
		}
		
		partnerList = partnerServiceImpl.getAllPartner(partner);
		userReChargeList = userReChargeServiceImpl.getUserReCharge(userReCharge);
		int totalNum = userReChargeServiceImpl.getCount(userReCharge);
		double pages = (double)totalNum / 50.00;
		int totalPages = (int) Math.ceil(pages) ;
		
		double val = 0.00;
		BigDecimal sumFee = new BigDecimal(val);
		if (partnerList.size() > 0) {
			session.setAttribute("partnerList", partnerList);
		}
		if (userReChargeList.size() > 0) {
			for (int i = 0; i < userReChargeList.size(); i++) {
				sumFee = userReChargeList.get(i).getTotal_fee().add(sumFee);
			}
			session.setAttribute("sumFee", sumFee);
			session.setAttribute("userReChargeList", userReChargeList);
		}
		
		Map<String, Integer> pageBean = new HashMap<>();
		pageBean.put("totalPages", totalPages);
		pageBean.put("pageSize", userReCharge.getPageSize());
		pageBean.put("totalSize", totalNum);
		pageBean.put("currentPage", 1);
		session.setAttribute("pageBean", pageBean);
		
		return "web/userChargeList";
	}
	
	/**
	 * 查询用户充值列表
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/userChargeSearch.html",method= {RequestMethod.GET})
	public void getUserChargeListBySearch(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		String sex = request.getParameter("sex");
		String source = request.getParameter("source");
		String nickname = request.getParameter("nickname");
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
		
		List<UserReCharge> userReChargeList = new ArrayList<>();
		UserReCharge userReCharge = new UserReCharge();
		
		//设置分页条件
		userReCharge.setSort("a.create_time");
		userReCharge.setOrder("DESC");
		if(page > 0){
			userReCharge.setStart((page-1)*pageSize);
		}
		if(pageSize > 0){
			userReCharge.setPageSize(pageSize);
		}
		
		//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		userReCharge.setSource(adminUser.getAccount());
		}
		
		if (StringUtils.isNotEmpty(sex)) {
			userReCharge.setSex(sex);
		}
		if (StringUtils.isNotEmpty(source)) {
			userReCharge.setSource(source);
		}
		if (StringUtils.isNotEmpty(nickname)) {
			userReCharge.setNickname(nickname);
		}
		if (StringUtils.isNotEmpty(beginTime) &&StringUtils.isNotEmpty(endTime)) {
			if (beginTime.equals(endTime)) {
				userReCharge.setCreate_time(beginTime);
			}else {
				userReCharge.setBeginTime(beginTime+" 00:00:00");
				userReCharge.setEndTime(endTime+" 00:00:00");
			}
		}
		//用户充值列表
		userReChargeList = userReChargeServiceImpl.getUserReCharge(userReCharge);
		//用户充值记录总条数
		int userReChargeCount = userReChargeServiceImpl.getCount(userReCharge);
		//根据查询条件计算总充值金额
		double val = 0.00;
		BigDecimal sumFee = new BigDecimal(val);
		if (userReChargeList.size() > 0) {
			for (int i = 0; i < userReChargeList.size(); i++) {
				sumFee = userReChargeList.get(i).getTotal_fee().add(sumFee);
			}
			
		}
		
		//计算总页数
		double pages = (double)userReChargeCount / (double)pageSize;
		int totalPages = (int) Math.ceil(pages) ;//总页数
		
		
		//把查询结果封装成json传到前台
		JSONObject object = new JSONObject();
		object.put("totalPages", totalPages);
		object.put("pageSize", pageSize);
		object.put("totalSize", userReChargeCount);
		object.put("currentPage", page);
		object.put("userReChargeCount", userReChargeCount);
		object.put("sumFee", sumFee);
		object.put("userReChargeList", userReChargeList);
		response.getWriter().print(object);
		
	}
	
	
	

		
}
