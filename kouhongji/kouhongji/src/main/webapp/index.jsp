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
		.img{width: 100%;height: 100%;    position: fixed;}
		.skip{
			    color: #fff;
    font-size: 1rem;
    line-height: 2rem;
    position: fixed;
    right: 2rem;
    width: 4rem;
    height: 2rem;
    /* bottom: 320px; */
    top: 2rem;
    z-index: 2;
    border: 1px solid black;
    /* float: right; */
    border-radius: 40px;
    background: #000000;
    opacity: 0.6;
    text-align: center;
		}
	</style>
	<body>
	<audio id="back_music" src="http://p8v8q53wo.bkt.clouddn.com/khj/WeChatSight5.mp3"
		loop="true" autoplay="autoplay"></audio>
		<div class="img">
			<img src="http://p8v8q53wo.bkt.clouddn.com/khj/222222.gif"style="width: 100%;height: 100%;"/>
			<a onclick="code()"><div class="skip">跳过</div></a>
		</div>
	</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript" src="resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resource/js/kouhongji.js"></script>
<script>
var url = null;
 $(document).ready(function(){
	 
	 function GetVal(name){
		 var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		 var r = window.location.search.substr(1).match(reg);
		 if(r!=null)return  unescape(r[2]); return null;
	};
	 var source = GetVal('source');
	 url = "http://www.suibianshuo.com.cn/kouhongji-test/main.html?source="+source;
	
	 var voice = document.getElementById("back_music");
	 
	//判斷 WeixinJSBridge 是否存在
     if (typeof WeixinJSBridge == "object" && typeof WeixinJSBridge.invoke == "function") {
         voice.play();
     } else {
         //監聽客户端抛出事件"WeixinJSBridgeReady"
         if (document.addEventListener) {
             document.addEventListener("WeixinJSBridgeReady", function(){
                 voice.play();
             }, false);
         } else if (document.attachEvent) {
             document.attachEvent("WeixinJSBridgeReady", function(){
                 voice.play();
             });
             document.attachEvent("onWeixinJSBridgeReady", function(){
                 voice.play();
             });
         }
     }

	 if(voice != null){
		  var duration;
	      voice.load();
	      voice.oncanplay = function () {  
		 	duration = voice.duration;
	           setTimeout(function(){
				window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4b2ad8906b2041d1&redirect_uri="+encodeURIComponent(url)+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
			}, (duration-1)*1000); 
	       }
	 }

	 
	
}) 
function code(){
	//alert("ready");
	window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4b2ad8906b2041d1&redirect_uri="+encodeURIComponent(url)+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
}
</script>
</html>
