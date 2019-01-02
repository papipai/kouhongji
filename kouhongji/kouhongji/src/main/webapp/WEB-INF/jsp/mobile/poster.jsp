<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/basepase/BasePath.jsp"%>
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
		<title>口红机</title>
	</head>
	<style>
	body{
	width:100%;
	height:100%;
	margin: 0;
	padding: 0;
	}
	.img{width: 100%;height: auto;    position: fixed;}
	.tipmsg{background: #FEF5F8;font-family: PingFangSC-Regular;
font-size: 16px;
color: #FD536E;
letter-spacing: 0.45px;height: auto;text-align: center;display: flex;align-items:flex-end;padding: 0px 15px}
	.code{
		display: block;
		border: 1px red solid;
		width: 87px;
		height: 87px;
		position: absolute;
		top:260px;
		left: 150px;
	}
	</style>
	<style type="text/css">
#canbox {
	width: 100%;
	height: 100%;
	position: fixed;
	display: none;
	top: 0;
	bottom: 0;
	left: 0;
}
.canimg {
	width: 100%;
	height: auto;
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
}
</style>
	
	<body>
		<div class="img" id="poster">
			<img id="srcImg" class="canimg" src="poster.html/bg"/>
		</div>
		<div class="tipmsg">
			长按海报保存到手机，分享至朋友圈；好友扫码进入后即可获得红包
		</div>
		<!-- 前端生成二维码 -->
		<%-- <div id="qrcode" style="display: none">
			<input type="hidden" id="qrcodeUrl" value="${qrcodeUrl }">
		</div>
		<div id="canbox">
		    <canvas id="myCanvas" width="" height=""></canvas>
		    <canvas id="codebg" width="" height=""></canvas>
		</div>
		<img id="srcImg" class="canimg" src=""/> --%>
		
		
	</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript" src="resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resource/js/kouhongji.js"></script>
<!-- 前端生成二维码依赖的js -->
<!-- <script type="text/javascript" src="resource/js/qrcode/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="resource/js/qrcode/jquery.qrcode.min.js"></script> -->
<script>
/**
 * 前端生成二维码并与背景图合成
 缺点：兼容性差，有些手机无法把图片偏保存下来
 */
/* $(document).ready(function(){
	var width = document.documentElement.clientWidth; //宽度  
	var height = width/0.62718; // 高度
	var codeWidth = width*0.232;//二维码宽度
	var codeHeight = width*0.232;//二维码高度
	var cutHeiht = width*0.32;//canvas绘制二维码时高度减去的值
	console.log("codeWidth="+codeWidth+" codeHeight="+codeHeight+" cutHeiht="+cutHeiht);
	console.log("qrcodeUrl="+$("#qrcodeUrl").val());
	$("#qrcode").qrcode({
		width: codeWidth, //宽度  
		height: codeHeight, //高度  
		correctLevel:0,
		background : "#ffffff",
		text: $("#qrcodeUrl").val(), //任意内容  
	});
	
	//画海报
	
	var c = document.getElementById("myCanvas");
	c.width = width
	c.height = height
	var ctx = c.getContext("2d");
	//首先画上背景图
	var img = new Image();
	img.src = "http://p8v8q53wo.bkt.clouddn.com//khj/9b33d1ef-443f-4cab-8c2b-3bb896ed5a991.jpg";
	img.setAttribute("crossOrigin", 'Anonymous')
	//var x_bot = height - 44  //画上名字
	//ctx.font = "19px Georgia";

	//画上二维码
	function convertCanvasToImage(canvas) {
		var image = new Image();
		image.src = canvas.toDataURL("image/png");
		return image;
	}
	var mycans = $('canvas')[0];//二维码所在的canvas
	var codeimg = convertCanvasToImage(mycans)
	var xw = (width-codeWidth)/2
	var xh = (height-cutHeiht)/2
	console.log("xw="+xw+" xh="+xh);
	img.onload = function() { //必须等待图片加载完成
		ctx.drawImage(img, 0, 0, width, height); //绘制图像进行拉伸
		//ctx.fillText("tets", 28, x_bot);
		ctx.drawImage(codeimg, xw, xh, codeWidth, codeHeight);
		ctx.drawImage(codeimg, xw, xh, codeWidth, codeHeight);
		
		
		
		//绘制完成,转为图片
		setTimeout(function() {  //在ios上无法在画完之后取到整个画布内容，加了个settimeout
			var bigcan = $('canvas')[1];
			//console.log("bigcan="+bigcan);
			let images = new Image();
			images.src = bigcan.toDataURL("image/png");
			console.log("img="+bigcan.toDataURL("image/png"));
			var imgStr = bigcan.toDataURL("image/png");
			images.setAttribute("crossOrigin", 'Anonymous');
			$('.canimg').attr('src', bigcan.toDataURL("image/png"));
		}, 0)
	}
}) */

</script>
<script>
$(document).ready(function(){
	var clientHeight = document.documentElement.clientHeight;
	var posterHeight = $("#poster").height();
	$(".tipmsg").css("height",clientHeight-posterHeight);
	console.log("clientHeight="+clientHeight+" posterHeight="+posterHeight+" height="+(clientHeight-posterHeight));

});
</script>
</html>
