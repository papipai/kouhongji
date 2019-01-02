<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page language="java" import="com.suibianshuo.util.wechat.WeiXinUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="resource/css/web/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="resource/css/web/style.css"/>
        <link rel="stylesheet" href="resource/css/web/ace.min.css" />
        <link rel="stylesheet" href="resource/css/web/font-awesome.min.css" />
        <link href="resource/css/web/codemirror.css" rel="stylesheet">
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="resource/js/web/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
        		<!--[if !IE]> -->
		<script src="resource/js/jquery-3.3.1.min.js"></script>        
		<!-- <![endif]-->
        <script src="resource/js/web/bootstrap.min.js"></script>            
       <title></title>
       </head>		
<body>
<div class="page-content clearfix">
 
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <div class="panel">
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
							  <div class="right">
								  <h1>${map.userCount }</h1>
	                              <p>总用户量</p>
							  </div>
                              <div class="left">
								  <h3>${map.yesterdayUserCount }</h3>
	                              <p>昨日新增</p>
								  <h3>${map.todayUserCount }</h3>
	                              <p>今日新增</p>
							  </div>
							  
                          </div>
                      </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <div class="panel">
                          <div class="symbol red">
                              <i class="icon-tags"></i>
                          </div>
                          <div class="value">
                          	  <div class="right">
								  <h1>${map.shareCount }</h1>
	                              <p>总分享人数</p>
							  </div>
                              <div class="left">
								  <h3>${map.yesterdayShareCount }</h3>
	                              <p>昨日分享</p>
								  <h3>${map.toadyShareCount }</h3>
	                              <p>今日分享</p>
							  </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <div class="panel">
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <div class="right">
								  <h1>${map.orderCount }</h1>
	                              <p>总订单量</p>
							  </div>
                              <div class="left">
								  <h3>${map.yesterdayOrderCount }</h3>
	                              <p>昨日订单</p>
								  <h3>${map.todayOrderCount }</h3>
	                              <p>今日订单</p>
							  </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <div class="panel">
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                              
                          </div>
                          <div class="value">
                              <div class="right">
								  <h1>￥${money.reChargeCount }</h1>
	                              <p>充值总额</p>
							  </div>
                              <div class="left">
								  <h3>${money.yesterdayReChargeCount }</h3>
	                              <p>昨日总额</p>
								  <h3>${money.todayReChargeCount }</h3>
	                              <p>今日总额</p>
							  </div>
                          </div>
                      </div>
                  </div>
              </div>
             <!--实时交易记录-->
             <!-- <div class="clearfix">
              <div class="Order_Statistics ">
          <div class="title_name">订单统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">未处理订单：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           <tr><td class="name">待发货订单：</td><td class="munber"><a href="#">10</a>&nbsp;个</td></tr>
           <tr><td class="name">待结算订单：</td><td class="munber"><a href="#">13</a>&nbsp;个</td></tr>
           <tr><td class="name">已成交订单数：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           </tbody>
          </table>
         </div> 
         <div class="Order_Statistics">
          <div class="title_name">商品统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">商品总数：</td><td class="munber"><a href="#">340</a>&nbsp;个</td></tr>
           <tr><td class="name">回收站商品：</td><td class="munber"><a href="#">10</a>&nbsp;个</td></tr>
           <tr><td class="name">上架商品：</td><td class="munber"><a href="#">13</a>&nbsp;个</td></tr>
           <tr><td class="name">下架商品：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           <tr><td class="name">商品评论：</td><td class="munber"><a href="#">21s6</a>&nbsp;条</td></tr>

           </tbody>
          </table>
         </div> 
         <div class="Order_Statistics">
          <div class="title_name">会员登录统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">注册会员登录：</td><td class="munber"><a href="#">3240</a>&nbsp;次</td></tr>
           <tr><td class="name">新浪会员登录：</td><td class="munber"><a href="#">1130</a>&nbsp;次</td></tr>
           <tr><td class="name">支付宝登录：</td><td class="munber"><a href="#">1130</a>&nbsp;次</td></tr>
           <tr><td class="name">QQ会员登录：</td><td class="munber"><a href="#">1130</a>&nbsp;次</td></tr>
           </tbody>
          </table>
         </div> 
             <div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div>
         <div class="news_style">
          <div class="title_name">最新消息</div>
          <ul class="list">
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">6月共处理订单3451比，作废为...</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
          </ul>
         </div> 
         </div> -->
 <!--记录-->

   
     </div>
</body>
</html>
<script type="text/javascript">
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.no-radius').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-640);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-640);
		});
 });
	 
	 
 </script>   