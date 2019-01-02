package com.suibianshuo.util.common;

import java.text.SimpleDateFormat;
import java.util.Date;


public class SOLEIDUtil {
	private static long orderNum = 0l;  
    private static String date ; 
    
    
    
    public static synchronized String getGoodsId(){
    	String strs = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		char str = strs.charAt((int)(Math.random() * 26));
		char str2 = strs.charAt((int)(Math.random() * 26));
    	
		return String.valueOf(str)+ String.valueOf(str2)+SOLEIDUtil.getOrderNo();
    	
    }
	
	 /** 
     * 生成数字唯一码 
     * @return 
     */  
    public static synchronized String getOrderNo() {  
        String str = new SimpleDateFormat("yyMMddHHmm").format(new Date());  
        if(date==null||!date.equals(str)){  
            date = str;  
            orderNum  = 0l;  
        }  
        orderNum ++;  
        long orderNo = Long.parseLong((date)) * 10000;  
        orderNo += orderNum;;  
        return orderNo+"";  
    }
}
