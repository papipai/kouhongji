package com.suibianshuo.controller.wechat;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.suibianshuo.util.wechat.Sign;
import com.suibianshuo.util.wechat.WeiXinConfig;
import com.suibianshuo.util.wechat.WeiXinUtil;

@Controller
public class ShareSignController {
	
	/**
	 * 分享接口签名
	 * @param url
	 * @param response
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
//    @RequestMapping(value="/initWXJSInterface.java",method= {RequestMethod.GET})
//    public void initWXJSInterface(String url,HttpServletResponse response) throws ClientProtocolException, IOException{
//    	url = URLDecoder.decode(url,"UTF-8");//解码
//    	String jsapi_ticket = WeiXinUtil.getJsapiTicketByXhl();
//    	Map<String, String> ret = new HashMap<>();
//    	if (jsapi_ticket != null) {
//    		ret = Sign.sign(jsapi_ticket, url);
//    		ret.put("appId", WeiXinConfig.APPID);
//		}
//		Gson gson = new Gson();
//		String recJson = gson.toJson(ret);
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().append(recJson);
//	}
    
    @RequestMapping(value="/initWXJSInterface.java",method= {RequestMethod.GET})
    public void initWXJSInterface(String url,HttpServletResponse response) throws ClientProtocolException, IOException{
    	url = URLDecoder.decode(url,"UTF-8");//解码
    	
    	String accessToken = WeiXinUtil.getAccessTokenByXhl();
    	String jsapi_ticket = "";
    	
    	Map<String, String> ret = new HashMap<>();
    	if (accessToken != null) {
    		jsapi_ticket  = WeiXinUtil.getJsApiTicket(accessToken).getJsapiTicket();
    		ret = Sign.sign(jsapi_ticket, url);
    		ret.put("appId", WeiXinConfig.APPID);
		}
    	
		Gson gson = new Gson();
		String recJson = gson.toJson(ret);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(recJson);
	}
}
