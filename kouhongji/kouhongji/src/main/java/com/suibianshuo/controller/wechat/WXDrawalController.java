package com.suibianshuo.controller.wechat;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.suibianshuo.entity.mobile.User;
import com.suibianshuo.serviceImpl.mobile.UserServiceImpl;
import com.suibianshuo.util.wechat.CollectionUtil;
import com.suibianshuo.util.wechat.HttpUtils;
import com.suibianshuo.util.wechat.WXPayUtil;
import com.suibianshuo.util.wechat.WeiXinConfig;
import com.suibianshuo.util.wechat.XmlUtil;
@Controller
public class WXDrawalController {
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	private static final Logger LOG = Logger.getLogger(WXDrawalController.class);
	/**
	 * 企业向个人支付转账
	 * @param request
	 * @param response
	 * @param openid 用户openid
	 * @param callback
	 * @throws IOException 
	 */
	@RequestMapping(value = "/cashWithDrawal.java", method = RequestMethod.POST)
	public void transferPay(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
		//业务判断 openid是否有收款资格
		User user = new User();
		user = (User) session.getAttribute("user");
		user = userServiceImpl.getUser(user);
		String openid = user.getOpenid();
		BigDecimal money = user.getRedpacket();
		String result = "fail";
		if (money.compareTo(BigDecimal.ZERO)==0) {
			result = "low";//没有红包可提现
		}else {
			money = money.multiply(new BigDecimal(100));//乘以100，转换为分
	        money = money.subtract(money.multiply(new BigDecimal(0.01)));//用户提现到微信钱包，平台扣除提现金额的1%
			Map<String, String> restmap = null;
			float amount = money.floatValue();
			String desc = "口红机红包提现";
			String arrival_amount = String.valueOf((int)amount);
			
			if ((int)amount <= 0) {
				result = "less";//提现金额太少
			}else {
				try {
					Map<String, String> parm = new HashMap<String, String>();
					parm.put("mch_appid", WeiXinConfig.APPID); //公众账号appid
					parm.put("mchid", WeiXinConfig.MCH_ID); //商户号
					parm.put("nonce_str", WXPayUtil.generateNonceStr()); //随机字符串
					parm.put("partner_trade_no", String.valueOf(WXPayUtil.generateUUID())); //商户订单号
					parm.put("openid", openid); //用户openid	
					parm.put("check_name", "NO_CHECK"); //校验用户姓名选项 OPTION_CHECK
					//parm.put("re_user_name", "安迪"); //check_name设置为FORCE_CHECK或OPTION_CHECK，则必填
					parm.put("amount", arrival_amount); //转账金额
					parm.put("desc", desc); //企业付款描述信息
					parm.put("spbill_create_ip", WXPayUtil.getIpAddr(request)); //Ip地址
					parm.put("sign", WXPayUtil.getSign(parm, WeiXinConfig.API_KEY));
					System.out.println("arrival_amount="+arrival_amount);
					String restxml = HttpUtils.posts(WeiXinConfig.CASH_WITHDRAWAL_URL, XmlUtil.xmlFormat(parm, false));
					System.out.println("restxml="+restxml);
					restmap = XmlUtil.xmlParse(restxml);
				} catch (Exception e) {
					LOG.error(e.getMessage(), e);
				}
				if (CollectionUtil.isNotEmpty(restmap) && "SUCCESS".equals(restmap.get("result_code"))&& "SUCCESS".equals(restmap.get("result_code"))) {
					//提现成功清空用户红包
					user.setRedpacket(new BigDecimal(0));
					userServiceImpl.updateUser(user);
					//添加提现记录
					
					System.out.println("转账成功");
					result = "success";

				}else {
					System.out.println("转账失败");
					result = "fail";
				}
			}
			
		}
		
		response.getWriter().write(result);
        
	}
	
	
	


}
