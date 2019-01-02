<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page language="java" import="com.suibianshuo.util.wechat.WeiXinUtil" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link href="resource/css/web/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="resource/js/web/page/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="resource/js/web/page/jqPaginator.min.js" type="text/javascript"></script>
	<link href="resource/css/web/myPage.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	        function loadData(num) {
	            $("#PageCount").val("100000");
	        }
	    </script>
</head>
<body>
<div>
        <ul class="pagination" id="pagination">
        </ul>
        <input type="hidden" id="PageCount"  value="100"/>
        <input type="hidden" id="PageSize"  value="200" />
        <input type="hidden" id="countindex"  value="10000"/>
        <!--设置最多显示的页码数 可以手动设置 默认为7-->
        <input type="hidden" id="visiblePages" value="7" />
    </div>
<script src="resource/js/web/page/myPage.js" type="text/javascript"></script>
</body>
</html>