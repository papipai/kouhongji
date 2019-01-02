<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/basepase/BasePath.jsp"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
		<title>我的订单</title>
		<link rel="stylesheet" href="resource/css/weui.css">
		<link rel="stylesheet" href="resource/css/notime.css">
		<link rel="stylesheet" href="resource/css/kouhong.css">
		<link rel="stylesheet" href="resource/css/layer.css" id="layuicss-skinlayercss">

<link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer">
		<style>
			html,
			body {
				background: #FEF5F8;
				padding-top: 9px;
			}
			
			.lists {
				width: 100%;
				height: auto;
			}
			
			.list-item {
				width: 94%;
				margin: 0 3%;
				height: 140px;
				border-bottom: 1px solid #eee;
			}
			
			.list-item .l-top {
				width: 100%;
				display: flex;
				display: -webkit-flex;
				justify-content: space-between;
				margin-top: 10px;
				color: #333333;
				font-size: 14px;
			}
			
			.list-item .l-center {
				width: 100%;
				display: flex;
				display: -webkit-flex;
				justify-content: space-between;
				color: #333333;
			}
			
			.list-item .l-center>img {
				width: 80px;
				height: 80px;
			}
			
			.list-item .l-center .l-g-info {
				flex: 5;
				height: 80px;
				color: #333333;
				font-size: 14px;
				margin-left: 5px;
			}
			
			.list-item .l-center .l-g-info>div {
				line-height: 26.6666666px;
			}
			
			.list-item .l-center .l-g-info>div>span {
				font-size: 10px;
				background: #ff27a4;
				padding: 3px 5px;
				color: #fff;
				margin-right: 3px;
			}
			
			.list-item .l-center .l-g-go {
				flex: 1;
				line-height: 80px;
				text-align: right;
			}
			
			.list-item .l-center .l-g-go>img {
				width: 20px;
				height: 20px;
				margin-top: 30px;
			}
			
			.list-item .l-bot {
				width: 100%;
				text-align: right;
				height: 30px;
			}
			
			.list-item .l-bot>span {
				background: #ff27a4;
				padding: 7px 10px;
				color: #fff;
				font-size: 12px;
				border-radius: 5px;
			}
			
		</style>
		<style type="text/css">
			.address_list{
			    margin: 0px 15px 9px 15px;
			    border: 0px solid red;
			    border-radius: 4px;
			    background: #ffffff;
			    height: 3.5em;
			    display: flex;
			    display: -webkit-flex;
			}
			.address_list .bbb{
				flex: 1;
				height: 100%;
				display: flex;
			    display: -webkit-flex;
			}
			.select{
				border: 0px solid red;
				width: 3.1em;
				height: 100%;
			}
			.select img{
				width:1.375em;
				height: 1.125em;
				margin: 25px 19px 15px 9px;
			}
			.address{
				border: 0px solid red;
				height: 100%;
				flex: 1;
				display: flex;
				flex-direction: column;
			}
			.user_name{
			    border: 0px solid red;
				flex: 1;
				width: 100%;
				opacity: 0.87;
				font-family: PingFangSC-Regular;
				font-size: 14px;
				color: #000000;
				padding-top: 10px;
			}
			.address_details{
				border: 0px solid red;
				flex: 1;
				width: 100%;
				opacity: 0.54;
				font-family: PingFangSC-Regular;
				font-size: 12px;
				color: #000000;
				padding-bottom: 10px;
			}
			.update{
				border: 0px solid red;
				width:  4.25em;
				height: 100%;
			}
			.update_address{
				font-family: PingFangSC-Regular;
				font-size: 12px;
				color: #FD536E;
				text-align: center;
				padding: 22px 10px 20px 10px;
				line-height: 100%;
				display: block;
			}
			.address_list_add{
			 	border: 0px solid red;
				height: 2.6875em;
				margin: 0px 15px 9px 15px;
			    border: 0px solid red;
			    border-radius: 4px;
			    background: #ffffff;
			    display: flex;
			    display: -webkit-flex;
			}
			.add_btn{
				border: 0px solid red;
				width: 3.1em;
				height: 100%;
			}
			.add_btn img{
				width:1.1875em;
				height: 1.1875em;
				margin: 12px 20px 12px 11px;
			}
			.address_add_btn{
				border: 0px solid red;
				height: 100%;
				flex: 1;
				font-family: PingFangSC-Regular;
				font-size: 12px;
				color: #000000;
			}
			.address_add_icon{
				border: 0px solid red;
				height: 100%;
				width: 2.375em;
			}
			.address_add_icon img{
				width:0.5em;
				height:0.8125em;
				margin: 15px;
			}
			.address_add_btn_word{
				padding: 13px 0px;
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
		<link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer">
	</head>

	<body>
		<div class="lists" id="lists">
			<input type="hidden" id="ordernum" value="${ordernum}">	
			<c:forEach items="${address}" var="item" varStatus="status">
            	<div class="address_list">
            		<div class="bbb"  onclick="choiceAddress(this,${item.id})">
            			<div class="select" id="choiceImg${item.id}">
						<!-- <img  src="resource/img/select_address.png"> -->
						</div>
						<div class="address">
							<div class="user_name">${item.username}  ${item.phone}</div>
							<div class="address_details">${item.address}</div>
						</div>
            		</div>
            		<input type="hidden" id="choiceAddressId" value="">
					<div class="update">
						<a class="update_address" href="updateaddress.java?username=${item.username }&addressId=${item.id}&phone=${item.phone}&address=${item.address}&code=${item.code}">点击修改</a>
					</div>
				</div>
            </c:forEach>
			<a href="addaddress.html">
				<div class="address_list_add">
					<div class="add_btn">
						<img src="resource/img/add_address.png">
					</div>
					<div class="address_add_btn">
						<div class="address_add_btn_word">新增地址</div>
					</div>
					<div class="address_add_icon">
						<img src="resource/img/Chevron.png">
					</div>
				</div>
			</a>
			<div class="button">
				<button style="border：none;" onclick="confirmAddress()">确认地址</button>
			</div>
			
		</div>
		<div style="width:100%;height:80px;"></div>
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
<script src="resource/js/layer.js"></script>
<script type="text/javascript">
//选择地址
function choiceAddress(obj,choiceAddressId){
	var id = '#choiceImg'+choiceAddressId;
	var str = "<img src='resource/img/select_address.png'>";
	//判断.select下面是否含有img标签，有就清除，然后再给choiceAddressId添加img
	if ($('.select img').length>0) {
		$(".select img").remove();
	}
	$(id).append(str);
	$("#choiceAddressId").val(choiceAddressId);
}

//确认地址
function confirmAddress(){
	var addressid = $("#choiceAddressId").val();
	var ordernum = $("#ordernum").val();
	if (addressid == null || typeof(addressid) == "undefined" || addressid == "") {
		layer.msg('请选择地址');
	}else{
		window.location.href = "updateorder.java?addressid="+addressid+"&ordernum="+ordernum+"&status=2&device=phone";
	}
}
</script>
</html>