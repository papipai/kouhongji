package com.suibianshuo.controller.mobile;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.mobile.Address;
import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.serviceImpl.mobile.AddressServiceImpl;


@Controller
public class AddressController {
	@Autowired  
    private AddressServiceImpl addressServiceImpl;
	 /**
	  * 新增地址
	  * @param phone
	  * @param address
	  * @param code
	  * @param request
	  * @param response
	  * @throws IOException
	  * @throws ServletException
	  */
    @RequestMapping(value="/addaddress.java",method= {RequestMethod.GET})
    public void addAddress(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session) throws IOException, ServletException{ 
    	int addressid = Integer.parseInt(request.getParameter("addressid"));
    	String username = request.getParameter("username");
    	String phone = request.getParameter("phone");
    	String address = request.getParameter("address");
    	String code = request.getParameter("code");
    	
    	Address add = new Address();
    	User user = (User) session.getAttribute("user");
    	String openid = user.getOpenid();
    	add.setOpenid(openid);
    	add.setUsername(username);
    	add.setPhone(phone);
    	add.setAddress(address);
    	add.setCode(code);
    	add.setCreate_time(new Date());
    	int result = 0;
    	if (addressid != 0) {
    		add.setId(addressid);
    		result = addressServiceImpl.updateAddress(add);
		}else {
			result = addressServiceImpl.addAddress(add); 
		}
    	
    	if (result > 0) {
    		RequestDispatcher requestDispatcher =request.getRequestDispatcher("addresslist.html");
            //调用forward()方法，转发请求      
            requestDispatcher.forward(request,response);
		}
    	
    	session.setAttribute("addressUpdate", null);//清楚修改地址时保存的session
    }
    /**
     * 修改地址
     * @param phone
     * @param address
     * @param code
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping(value="/updateaddress.java",method= {RequestMethod.GET})
    public String updateAddress(HttpServletRequest request,HttpSession session) throws IOException, ServletException{ 
    	int addressId = Integer.parseInt(request.getParameter("addressId"));
    	String username = request.getParameter("username");
    	String phone = request.getParameter("phone");
    	String address = request.getParameter("address");
    	String code = request.getParameter("code");
    	
    	Address addressUpdate = new Address();
    	addressUpdate.setId(addressId);
    	addressUpdate.setUsername(username);
    	addressUpdate.setPhone(phone);
    	addressUpdate.setAddress(address);
    	addressUpdate.setCode(code);
    	
    	session.setAttribute("addressUpdate", addressUpdate);
    	return "mobile/add_address";
    }
	
}
