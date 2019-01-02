<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" import="com.suibianshuo.util.wechat.WeiXinUtil" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>口红机后台管理</title>  
    <link rel="stylesheet" href="resource/css/web/pintuer.css">
	<link rel="stylesheet" href="resource/css/web/admin.css">
	<script src="resource/js/web/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="resource/img/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <c:if test="${adminUser.role == 1 }">
  	<h2><span class="icon-user"></span>基本设置</h2>
	  <ul style="display:block">
	    <li><a href="info.html" target="right"><span class="icon-caret-right"></span>后台首页</a></li>
	    <li><a href="info.html" target="right"><span class="icon-caret-right"></span>公众号配置</a></li>
	    <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>关卡参数</a></li>
	    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>游戏素材</a></li>  
	    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>商品管理</a></li>
	  </ul>   
	  <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
	  <ul>
	    <li><a href="userList.html" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
	    <li><a href="orderList.html" target="right"><span class="icon-caret-right"></span>用户订单</a></li>
	    <li><a href="userChargeList.html" target="right"><span class="icon-caret-right"></span>充值记录</a></li>        
	  </ul> 
	  <h2><span class="icon-pencil-square-o"></span>日志管理</h2>
	  <ul>
	    <li><a href="adv.html" target="right"><span class="icon-caret-right"></span>闯关日志</a></li>   
	    <li><a href="book.html" target="right"><span class="icon-caret-right"></span>分享日志</a></li>     
	    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>推广日志</a></li>        
	  </ul>
  </c:if>
  <c:if test="${adminUser.role == 2 }">
 	  <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
	  <ul style="display:block">
	    <li><a href="info.html" target="right"><span class="icon-caret-right"></span>后台首页</a></li>
	    <li><a href="userList.html" target="right"><span class="icon-caret-right"></span>用户管理</a></li> 
	    <li><a href="userChargeList.html" target="right"><span class="icon-caret-right"></span>充值记录</a></li>      
	  </ul>
  </c:if>
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="info.html" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>