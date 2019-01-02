package com.suibianshuo.util.wechat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;

import com.suibianshuo.entity.mobile.AccessToken;

import net.sf.json.JSONObject;

public class WeiXinUtil {
    //从微信后台拿到APPID和APPSECRET 并封装为常量
//    public static final String APPID = "wx251814c46ac42181";
//    public static final String APPSECRET = "2ac457d1bd6cf0996c8f726b90ff5bc7";
//    private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
//    private static final String JSAPI_TICKET_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
//    private static final String OPENID_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
//    //小活力access_token接口
//    private static final String XIAOHUOLI_ACCESS_TOKEN_URL = "https://xhlapi.suibianshuo.com.cn/wx/access-token/mofangxiu?key=mZfBXpR4uZay49Tj3833n76rutiU7Bqk";
    /**
     * 编写Get请求的方法。但没有参数传递的时候，可以使用Get请求
     * 
     * @param url 需要请求的URL
     * @return 将请求URL后返回的数据，转为JSON格式，并return
     */
    public static JSONObject doGetStr(String url) throws ClientProtocolException, IOException {
        DefaultHttpClient client = new DefaultHttpClient();//获取DefaultHttpClient请求
        HttpGet httpGet = new HttpGet(url);//HttpGet将使用Get方式发送请求URL
        JSONObject jsonObject = null;
        HttpResponse response = client.execute(httpGet);//使用HttpResponse接收client执行httpGet的结果
        HttpEntity entity = response.getEntity();//从response中获取结果，类型为HttpEntity
        if(entity != null){
            String result = EntityUtils.toString(entity,"UTF-8");//HttpEntity转为字符串类型
            jsonObject = JSONObject.fromObject(result);//字符串类型转为JSON类型
        }
        return jsonObject;
    }
    
    public static String sendGet(String url) {
        String result = "";
        BufferedReader in = null;
        try {
            //String urlNameString = url + "?" + param;
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
    
    /**
     * 编写Post请求的方法。当我们需要参数传递的时候，可以使用Post请求
     * 
     * @param url 需要请求的URL
     * @param outStr  需要传递的参数
     * @return 将请求URL后返回的数据，转为JSON格式，并return
     */
    public static JSONObject doPostStr(String url,String outStr) throws ClientProtocolException, IOException {
        DefaultHttpClient client = new DefaultHttpClient();//获取DefaultHttpClient请求
        HttpPost httpost = new HttpPost(url);//HttpPost将使用Get方式发送请求URL
        JSONObject jsonObject = null;
        httpost.setEntity(new StringEntity(outStr,"UTF-8"));//使用setEntity方法，将我们传进来的参数放入请求中
        HttpResponse response = client.execute(httpost);//使用HttpResponse接收client执行httpost的结果
        String result = EntityUtils.toString(response.getEntity(),"UTF-8");//HttpEntity转为字符串类型
        jsonObject = JSONObject.fromObject(result);//字符串类型转为JSON类型
        return jsonObject;
    }
    
    /**
     * 获取AccessToken
     * @return 返回拿到的access_token及有效期
     */
    public static AccessToken getAccessToken() throws ClientProtocolException, IOException{
        AccessToken token = new AccessToken();
        String url = WeiXinConfig.ACCESS_TOKEN_URL.replace("APPID", WeiXinConfig.APPID).replace("APPSECRET", WeiXinConfig.APPSECRET);//将URL中的两个参数替换掉
        JSONObject jsonObject = doGetStr(url);//使用刚刚写的doGet方法接收结果
        if(jsonObject!=null){ //如果返回不为空，将返回结果封装进AccessToken实体类
            token.setToken(jsonObject.getString("access_token"));//取出access_token
            token.setExpiresIn(jsonObject.getInt("expires_in"));//取出access_token的有效期
        }
        return token;
    }
    
  //通过访问小活力的接口获取access_token
    public static String getAccessTokenByXhl() throws ClientProtocolException, IOException {
    	String request = doGetStr2(WeiXinConfig.XIAOHUOLI_ACCESS_TOKEN_URL);
    	System.out.println("request="+request);
    	
    	return request;
    }
    
  //通过访问小活力的接口获取jsapi_ticket
    public static String getJsapiTicketByXhl() throws ClientProtocolException, IOException {
    	String request = doGetStr2(WeiXinConfig.XIAOHUOLI_JSAPI_TICKET_URL);
    	System.out.println("jsapi_ticket="+request);
    	return request;
    }
    
    public static String doGetStr2(String url) throws ClientProtocolException, IOException {
        DefaultHttpClient client = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url);
        String result = "";
        HttpResponse response = client.execute(httpGet);
        HttpEntity entity = response.getEntity();
        if(entity != null){
            result = EntityUtils.toString(entity,"UTF-8");
        }
        return result;
    }
    
    /**
     * 调用微信JS接口的临时票据
     * 
     * @param access_token 接口访问凭证
     * @return
     * @throws IOException 
     * @throws ClientProtocolException 
     */
    public static AccessToken getJsApiTicket(String ACCESS_TOKEN) throws ClientProtocolException, IOException {
    	AccessToken token = new AccessToken();
    	//String ACCESS_TOKEN = token.getToken();
    	String jsapi_ticket_url = WeiXinConfig.JSAPI_TICKET_URL.replace("ACCESS_TOKEN", ACCESS_TOKEN);//将URL中的参数替换掉
        // 发起GET请求获取凭证
    	JSONObject ticketJsonObject = doGetStr(jsapi_ticket_url);//使用刚刚写的doGet方法接收结果
        if (null != ticketJsonObject) {
            try {
            	token.setJsapiTicket(ticketJsonObject.getString("ticket"));//取出ticket
            } catch (JSONException e) {
                // 获取token失败
                //log.error("获取token失败 errcode:{} errmsg:{}", jsonObject.getInt("errcode"), jsonObject.getString("errmsg"));
            }
        }
        return token;
    }
    
    /**
     * 获取openID和access_token
     */
    public Map<String,String> getOpenIdAndAccessToken(String code) throws ClientProtocolException, IOException {
    	Map<String,String> map = new HashMap<String, String>();
    	if (code != null && code != "null" && code != "") {
    		String url = WeiXinConfig.OPENID_URL.replace("APPID", WeiXinConfig.APPID).replace("SECRET", WeiXinConfig.APPSECRET).replace("CODE", code);
            String openid = null;
            String access_token = null;
            net.sf.json.JSONObject jsonObject = WeiXinUtil.doGetStr(url);
            if (jsonObject != null) {
            	openid = jsonObject.getString("openid");
            	access_token = jsonObject.getString("access_token");
            	System.out.println("openid="+openid);
            	System.out.println("access_token="+access_token);
            	map.put("openid", openid);
            	map.put("access_token", access_token);
    		}
		}
		return map;
    }
}