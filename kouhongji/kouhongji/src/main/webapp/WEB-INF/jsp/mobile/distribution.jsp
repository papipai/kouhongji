<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" import="com.suibianshuo.util.wechat.WeiXinUtil" %>

<!-- saved from url=(0052)https://wx.zdslj.cn/app/index.php?i=3&c=entry&eid=25 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
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
    <link rel="stylesheet" href="resource/css/weui.css">
    <link rel="stylesheet" href="resource/css/kouhong.css">
    <link rel="stylesheet" href="resource/css/index.css">
    <link rel="stylesheet" href="resource/css/swiper.min.css">

<style>
a{
	color:#FD536E;
}
.swiper-container-notice{
	height:30px;
	line-height:30px;
	overflow:hidden;
	color:#333333;
}
.copyright{
    width: 80%;
    margin: 0 10%;
    text-align: center;
    font-size: 13px;
}
</style>
<style>
#redplain{
	color: #fff;
}
#redplain #explain_title{
	font-family: .PingFang-SC-Medium;
	font-size: 18px;
	color: #FD536E;
	letter-spacing: 0.42px;
	text-align: left;
}
.modal-body div{
	font-family: PingFangSC-Regular;
	font-size: 16px;
	color: #FD536E;
	letter-spacing: 0.45px;
	text-align: left;
	padding: 10px;
}
.page__bd{
	border: 0px black solid;
	
}
.page__bd .myfriend{
	background: #FEF5F8;
	opacity: 0.87;
	font-family: PingFangSC-Regular;
	font-size: 20px;
	letter-spacing: 0.34px;
	text-align: center;
	padding: 5px 0px;
}
#gooslist{
	display: flex;
	display: -webkit-flex;
}
#gooslist .friend-list{
	width: 100%;
	height: 80px;
	border: 0px red solid;
	display: flex;
	display: -webkit-flex;
	flex-direction: row;
}
#gooslist .friend-list .friend-img{
	width: 80px;
	height: 80px;
	border: 0px red solid;
	display: flex;
	display: -webkit-flex;
    justify-content: center;
    align-items: center;
}
#gooslist .friend-list .friend-img img{
	width: 50px;
	height: 50px;
	border-radius: 25px;
	border: 0px red solid;
}
#gooslist .friend-list .friend-msg{
	flex:1;
	height: 80px;
	border: 0px red solid;
	display: flex;
	display: -webkit-flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #eee;
}
#gooslist .friend-list .friend-msg .muprofit{
	padding-right: 15px;
	font-family: PingFangSC-Regular;
	font-size: 14px;
	color: #000000;
	letter-spacing: 0.24px;
}
#gooslist .friend-list .friend-msg .friend-name{
	font-family: PingFangSC-Regular;
	font-size: 14px;
	color: #000000;
	letter-spacing: 0.24px;
}
.redpacket-sum{
	font-family: PingFangSC-Regular;
	font-size: 26px;
	color: #FFFFFF;
	letter-spacing: 0.44px;
    text-align: center;
}
.myredpacket{
	font-family: PingFangSC-Regular;
	font-size: 20px;
	color: #FFFFFF;
	letter-spacing: 0.34px;
	text-align: center;
}
.operation{
	width: 100%;
	margin-top: 49px;
}
.operation .invitation{
	background: #FD536E;
	border-radius: 4px;
	text-align: center;
	color: #fff;
	font-family: PingFangSC-Regular;
	font-size: 20px;
	letter-spacing: 0.34px;
	padding: 6px 0px;
	margin: 0px 75px;
}
.operation .tack-out-cash{
	border: 1px solid #FD536E;
	border-radius: 4px;
	text-align: center;
	color: #FD536E;
	font-family: PingFangSC-Regular;
	font-size: 20px;
	letter-spacing: 0.34px;
	padding: 4px 0px;
	margin: 14px 75px 40px 75px;
}
.operation a{
	
	display: block;
}
</style>
<link rel="stylesheet" href="resource/css/layer.css" id="layuicss-skinlayercss">

<link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer"></head>

<body style="--wx_color:#ff27a4;--wx_color1:#ff27a4;--wx_color2:#fff1f4;--wx_fcolor:#333333;--wx_fcolor1:#999999;background: #fff;">
<div class="page" id="page">
    <div class="bg_img" style="background:url(resource/img/shouye.png) no-repeat; background-size:100% auto;-moz-background-size:100% auto;">
        <div class="kh_title flexColumn">
            <div class="kh_explain" id="redplain">红包规则</div><br />
            <input type="hidden" value="邀请红包规则" id="explain_title">
            <input type="hidden" value="1.邀请的好友所产生消费的15%将返
送给你。

2.好友返送的红包可直接转到余额或提现

3.如有疑问，请关注我们官方微信公
众号 强劲小说。

" id="explain_info">
			<div class="redpacket-sum">${redpacket }元</div>
			<div class="myredpacket">我的红包</div>
        </div>
        <div class="operation">
        	<a href="poster.html" class="invitation">邀请好友</a>
        	<a href="tackcash.html" class="tack-out-cash">提现</a>
        </div>
        <div class="kh_body page__bd" style="padding: 0">
        	<div class="myfriend">我的好友</div>
            <c:forEach items="${userReChargeList}" var="item" varStatus="status">
            <div class="item_cell_box" id="gooslist"> 
            	     
	            	<div class="friend-list">
	            		<div class="friend-img">
	            			<img src="${item.headimgurl}">
	            		</div>
	            		<div class="friend-msg">
	            			<div class="friend-name">${item.nickname}</div>
	            			<div class="muprofit">红包：${item.total_fee}元</div>
	            		</div>
	            	</div>
            	
            </div>
            </c:forEach>
            <c:if test="${userReChargeList == null}">
            	<div style="text-align: center;padding: 20px 15px;color: #FD536E;"> 
	            	你目前还没有好友，赶快邀请好友一起赚口红吧
	            </div>
            </c:if>
            
        </div>
        <div style="clear:both;"></div>
        <div class="copyright"></div>
        <div style="width:100%;height:80px;"></div>
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
</div>
<div id="dialogs">
    <div class="js_dialog" id="showModal2" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog modal-dialog">
            <div class="weui-dialog_hd kh_none" id="mtitle"></div>
            <div class="weui-dialog_bd">
                <div class="modal-body">
                	<div>1.邀请的好友所产生消费的15%将返送给你。</div>
                    <div>2.好友返送的红包可直接转到余额或提现</div>
                    <div>3.如有疑问，请关注我们官方微信公众号 强劲小说。</div>
                    <!-- <textarea class="kh_sm" id="minfo" style="border:none;width:100%;height:220px;">1.邀请的好友所产生消费的15%将返
送给你。

2.好友返送的红包可直接转到余额或提现

3.如有疑问，请关注我们官方微信公
众号 强劲小说。

</textarea> -->
                </div>
            </div>

            <!--<div class="weui-dialog_ft">

            </div>-->

        </div>
    </div>


</div>

<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/js/layer.js"></script>
<script src="resource/js/swiper.min.js"></script>
<script>
var page = 1;
//下拉加载
var range = -50; //距下边界长度/单位px
var totalheight = 0;
var loading = false;
$(window).scroll(function(){
	if(loading) return false;
	var srollPos = $(window).scrollTop(); //滚动条距顶部距离(页面超出窗口的高度)
	totalheight = parseFloat($('body').height()) + parseFloat(srollPos);
	if(($("body").height()-range) <= totalheight) {
		if(loading) return false;
		page++;
	}            
});



    var audio = document.getElementById('music1');
    var music_pic = "https://wx.zdslj.cn/addons/junsion_winaward/public/resource/img/voice_icon.png";
    var mute_pic = "https://wx.zdslj.cn/addons/junsion_winaward/public/resource/img/no_voice_icon.png";
    $("#onmusicTap").bind("touchstart", function bf() {
        if(audio !== null) {
//检测播放是否已暂停.audio.paused 在播放器播放时返回false.
//alert(audio.paused);
            if(audio.paused) {
                audio.play(); //audio.play();// 这个就是播放
                $("#onmusicTap").attr("src",music_pic)
            } else {
                audio.pause(); // 这个就是暂停
                $("#onmusicTap").attr("src",mute_pic)
            }
        }
    })
document.addEventListener('DOMContentLoaded', function() {
	audioAutoPlay('music1');
});
function audioAutoPlay(obj) {
	var audio = document.getElementById(obj);
	audio.play();
	document.addEventListener("WeixinJSBridgeReady", function() {
		audio.play();
	}, false);
}
new Swiper('.swiper-container-notice', {
  autoplay: 2500,//可选选项，自动滑动
  direction : 'vertical',
  loop:true
})
$(function(){
	layer.closeAll();
	    var $showModal2 = $('#showModal2'),
        $showModal3 = $('#showModal3'),
        $showModal4 = $('#showModal4'),
        $androidDialog2 = $('#androidDialog2');

    $('#dialogs').on('click', '.js_dialog', function(){
        $(this).fadeOut(200);
        $("#page").removeClass("pages");
    });

    $('#bindenotice').on('click', function(){
        var title=$("#notce_title").text();
        var info=$("#notce_info").val();
        $("#mtitle").text(title);
        $("#minfo").text(info);
        $("#page").addClass("pages");
        $showModal2.fadeIn(200);
    });
    $('#redplain').on('click', function(){
        var title=$("#explain_title").val();
        var info=$("#explain_info").val();
        $("#mtitle").text(title);
        $("#minfo").text(info);
        $("#page").addClass("pages");
        $showModal2.fadeIn(200);
    });

    $("#onConfirm").click(function(event){
        event.stopPropagation();
        $showModal3.fadeOut(200);
        $showModal4.fadeIn(200);
    })
});
</script>
<script>
/**
 * 选择口红开启挑战
 */
var memMoney = "0";//用户余额
    function bindgome(gid, price){
    	$.ajax({
    		async:false,
    		type:'post',
			url:"updateMyBalance.java",
			data:{"goodsPrice": price},
			dataType:"text",
			success:function(data){
				
				var monry = data.split(",")[0];
				var startGame = data.split(",")[1];
				
				if (monry != "yes") {
					$("#charge_goods_id").val(gid);
					var $showModal3 = $('#showModal3');
		            $showModal3.fadeIn(200);
				}else{
					if(!gid || gid==0){
		    			layer.msg('商品错误，请重新选择');
		    			return false;
		    		}
					/* if(!confirm('确认闯关吗？')){
		    			return false;
		    		} */
					var layerIndex = layer.load(2, {shade: 0.3}); 
					
					if (startGame == "startGame") {
						var url = "game.html?gameMode=1&goodsId="+gid;
						var layerIndex = layer.load(2, {shade: 0.3}); 
						location.href = url;//这是应该是跳到游戏的正式挑战页面
						layer.close(layerIndex); 
					}else if(startGame == "recharge"){
						var $showModal3 = $('#showModal3');
    		            $showModal3.fadeIn(200);
					}else{
						layer.msg(data.msg);
					}
				}
			},error:function(){
				layer.msg('网络错误，请刷新重试');
			}
    	});
    	
    }
</script>
<script type="text/javascript">
/* var phoneWidth = parseInt(window.screen.width);
var phoneScale = phoneWidth/640;
var ua = navigator.userAgent;
if (/Android (\d+\.\d+)/.test(ua)){
    var version = parseFloat(RegExp.$1);
    if(version>2.3){
        document.write("<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0, minimum-scale = 1.0, maximum-scale = "+phoneScale+", target-densitydpi=device-dpi\">");
    }else{
        document.write("<meta name=\"viewport\" content=\"width=device-width, target-densitydpi=device-dpi\">");
    }
}else{
    document.write("<meta name=\"viewport\" content=\"width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi\">");
} */
 
function initPay(index, money){
	if(!is_weixin()){
		alert("请在微信客户端打开该链接");
	}else if(!weixin_version()){
		alert("你微信版本太低，不支持微信支付功能，请先更新你的微信");
	}else{
		if(typeof WeixinJSBridge == "undefined"){
			if( document.addEventListener ){
				document.addEventListener('WeixinJSBridgeReady', initPay, false);
			}else if (document.attachEvent){
				document.attachEvent('WeixinJSBridgeReady', initPay); 
				document.attachEvent('onWeixinJSBridgeReady', initPay);
			}
		}else{
			toPay(index, money);
		}
	}
}
 
function goRecharge(index, money){
	$.ajax({
		async: false,
		url : "toPayInit.java",
		type:"POST",
		dataType : 'json', // 服务器返回的格式,可以是json或xml等
		data:{payMoney:money*100},
		success : function(result) {// 服务器响应成功时的处理函数
			//alert("result="+result+" prepay_id="+result.prepay_id);
		console.log("result.result="+result.result);
			if(result.result==1){//插入支付记录
				var paySign = result.paySign;
				var prepay_id = result.prepay_id;
				var nonceStr = result.noncestr;
				var timestamp = result.timestamp;
				var unifiedOrderRequest = result.unifiedOrderRequest;
				var spbill_create_ip = unifiedOrderRequest.spbill_create_ip;
				var detail = unifiedOrderRequest.detail;
				var body = unifiedOrderRequest.body;
				var out_trade_no = unifiedOrderRequest.out_trade_no;
				
				onBridgeReady(paySign,prepay_id,nonceStr,timestamp,spbill_create_ip,detail,body,out_trade_no,money);
			}else{
				layer.msg('初始化支付接口失败，请联系系统运营商');
			}
		},
		error : function(data, status, e) { // 服务器响应失败时的处理函数
			layer.msg('初始化支付接口失败，请联系系统运营商');
		}
	});
}
 
function onBridgeReady(paySign,prepay_id,nonceStr,timestamp,spbill_create_ip,detail,body,out_trade_no,money){
   //alert("paySign="+paySign+" prepay_id="+prepay_id+" nonceStr="+nonceStr+" timestamp="+timestamp+" spbill_create_ip="+spbill_create_ip+" detail="+detail+" body="+body+" out_trade_no="+out_trade_no+" money="+money);
	WeixinJSBridge.invoke(
       'getBrandWCPayRequest', {
           "appId":"wx251814c46ac42181",     //公众号名称，由商户传入     
           "timeStamp":timestamp,         //时间戳，自1970年以来的秒数     
           "nonceStr":nonceStr, //随机串     
           "package":"prepay_id="+prepay_id,     
           "signType":"MD5",         //微信签名方式：     
           "paySign":paySign //微信签名 （这个签名获取看后台）
       },
       function(res){
    		// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
        	    $.ajax({
					url : "toSavePayInfo.java",
					type:"POST",
					dataType : 'json', // 服务器返回的格式,可以是json或xml等
					data:{
						spbill_create_ip:spbill_create_ip,
						detail:detail,
						body:body,
						out_trade_no:out_trade_no,
						total_fee:money
					},
					success : function(result) { // 服务器响应成功时的处理函数
						//alert(result);
						if(result == "success"){//插入支付记录
							//onBridgeReady(paySign,prepay_id,nonceStr,timestamp);
							layer.msg('充值成功，开始挑战吧');
							/* var url = "game.html?gameMode=1&goodsId="+$("#charge_goods_id").val();;
							var layerIndex = layer.load(2, {shade: 0.3}); 
							location.href = url;//这是应该是跳到游戏的正式挑战页面
							layer.close(layerIndex); */
						}
					},
					error : function(data, status, e) { // 服务器响应失败时的处理函数
						layer.msg('系统出错，请联系系统运营商');
					}
				}); 
           }else if(res.err_msg == "get_brand_wcpay_request:cancel" ) {
        	   layer.msg('充值失败，请重新充值');
           }    
       }
   ); 
}
</script>

<script>
/*
 * 获取用户信息
 */
$(document).ready(function(){
	
	function GetRequest() {
		var url = location.search; //获取url中"?"符后的字串
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for(var i = 0; i < strs.length; i ++) {
				theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
			}
		}
		return theRequest;
	}
	var Request = new Object();
	Request = GetRequest();
	
	var code = Request['code'];
	var source = Request['source'];
	if (code != null && code != "null") {
		$.ajax({
			 async: false,
			 type:'post',
			 url:'userMsg',
			 data:{"code":code,"source":source}
		 });
	}
})

</script>
<!-- <script type="text/javascript">
    // 对浏览器的UserAgent进行正则匹配，不含有微信独有标识的则为其他浏览器
    var useragent = navigator.userAgent;
    if(useragent.match(/WindowsWechat/) == 'WindowsWechat' || useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
        // 这里警告框会阻塞当前页面继续加载
        //alert('已禁止本次访问：您必须使用微信内置浏览器访问本页面！');
        document.head.innerHTML = '<title>抱歉，出错了</title><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0"><link rel="stylesheet" type="text/css" href="https://res.wx.qq.com/open/libs/weui/0.4.1/weui.css">';
        document.body.innerHTML = '<div class="weui_msg"><div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div><div class="weui_text_area"><h4 class="weui_msg_title">请在微信客户端打开链接</h4></div></div>';

    }
</script> -->
</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript" src="resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resource/js/kouhongji.js"></script>
<script type="text/javascript">


</script>
</html>