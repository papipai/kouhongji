<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/basepase/BasePath.jsp"%>
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
		<style>
			html,
			body {
				background: #fff;
			}
			
			a {
				color: #ff27a4;
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
		<link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer">
	</head>

	<body>
		<div class="pages" style="">
			
			<div class="kh_img" id="bindstat">
				<a href="main.html">
					<img src="resource/img/noorder.png">
				</a>
			</div>
			<div class="tips"> 您还没有相关订单呦，立即赢口红吧！</div>
			<a href="main.html">
				<div class="kh_text">立即挑战</div>
			</a>
		</div>
		<div class="lists" id="lists">

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
</html>