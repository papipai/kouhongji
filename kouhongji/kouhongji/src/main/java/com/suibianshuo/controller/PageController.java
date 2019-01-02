package com.suibianshuo.controller;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.mobile.Address;
import com.suibianshuo.entity.mobile.GameConfig;
import com.suibianshuo.entity.mobile.Order;
import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.entity.mobile.UserReCharge;
import com.suibianshuo.entity.mobile.UserShareLog;
import com.suibianshuo.entity.web.AdminUser;
import com.suibianshuo.serviceImpl.mobile.AddressServiceImpl;
import com.suibianshuo.serviceImpl.mobile.GameConfigServiceImpl;
import com.suibianshuo.serviceImpl.mobile.OrderServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserReChargeServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserShareLogServiceImpl;
import com.suibianshuo.util.qrcode.QRCodeUtil;
import com.suibianshuo.util.wechat.WeiXinConfig;

@Controller  
public class PageController {  
    @Autowired  
    private UserServiceImpl userInfoServiceImpl; 
    
    @Autowired  
    private AddressServiceImpl addressServiceImpl;
    
    @Autowired  
    private OrderServiceImpl orderServiceImpl;
    
    @Autowired
	private GameConfigServiceImpl gameConfigServiceImpl;
    
    @Autowired
	private UserReChargeServiceImpl userReChargeServiceImpl;
    
    @Autowired
	private UserShareLogServiceImpl userShareLogServiceImpl;
    
    /**
     * 口红机启动页
     * @param session
     * @return
     */
    @RequestMapping(value="/index.html",method= {RequestMethod.GET})
    public String showIndexPage(){ 
    	
        return "mobile/index";  
    }
    /**
     * 口红机后台登录
     * @param session
     * @return
     */
    @RequestMapping(value="/login.html",method= {RequestMethod.GET})
    public String login(){ 
    	
        return "web/login";  
    }
    
    @RequestMapping(value="/login2.html",method= {RequestMethod.GET})
    public String login2(){ 
    	
        return "web/login2";  
    }
//    /**
//     * 口红机后台登录
//     * @param session
//     * @return
//     */
//    @RequestMapping(value="/login.java",method= {RequestMethod.GET})
//    public String loginAction(HttpServletRequest request){ 
//    	String username = request.getParameter("name");
//    	String password = request.getParameter("password");
//    	
//        return "web/index";  
//    }
    /**
     * 口红机后台主页
     * @param session
     * @return
     */
    @RequestMapping(value="/admin-index.html",method= {RequestMethod.GET})
    public String admin(){ 
    	
        return "web/index";  
    }
    /**
     * 口红机后台默认页面
     * @param session
     * @return
     * @throws ParseException 
     */
    @RequestMapping(value="/info.html",method= {RequestMethod.GET})
    public String info(HttpSession session) throws ParseException{
    	User user = new User();
    	Order order = new Order();
    	UserReCharge userReCharge = new UserReCharge();
    	UserShareLog userShareLog = new UserShareLog();
    	
    	//根据管理员角色查询数据
    	AdminUser adminUser = new AdminUser();
    	adminUser = (AdminUser) session.getAttribute("adminUser");
    	if (adminUser.getRole() == 2) {
    		user.setSource(adminUser.getAccount());
    		order.setSource(adminUser.getAccount());
    		userReCharge.setSource(adminUser.getAccount());
    		userShareLog.setSource(adminUser.getAccount());
		}
    	
    	int userCount = userInfoServiceImpl.getCount(user);//总用户量
    	int orderCount = orderServiceImpl.getCount(order);//总订单量
    	List<UserReCharge> reChargeList = userReChargeServiceImpl.getUserReCharge(userReCharge);//总充值金额
    	double val = 0.00;
		BigDecimal reChargeCount = new BigDecimal(val);
    	for (int i = 0; i < reChargeList.size(); i++) {
    		reChargeCount = reChargeList.get(i).getTotal_fee().add(reChargeCount);
		}
    	int shareCount = userShareLogServiceImpl.getCount(userShareLog);//总分享量
    	
    	
    	SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
    	user.setCreate_time(dft.format(new Date()));
    	order.setCreate_time(dft.format(new Date()));
    	userReCharge.setCreate_time(dft.format(new Date()));
    	userShareLog.setCreate_time(dft.format(new Date()));
    	
    	int todayUserCount = userInfoServiceImpl.getCount(user);//今日用户数量
    	int todayOrderCount = orderServiceImpl.getCount(order);//今日订单数量
    	List<UserReCharge> todayReChargeList = userReChargeServiceImpl.getUserReCharge(userReCharge);//今日充值金额
		BigDecimal todayReChargeCount = new BigDecimal(val);
    	for (int i = 0; i < todayReChargeList.size(); i++) {
    		todayReChargeCount = todayReChargeList.get(i).getTotal_fee().add(todayReChargeCount);
		}
    	int toadyShareCount = userShareLogServiceImpl.getCount(userShareLog);//今日分享量
    	
    	
    	Date beginDate = new Date();
    	Calendar date = Calendar.getInstance();
    	date.setTime(beginDate);
    	date.set(Calendar.DATE, date.get(Calendar.DATE) - 1);
    	Date endDate = dft.parse(dft.format(date.getTime()));
    	
    	user.setCreate_time(dft.format(endDate));
    	order.setCreate_time(dft.format(endDate));
    	userReCharge.setCreate_time(dft.format(endDate));
    	userShareLog.setCreate_time(dft.format(endDate));
    	
    	int yesterdayUserCount = userInfoServiceImpl.getCount(user);//昨日用户数量
    	int yesterdayOrderCount = orderServiceImpl.getCount(order);//昨日订单数量
    	List<UserReCharge> yesterdayReChargeList = userReChargeServiceImpl.getUserReCharge(userReCharge);//昨日充值总额
		BigDecimal yesterdayReChargeCount = new BigDecimal(val);
    	for (int i = 0; i < yesterdayReChargeList.size(); i++) {
    		yesterdayReChargeCount = yesterdayReChargeList.get(i).getTotal_fee().add(yesterdayReChargeCount);
		}
    	int yesterdayShareCount = userShareLogServiceImpl.getCount(userShareLog);//总分享量
    	
    	Map<String,Integer> map = new HashMap<>();
    	Map<String,BigDecimal> money = new HashMap<>();
    	map.put("userCount", userCount);
    	map.put("todayUserCount", todayUserCount);
    	map.put("yesterdayUserCount", yesterdayUserCount);
    	map.put("orderCount", orderCount);
    	map.put("todayOrderCount", todayOrderCount);
    	map.put("yesterdayOrderCount", yesterdayOrderCount);
    	map.put("shareCount", shareCount);
    	map.put("toadyShareCount", toadyShareCount);
    	map.put("yesterdayShareCount", yesterdayShareCount);
    	money.put("reChargeCount", reChargeCount);
    	money.put("todayReChargeCount", todayReChargeCount);
    	money.put("yesterdayReChargeCount", yesterdayReChargeCount);
    	
    	session.setAttribute("map", map);
    	session.setAttribute("money", money);
        return "web/info";  
    }
    /**
     * 口红机主页
     * @param session
     * @return
     * @throws IOException 
     * @throws ServletException 
     */
    @RequestMapping(value="/main.html",method= {RequestMethod.GET})
    public String showAllUsers(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{ 
//    	User user = new User();
//    	user = (User) session.getAttribute("user");
//    	user = userInfoServiceImpl.getUser(user);
//    	String status = user.getStatus();
//    	//如果用户被冻结了则转发到404页面
//    	if (status.equals("N")) {
//    		RequestDispatcher requestDispatcher =request.getRequestDispatcher("error.html");
//            //调用forward()方法，转发请求      
//            requestDispatcher.forward(request,response);
//			return "";
//		}else {
//			return "mobile/main";
//		}
    	
    	return "mobile/main";
//   	User userMonry = new User();
//   	userMonry.setOpenid("oIoB31AwplYg1yUgLjY8kIRpdTDY");
//    	userMonry.setMoney((long) 100);
//    	session.setAttribute("user", userMonry);
    	
    }
    @RequestMapping(value="/error.html",method= {RequestMethod.GET})
    public String error() {
    	
    	return "web/error";
    }
    
    /**
     * 游戏界面
     */
    @RequestMapping(value="/game.html",method= {RequestMethod.GET})
    public String game(HttpSession session,HttpServletRequest request){ 
    	User userMonry = new User();
    	userMonry = (User) session.getAttribute("user");
    	if (userMonry != null) {
    		String gameMode = request.getParameter("gameMode");
        	String goodsId = request.getParameter("goodsId");
        	session.setAttribute("gameMode", gameMode);
        	session.setAttribute("goodsId", goodsId);
    		//获取游戏模式配置参数
        	List<GameConfig> gameConfig = new ArrayList<>();
    		int mode = Integer.parseInt(gameMode);
    		GameConfig config = new GameConfig();
    		config.setMode(mode);
    		gameConfig = gameConfigServiceImpl.getGameConfig(config);
    		String Config = "";
    		for (int i = 0; i < gameConfig.size(); i++) {
    			Config += "{\"num\":"+gameConfig.get(i).getNum()+",\"hard\":"+gameConfig.get(i).getHard()+",\"time\":"+gameConfig.get(i).getTime()+",\"speed_arr\":["+gameConfig.get(i).getSpeed_arr()+"]},";
    		}
    		Config = "["+Config.substring(0,Config.length()-1)+"]";
    		session.setAttribute("Config", Config);
            
    		return "mobile/game";
		}else {
			return "mobile/index";
		}
    	  
    }
    
    /**
     * 我的
     */
    @RequestMapping(value="/my.html",method= {RequestMethod.GET})
    public String my(HttpSession session){ 
    	User userMonry = new User();
    	Order order = new Order();
    	userMonry = (User) session.getAttribute("user");
    	if (userMonry != null) {
    		userMonry.setOpenid(userMonry.getOpenid());
        	//userMonry = userInfoServiceImpl.getUserList(userMonry).get(0);
    		userMonry = userInfoServiceImpl.getUser(userMonry);
        	order.setOpenid(userMonry.getOpenid());
        	int num = orderServiceImpl.getCount(order);
        	if (userMonry != null) {
        		session.setAttribute("userMonry", userMonry.getMoney());
    		}
        	if (num > 0) {
        		session.setAttribute("num", num);
    		}else {
    			session.setAttribute("num", 0);
    		}
            return "mobile/my";
		}else {
			return "mobile/index";
		}
    	
//    	userMonry.setOpenid("oIoB31AwplYg1yUgLjY8kIRpdTDY");
//    	//userMonry = userInfoServiceImpl.getUserList(userMonry).get(0);
//		userMonry = userInfoServiceImpl.getUser(userMonry);
//		session.setAttribute("user", userMonry);
//    	order.setOpenid(userMonry.getOpenid());
//    	int num = orderServiceImpl.getCount(order);
//    	if (userMonry != null) {
//    		session.setAttribute("userMonry", userMonry.getMoney());
//		}
//    	if (num > 0) {
//    		session.setAttribute("num", num);
//		}else {
//			session.setAttribute("num", 0);
//		}
//        return "mobile/my";
    	  
    }
    
    /**
     * 订单管理
     */
    @RequestMapping(value="/myorder.html",method= {RequestMethod.GET})
    public String myOrder(HttpSession session){ 
    	//暂无订单
        return "mobile/order";  
    }
    
    @RequestMapping(value="/myorderlist.html",method= {RequestMethod.GET})
    public String myOrderList(HttpSession session,HttpServletRequest request,
			   HttpServletResponse response) throws ServletException, IOException{ 
    	
    	List<Order> orders = new ArrayList<>();
    	User user = (User) session.getAttribute("user");
    	Order order = new Order();
    	order.setOpenid(user.getOpenid());
    	
    	if (user != null) {
    		orders = orderServiceImpl.getAllOrder(order);
        	
        	if (orders.size() != 0) {
        		session.setAttribute("orders", orders);
        		return "mobile/order_list"; 
    		}else {
    			RequestDispatcher requestDispatcher =request.getRequestDispatcher("myorder.html");
                //调用forward()方法，转发请求      
                requestDispatcher.forward(request,response);
    			return "";
    		}
		}else {
			return "mobile/index"; 
		}
    	
    	
        
    }
    
    /**
     * 联系我们
     */
    @RequestMapping(value="/contactus.html",method= {RequestMethod.GET})
    public String contactUs(HttpSession session){ 
    	
        return "mobile/contactus";  
    }
    /**
     *	 邀请好友生成专属海报
     * @param logoPath //二维码中间logo的路径
     * @param bgPath //海报图片路径
     * @param image //生成的二维码
     * @return
     * @throws Exception 
     */
    @RequestMapping(value="/poster.html",method= {RequestMethod.GET})
    public String poster(HttpSession session,HttpServletResponse response) throws Exception{ 
    	User user = (User) session.getAttribute("user");
    	String qrcodeUrl = WeiXinConfig.USER_DISTRIBUTION_TEST.replace("SOURCE", user.getOpenid());
    	//把URL传到前端，让前端去生成二维码
    	//session.setAttribute("qrcodeUrl", qrcodeUrl);
    	
    	//ZXing后台生成二维码
    	String logoPath = session.getServletContext().getRealPath("/") + "resource/img/qrcode/logo.jpg";
    	ClassPathResource bgPath = new ClassPathResource("img/poster.jpg");
    	BufferedImage image= QRCodeUtil.createImage(qrcodeUrl, logoPath, true);//生成二维码
    	
    	BufferedImage bg= ImageIO.read(bgPath.getInputStream());//获取北京图片
    	Graphics2D g=bg.createGraphics();
    	int width=image.getWidth(null);
    	int height=image.getHeight(null);
    	g.drawImage(image,(bg.getWidth()- width)/2,(bg.getHeight()-height-70)/2,width,height,null);
    	g.dispose();
    	bg.flush();
    	image.flush();
    	ImageIO.write(bg,"png", response.getOutputStream());
    	
        return "mobile/poster";  
    }
    
    /**
     * 	提现	
     * @param session
     * @return
     */
    @RequestMapping(value="/tackcash.html",method= {RequestMethod.GET})
    public String tackcash(HttpSession session){ 
    	
        return "mobile/tackcash";  
    }
    
    /**
     * 地址
     */
    @RequestMapping(value="/address.html",method= {RequestMethod.GET})
    public String address(HttpSession session){ 
    	
        return "mobile/address";  
    }
    
    //新增地址
    @RequestMapping(value="/addaddress.html",method= {RequestMethod.GET})
    public String addAddress(HttpSession session){ 
    	
        return "mobile/add_address";  
    }
    
    //地址列表
    @RequestMapping(value="/addresslist.html",method= {RequestMethod.GET})
    public String addressList(HttpSession session,HttpServletRequest request){ 
    	String ordernum = request.getParameter("ordernum");
    	List<Address> address = new ArrayList<>();
    	User user = new User();
    	user = (User) session.getAttribute("user");
    	
    	if (user != null) {
    		String openid = user.getOpenid();
        	address = addressServiceImpl.getAllAddress(openid);
        	session.setAttribute("address", address);
        	session.setAttribute("ordernum", ordernum);
            return "mobile/address_list"; 
		}else {
			return "mobile/index"; 
		}
    	
    	 
    }
    
}  