<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/basepase/BasePath.jsp"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script>
//获取连接后拼的参数
function GetVal(name){
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
 var r = window.location.search.substr(1).match(reg);
if(r!=null)return  unescape(r[2]); return null;
};
var Afrom = GetVal('from')||0;
if(Afrom != 0)window.location.href = "index.html";
</script>
<title>新增地址</title>
<link rel="stylesheet" href="resource/css/weui.css">
		<link rel="stylesheet" href="resource/css/notime.css">
		<link rel="stylesheet" href="resource/css/kouhong.css">
		<script type="text/javascript" src="resource/js/kouhongji.js" deffer="deffer"></script>
<style type="text/css">
body{
width:100%;
height: 100%;
}
.form{
border:0px solid red;
width: 100%;
height: auto;
margin: auto 12px;
}
.input{
border-bottom: 1px solid #d8d8d8;
width: 100%;
height: 52px;
}
.input input{
width: 100%;
height: 50px;
border: none;
color: #000000;
font-size: 17px;
}
.button{
text-align: center;
margin-top: 189px;
}
.button button{
width:240px;
height: 45px;
border-radius: 22.5px;
background: #FD536E;
text-align: center;
margin: auto;
color: #ffffff;
font-size: 20px;
border: none;
margin-right: 12px;
}
</style>
</head>
<body>
	<div class="form">
		<form action="addaddress.java">
			<c:choose>
				<c:when test="${addressUpdate != null }">
					<input type="hidden" id="addressid" name="addressid" value="${addressUpdate.id }">
					<div class="input">
						<input id="username" name="username" value="${addressUpdate.username }" placeholder="收货人">
					</div>
					<div class="input">
						<input id="phone" name="phone" value="${addressUpdate.phone }" placeholder="手机号码">
					</div>
					<div class="input">
						<input id="address" name="address" value="${addressUpdate.address }" placeholder="详细地址">
					</div>
					<div class="input">
						<input id="code" name="code" value="${addressUpdate.code }" placeholder="邮政编码">
					</div>
				</c:when>
				<c:otherwise>
					<input type="hidden" id="addressid" name="addressid" value="0">
					<div class="input">
						<input id="username" name="username" value="" placeholder="收货人">
					</div>
					<div class="input">
						<input id="phone" name="phone" value="" placeholder="手机号码">
					</div>
					<div class="input">
						<input id="address" name="address" value="" placeholder="详细地址">
					</div>
					<div class="input">
						<input id="code" name="code" value="" placeholder="邮政编码">
					</div>
					
					
				</c:otherwise>
			</c:choose>
					<div class="button">
						<button style="border：none;">保存地址</button>
					</div>
			
		</form>
	</div>
	<div class="footer_box" style="background:#ffffff">
		    <div class=" footer_in">
		        <div class="item_cell_boxs">
		                        <div class="footer_item" style="width:50%">
		                <a href="main.html" class="footer_button click_button" style="background:#fff;">
		                    <img class="footer_item_img" src="resource/img/kouhong2.png">
		                    <div class="footer_item_name"style="color: #000;opacity: 0.54;">赢口红</div>
		                </a>
		            </div>
		            <div class="footer_item" style="width:50%">
		                <a href="#" class="footer_button click_button" style="background:#fff;">
		                    <img class="footer_item_img" src="resource/img/my1.png">
		                    <div class="footer_item_name">我的</div>
		                </a>
		            </div>
		                    </div>
		    </div>
		</div>
</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript" src="resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resource/js/kouhongji.js"></script>

</html>