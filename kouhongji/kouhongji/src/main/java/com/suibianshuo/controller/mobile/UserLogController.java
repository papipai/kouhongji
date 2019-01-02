package com.suibianshuo.controller.mobile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.entity.mobile.UserPlayLog;
import com.suibianshuo.entity.mobile.UserShareLog;
import com.suibianshuo.serviceImpl.mobile.UserPlayLogServiceImpl;
import com.suibianshuo.serviceImpl.mobile.UserShareLogServiceImpl;


@Controller
public class UserLogController {
	@Autowired  
    private UserShareLogServiceImpl userShareLogServiceImpl;
	
	@Autowired  
    private UserPlayLogServiceImpl userPlayLogServiceImpl;
	/**
	 * 添加用户分享日志
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 * @throws ServletException
	 */
    @RequestMapping(value="/addUserShareLog.java",method= {RequestMethod.GET})
    public void addUserShareLog(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session) throws IOException, ServletException{ 
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	UserShareLog userShareLog = new UserShareLog();
    	User user = (User) session.getAttribute("user");
    	userShareLog.setCreate_time(sdf.format(new Date()));
    	userShareLog.setOpenid(user.getOpenid());
    	int num = userShareLogServiceImpl.addUserShareLog(userShareLog);
    	String result = null;
    	if (num > 0) {
    		result = "success";
		}
    	response.getWriter().write(result);
    }
    
    /**
     * 用户游戏日志
     * @param request
     * @param response
     * @param session
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping(value="/addUserPlayLog.java",method= {RequestMethod.GET})
    public void addUserPlayLog(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session) throws IOException, ServletException{ 
    	//接收参数
    	String is_success = request.getParameter("result");
    	String mode = request.getParameter("mode");
    	String goodsid = request.getParameter("goodsid");
    	String fail_level = request.getParameter("fail_level");
    	String device = request.getParameter("device");
    	
    	UserPlayLog userPlayLog = new UserPlayLog();
    	//取出session中的user
    	User user = (User) session.getAttribute("user");
    	
    	//设置参数
    	if (StringUtils.isNotEmpty(user.getOpenid())) {
    		userPlayLog.setOpenid(user.getOpenid());
		}
    	if (StringUtils.isNotEmpty(is_success)) {
    		userPlayLog.setIs_success(is_success);
		}
    	if (StringUtils.isNotEmpty(mode)) {
    		userPlayLog.setMode(Integer.parseInt(mode));
		}
    	if (StringUtils.isNotEmpty(goodsid)) {
    		userPlayLog.setGoodsid(Integer.parseInt(goodsid));
		}
    	if (StringUtils.isNotEmpty(fail_level)) {
    		userPlayLog.setFail_level(Integer.parseInt(fail_level));
		}
    	if (StringUtils.isNotEmpty(device)) {
    		userPlayLog.setDevice(device);
		}
    	userPlayLog.setPlay_time(new Date());
    	
    	//执行插入
    	userPlayLogServiceImpl.addUserPlayLog(userPlayLog);
    }
}
