<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<!-- saved from url=(0086)https://jwsykhtrial.suyuemobi.com/game.html?uid=undefined&res=&rand=&pid=&pay=-1&gid=1 -->
<html lang="en" style="font-size: 50px;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="edge">
<meta name="viewport"content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<script>
	//获取连接后拼的参数
	function GetVal(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	};
	var Afrom = GetVal('from') || 0;
	if (Afrom != 0)
		window.location.href = "index.html";
</script>
<script type="text/javascript"
	src="resource/js/jquery-3.3.1.min.js?v=1543302934"></script>
<script type="text/javascript">
/**
 * 获取游戏配置数据
 */
  
/*  $(document).ready(function(){
	 $.ajax({
			url : "getGameConfig.java",
			type:"get",
			dataType : 'json', // 服务器返回的格式,可以是json或xml等
			data:{mode:$("#gameMode").val()},
			success : function(result) { // 服务器响应成功时的处理函数
				 var goodGame = "";
				for (var i = 0; i < result.length; i++) {
					goodGame += '{"num":'+result[i].num+',"hard":'+result[i].hard+',"time":'+result[i].time+',"speed_arr":['+result[i].speed_arr+']},'
				}
				goodGame = "["+goodGame.substring(0,goodGame.length-1)+"]";
				console.log("goodGame="+goodGame);
				$("#gameConfig").val(goodGame); 
			}
		});
 }); */ 

</script>
<title>口红机</title>
<link rel="stylesheet" href="resource/css/game/game.css?v=1543302934">


<script type="text/javascript"
	src="resource/js/bodymovin.js?v=1543302934"></script>
<!-- <script type="text/javascript" src="../addons/junsion_winaward/public/js/jweixin-1.3.0.js?v=1543302934"></script> -->
<script type="text/javascript"
	src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>

<script type="text/javascript"
	src="resource/js/jquery.cookie.js?v=1543302934"></script>
<style>
.wx_no {
	font-size: 15px;
	display: block;
	text-align: center;
	color: #333333;
}

.wx_no>span {
	font-size: 22px;
	color: #ff27a4;
}
.share_mark{
width: 100%;
height: 100%;
background-color:rgba(0,0,0,0.6);
position:fixed;
z-index:1;
display: none;
}
.share_mark img{
width: 100%;
}
</style>
</head>

<body
	style="-wx_color: #ff27a4; - -wx_color1: #ff27a4; - -wx_color2: #fff1f4;">
	<input type="hidden" id="gameMode" value="${gameMode }">
	<input type="hidden" id="goodsId" value="${goodsId }">
	<input type="hidden" id="gameConfig" value='${Config }' />
	<input type="hidden" id="num1" value="2">
	<audio id="back_music"
		src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/background_audio.mp3"
		loop="true"></audio>
	<audio id="collision_audio"
		src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/collision_audio.wav"></audio>
	<audio id="Countdown_10s_audio"
		src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/Countdown_10s_audio.mp3"></audio>
	<audio id="gameSuccess_audio"
		src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/gameSuccess_audio.mp3"></audio>
	<audio id="insert_audio"
		src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/insert_audio.mp3"></audio>
	<audio id="success_audio"
		src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/success_audio.mp3"></audio>
	<div class="levelSwitchBox" id="levelSwitchBox" style="display: block;">
		<img id="levelSwitchBoxMain" class="levelSwitchBoxMain"
			src="http://p8v8q53wo.bkt.clouddn.com/khj/level_1Switch_main.png">
		<!--<img class="levelSwitchBoxBottom" src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/level_Switch_bottom.png">-->
	</div>
	<div class="share_mark" id="share_mark">
		<img class="share_img" src="http://p8v8q53wo.bkt.clouddn.com//khj/sharetofriend.png">
	</div>
	<div class="PopupBox" id="gameOverBox" style="display: none;">
		<div id="gameOverClose" class="close">
			<img
				src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/close_btn.jpg">
		</div>
		<div id="gameOverBoxTitle"style="color: #FD536E;">挑战失败</div>
		<!-- <div id="gameOverBoxTime">5s</div> -->
		<div class="PopupBoxBtn" id="gameOverBoxBtn"
			style="margin-top: 0.8rem;background-color:#FD536E;">重新挑战</div>
		
	</div>
	<div class="PopupBox" id="gameSuccessBox" style="display: none;">
		<div id="gameSuccessClose" class="close">
			<img
				src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/close_btn.jpg">
		</div>
		<div id="gameSuccessBoxText"style="color: #FD536E;">体验结束</div>
		<div class="PopupBoxBtn" id="gameSuccessBoxBtn"style="background-color:#FD536E;">开始挑战</div>
	</div>
	<!-- 游戏结束弹窗 -->
	<div class="PopupBox" id="gameOverMsgBox" style="display: none;">
		<div id="gameMsgClose" class="close">
			<img
				src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/close_btn.jpg">
		</div>
		<div id="gameSuccessMsgText"
			style="font-size: 16px; width: 60%; margin-left: 20%; line-height: 20px;"></div>
		<div class="PopupBoxBtn" id="gameOverMsgBtn"></div>
	</div>


	<div class="layoutRoot" id="app"
		style="background: url(http://p8v8q53wo.bkt.clouddn.com/khj/game_bg.png); background-size: cover; background-repeat: no-repeat;">
		<!-- <div id="return" style="position: absolute;top: 0;left: 0;background-color: red;z-index: 9;">123</div> -->
		<!-- <div id="StartLog" style="position: absolute;top: 200px;left: 0;background-color: red;z-index: 9;font-size: 10px;">123</div> -->
		<!-- <div id="SuccessLog" style="position: absolute;top: 300px;left: 0;background-color: red;z-index: 9;font-size: 10px;">123</div>
    <div id="FailLog" style="position: absolute;top: 400px;left: 0;background-color: red;z-index: 9;font-size: 10px;">123</div> -->
		<div class="game" id="game" style="width: 375px; height: 667px;">
			<div class="bulletsNumBox">
				<img class="bulletsNum" id="bulletsNum1"
					src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/6.png">
				<img class="bulletsNum" id="bulletsNum2" src=""
					style="display: none;">
			</div>
			<canvas style="position: relative; z-index: 3" id="gameStage"
				width="375" height="667"></canvas>
			<div id="bm"
				style="width: 100%; height: 100%; position: fixed; background-color: rgba(0, 0, 0, 0); top: 5.3rem; transform: translate(-5%, -1%); z-index: 2">
				<svg xmlns="http://www.w3.org/2000/svg" width="750" height="1334"
					viewBox="0 0 750 1334" preserveAspectRatio="xMidYMid meet"
					style="width: 100%; height: 100%;">
					<defs>
					<clipPath id="animationMask_vxInPdlJeI">
					<rect width="750" height="1334" x="0" y="0"></rect></clipPath></defs>
					<g clip-path="url(#animationMask_vxInPdlJeI)">
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path>
					<path stroke-linecap="butt" stroke-linejoin="miter"
						fill-opacity="0" stroke-miterlimit="4" style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path>
					<path stroke-linecap="butt" stroke-linejoin="miter"
						fill-opacity="0" stroke-miterlimit="4" style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path>
					<path stroke-linecap="butt" stroke-linejoin="miter"
						fill-opacity="0" stroke-miterlimit="4" style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path>
					<path stroke-linecap="butt" stroke-linejoin="miter"
						fill-opacity="0" stroke-miterlimit="4" style="display: none;"></path></g></g>
					<g style="-webkit-user-select: none; display: none;">
					<g>
					<path style="display: none;"></path></g></g></g></svg>
			</div>
			<div class="tips">
				<p id="currentLevel">
					当前关数: <span>1</span>
				</p>
				<p id="gameTip"></p>
			</div>

			<div class="levelbox" id="levelbox">
				<div class="level">
					<img id="level_1"
						src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/level_icon_1_active.png">
				</div>
				<div class="level">
					<img id="level_2"
						src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/level_icon_2.png">
				</div>
				<div class="level">
					<img id="level_3"
						src="https://wx.zdslj.cn/addons/junsion_winaward/public/img/level_icon_3.png">
				</div>
			</div>
			<div id="timebox"
				style="background: url(resource/img/timebox.png); background-size: contain; background-repeat: no-repeat;">0</div>
		</div>
	</div>
	<script type="text/javascript">
		document.body.addEventListener('touchmove', function(e) {
			e.preventDefault(); //阻止默认的处理方式(阻止下拉滑动的效果)
		}, {
			passive : false
		}); //passive 参数不能省略，用来兼容ios和android
		var baseUrl = function GetRequest() {
			var url = location.search; //获取url中"?"符后的字符串
			var theRequest = new Object();
			if (url.indexOf("?") != -1) {
				url = url.split("?")[1];
				strs = url.split("&");
				for (var i = 0; i < strs.length; i++) {
					theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
				}
			}
			return theRequest;
		}
		var jsonParamsAlias = baseUrl();

		var gameIntGameStartData = {
			"user_id" : jsonParamsAlias.uid,
			"game_prefix" : jsonParamsAlias.prefix,
			"randomNum" : jsonParamsAlias.rand,
			"product_id" : jsonParamsAlias.pid,
			"game_pay" : jsonParamsAlias.pay
		}

		var jsonParams = {
			"game_id" : jsonParamsAlias.gid,
			"game_pay" : jsonParamsAlias.pay,
			"product_id" : jsonParamsAlias.pid,
			"randomNum" : jsonParamsAlias.rand,
			"game_result" : jsonParamsAlias.res,
			"user_id" : jsonParamsAlias.uid
		}
		console.log(jsonParams)
		var cookieDelTime = new Date(Math.floor(new Date(
				new Date().getTime() + 150000)));
		$.cookie('game_cookie', null);
		$.cookie('game_cookie', JSON.stringify(jsonParams), {
			expires : cookieDelTime
		});
		//console.log($.cookie('game_cookie'));
		var anim = bodymovin.loadAnimation({
			wrapper : document.querySelector('#bm'),
			animType : 'svg',
			loop : false,
			autoplay : false,
			prerender : true,
			path : '../addons/junsion_winaward/public/js/data.json'
		});
		function play() {
			anim.goToAndStop(0, true)
			anim.play()
		}
		document.addEventListener('DOMContentLoaded', function() {
			audioAutoPlay('back_music');
		});
		function audioAutoPlay(obj) {
			var audio = document.getElementById(obj);
			audio.play();
			document.addEventListener("WeixinJSBridgeReady", function() {
				audio.play();
			}, false);
		}
		function audioAutoPlay1(obj) {
			wx.config({
				debug : false,
				appId : '',
				timestamp : 1,
				nonceStr : '',
				signature : '',
				jsApiList : []
			});
			wx.ready(function() {
				document.getElementById(obj).pause()
				document.getElementById(obj).play();
			});
		}
		document.addEventListener('visibilitychange', function(e) {
			function audioStop() {
				var audio = document.getElementById('back_music');
				document.hidden ? audio.pause() : audio.play();
				document.addEventListener("WeixinJSBridgeReady", function() {
					document.hidden ? audio.pause() : audio.play();
				}, false);
			}
			audioStop();
		});
	</script>


</body>
<script>
	/**
	 * 配置游戏参数
	 */
	var sysGame = '{"bgmusic":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/background_audio.mp3","insert":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/insert_audio.mp3","noinsert":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/collision_audio.wav","suc":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/success_audio.mp3","gamesuc":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/gameSuccess_audio.mp3","time":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/Countdown_10s_audio.mp3","timebg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/timebox_bg.png","bg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/bg.jpg","Lip":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/Sword_small_gray.png","bot":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/level_Switch_bottom.png","close":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/close_btn.jpg","time1":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/1.png","time2":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/2.png","time3":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/3.png","time4":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/4.png","time5":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/5.png","time6":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/6.png","time7":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/7.png","time8":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/8.png","time9":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/9.png","time0":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/0.png","0":{"bg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/CircleCenter_1.png","lbg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/CircleCenter_1_split_left.png","rbg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/CircleCenter_1_split_right.png","switch":"http:\/\/p8v8q53wo.bkt.clouddn.com\/khj\/level_1Switch_main.png","level":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/level_icon_1_active.png","Lip1":"resource\/img\/Lipstick_1.png","Lip2":"resource\/img\/Sword_small_1.png"},"1":{"bg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/CircleCenter_2.png","lbg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/CircleCenter_2_split_left.png","rbg":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/CircleCenter_2_split_right.png","switch":"http:\/\/p8v8q53wo.bkt.clouddn.com\/khj\/level_2Switch_main.png","level":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/level_icon_2_active.png","level1":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/level_icon_2.png","Lip1":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/Lipstick_2.png","Lip2":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/Sword_small_2.png"},"2":{"bg":"http:\/\/p8v8q53wo.bkt.clouddn.com\/khj\/CircleCenter_3.png","lbg":"http:\/\/p8v8q53wo.bkt.clouddn.com\/khj\/CircleCenter_3_split_left.png","rbg":"http:\/\/p8v8q53wo.bkt.clouddn.com\/khj\/CircleCenter_3_split_right.png","switch":"http:\/\/p8v8q53wo.bkt.clouddn.com\/khj\/level_3Switch_main.png","level":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/level_icon_3_active.png","level1":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/level_icon_3.png","Lip1":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/Lipstick_3.png","Lip2":"https:\/\/wx.zdslj.cn\/addons\/junsion_winaward\/public\/img\/Sword_small_3.png"}}';
	sysGame = JSON.parse(sysGame);
	var goodGame = $("#gameConfig").val();
	console.log("gameConfig="+goodGame);
	//var goodGame = '[{"num":6,"hard":1,"time":30,"speed_arr":[-0.04,-0.02,-0.01,0.01,0.03,0.05,0.05]},{"num":10,"hard":1,"time":40,"speed_arr":[-0.04,-0.02,-0.01,0.01,0.03,0.05,0.05]},{"num":13,"hard":3,"time":50,"speed_arr":[-0.08,-0.06,-0.04,0.03,0.05,0.07,0.09]}]';
	//console.log("  goodGame="+goodGame);
	goodGame = JSON.parse(goodGame);
	var nowMid = "";
	var nowOid = "";
	//var gameMode = $("#gameMode").val();
	var logId = 0;
	var tmpTotalLevel = 3;
	if (nowMid && nowMid > 0)
		tmpTotalLevel = 4;
	var initUrl = "main.html";//开始挑战
	var appUrl = "myorderlist.html";
	var nowWindow = "2";
</script>
<script src="resource/js/JicemoonMobileTouch.js?v=1543302934"></script>
<script src="resource/js/HardestGame-min.js?v=1543302934"></script>
<script type="text/javascript"
	src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script src="resource/js/index-min.js?v=1543302934"></script>

</html>
