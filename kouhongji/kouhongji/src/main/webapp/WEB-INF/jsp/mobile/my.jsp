<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<!-- saved from url=(0070)https://wx.zdslj.cn/app/index.php?i=3&c=entry&do=my&m=junsion_winaward -->
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
    <link rel="stylesheet" href="resource/css/member.css">
	<link rel="stylesheet" href="resource/css/layer.css" id="layuicss-skinlayercss">

<style>
a{
color:#333333;
}
    .mask {
        display: none;
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
        background-color: rgba(0,0,0,.5);
        z-index: 999999;
    }
    .mask > img.share_img {
        width: 80%;
        position: relative;
        top: 10px;
        left: 10%;
    }
    .dolist{
    	width:100%;
		height:auto;
		margin-top:30px;
		margin-bottom:100px;
		border-top: 1px solid #eee;
    }
    .list-item{
    	display:flex;
		display: -webkit-flex;
		width:100%;
		height:50px;
    }
    .list-item .l-item{
    	width:100%;
    	height:50px;
    	display:flex;
		display: -webkit-flex;
		border-left:1px solid #eee;
		border-bottom:1px solid #eee;
		margin-left: 15px;
    }
    .list-item .l-item.l-border{
    	border-left:none;
    }
    .list-item .l-item>img{
    	width:20px;
    	height:20px;
    	margin-top:15px;
    }
    .list-item .l-item>div{
    	line-height:50px;
    	margin-left:10px;
    	color:#333333;
    }
    .copyright{
	    width: 80%;
	    margin: 0 10%;
	    text-align: center;
	    font-size: 13px;
	    margin-bottom: 70px;
	}
	.kh_title>span{
		padding: 3px 5px;
	    background: #fff;
	    color: #ff27a4;
	    border: 1px solid #fff;
	    border-radius: 5px;
	    font-size: 10px;
	    margin-left: 7px;
	}
	.kh_title>img{
		width:20px;
		height:20px;
	    vertical-align: sub;
	    margin-right:5px;
	}
	.b-item{
		width: 100%;
		display:flex;
		height:80px;
		-moz-box-shadow:1px 1px 3px #ff27a4; 
		-webkit-box-shadow:1px 1px 3px #ff27a4; 
		box-shadow:1px 1px 3px #ff27a4;
		border: 1px solid #ff27a4;
    	border-radius: 5px;
		margin: 10px 0;
	}
	.b-item .b-img{
		width: 60px;
		display:flex;
		height:60px;
		border-radius: 50%;
	}
	.b-item .b-title{
		flex:2;
		height:80px;
		line-height:80px;
		color: #333333;
		text-align: left;
	}
	.b-item .b-price{
		flex:1;
		height:80px;
		line-height:80px;
		color: #ff27a4;
		text-align: right;
		margin-right:10px;
	}
	.list-item .l-item .jiantou{
	width: 8px;
    height: 13px;
    line-height: 50px;
    color: #cccccc;
    font-weight: bold;
    position: absolute;
    right: 16px;
	}
</style><link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer"></head>

<body style="--wx_color:#ff27a4;--wx_color1:#ff27a4;--wx_color2:#fff1f4;--wx_fcolor:#333333;--wx_fcolor1:#999999;">
<!--we7/pages/user/user.wxml-->
<div class="page " id="page">
    <div class="bg_img" style="background:url(resource/img/wode_beijin.png) no-repeat; background-size:100% auto;-moz-background-size:100% auto">
        <div class="header" style="padding-top:17px;">
            <div class="kh_user">
                <img id="header_url" src="${sessionScope.user.headimgurl}">
            </div>
                        <div class="kh_title" style="font-size:17px;">${sessionScope.user.nickname}</div>
                        <div class="kh_title" style="font-size:14px;">ID:263532</div>
        </div>
        <div class="kh_box">
            <div class="kh_box_item">
                <a href="myorderlist.html" class="kh_grid line" id="my_kh">
                    <div class="kh_grid_box">
                        <div class="kh_grid_img">
                            <img class="kouhong" src="resource/img/kouhong1.png">
                        </div>
                        <div class="kh_grid_num" id="kh_num">${num }</div>
                    </div>
                    <div class="kh_my">我的口红</div>
                </a>
                <a href="" class="kh_grid line" id="my_kh">
                    <div class="kh_grid_box">
                    	<div class="kh_grid_img">
                            <img class="yue" src="resource/img/balance.png">
                        </div>
                    	<div class="kh_grid_pic">${userMonry }</div>
                    </div>
                    <div class="kh_my">我的余额</div>
                </a>
                <!--                <a href="https://wx.zdslj.cn/app/index.php?i=3&amp;c=entry&amp;do=with&amp;m=junsion_winaward" class="kh_grid">
                    <div class="kh_my">可提现红包</div>
                    <div class="kh_grid_box">
                        <div class="kh_grid_pic"><text id="kh_pic">0</text><text>元</text></div>
                    </div>
                </a>-->
                            </div>
        </div>
    </div>
    <!-- 菜单 -->
    <div class="dolist">
    	<div class="list-item">
       		<a href="myorderlist.html" class="l-item l-border">
       			<img src="resource/img/order.png">
       			<div>订单管理</div>
       			<img class="jiantou" src="resource/img/Chevron.png">
       		</a>
       	</div>
       	<div class="list-item">
       		<a href="contactus.html" class="l-item l-border">
       			<img src="resource/img/call.png">
       			<div>联系我们</div>
       			<img class="jiantou" src="resource/img/Chevron.png">
       		</a>
       	</div>
    	<div class="list-item">
       		<a href="distribution.html" class="l-item l-border">
       			<img src="resource/img/fenxiao.png">
       			<div>邀请好友赢红包</div>
       			<img class="jiantou" src="resource/img/Chevron.png">
       		</a>
       	</div>
       	       	       	<!--<div class="list-item">
       		<a onclick="showCommission()" class="l-item l-border">
       			<img src="resource/js/commission.png">
       			<div>分销说明</div>
       		</a>
       		<a href="https://wx.zdslj.cn/app/index.php?i=3&amp;c=entry&amp;do=custom&amp;m=junsion_winaward" class="l-item">
       			<img src="resource/js/mycustom.png">
       			<div>联系客服</div>
       		</a>
       	</div>-->
       	       	    </div>
    <div class="copyright"></div>
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
<div class="js_dialog" id="showModal2" style="display: none;">
    <div class="weui-mask" onclick="hideCommission()" style="z-index: 10001;"></div>
    <div class="weui-dialog modal-dialog" style="margin-top: 50px;z-index: 10001;">
        <div class="weui-dialog_hd kh_none" id="mtitle">分销说明</div>
        <div class="weui-dialog_bd">
            <div class="modal-body">
                <textarea class="kh_sm" id="minfo" style="border:none;width:100%;height:250px;">一级余额分佣比例
获得余额佣金奖励 15%  红包提现分佣奖励15%

二级余额分佣比例
获得余额佣金奖励 10%  红包提现分佣奖励10%

三级级余额分佣比例
获得余额佣金奖励 10%   </textarea>
            </div>
        </div>
        <div class="weui-dialog_ft">

        </div>
    </div>
</div>
<div class="js_dialog" id="showModal3" style="display: none;">
    <div class="weui-mask" onclick="hideLevelDes()" style="z-index: 10001;"></div>
    <div class="weui-dialog modal-dialog" style="margin-top: 50px;z-index: 10001;">
        <div class="weui-dialog_hd kh_none" id="mtitle">升级说明</div>
        <div class="weui-dialog_bd">
            <div class="modal-body">
                <textarea class="kh_sm" id="minfo" style="border:none;width:100%;height:250px;rsize:none;"></textarea>
            </div>
        </div>
        <div class="weui-dialog_ft">
			<div class="kh_btn" onclick="showLevelInfo()" id="onConfirm">我要升级</div>
        </div>
    </div>
</div>
<div class="js_dialog" id="showModal4" style="display: none;">
    <div class="weui-mask" onclick="hideLevelInfo()" style="z-index: 10001;"></div>
    <div class="weui-dialog modal-dialog" style="margin-top: 50px;z-index: 10001;">
        <div class="weui-dialog_hd kh_none" id="mtitle">我要升级</div>
        <div class="weui-dialog_bd">
            <div class="modal-body">
                            </div>
        </div>
        <div class="weui-dialog_ft">
			<!-- <div class="kh_btn" onclick="showLevelInfo()" id="onConfirm">我要升级</div> -->
        </div>
    </div>
</div>

</div>
<script src="resource/js/jquery-3.2.1.min.js"></script>
<script src="resource/js/layer.js"></script>
<script src="resource/js/jweixin-1.4.0.js"></script>
<script type="text/javascript">
        var shareData = {
        			title: "",
      	      		link: "https://wx.zdslj.cn/app/index.php?i=3&c=entry&do=index&m=junsion_winaward",
      	      		desc: "",
                	imgUrl: ""
        	   };
        jssdkconfig = null || { jsApiList:[] };
        jssdkconfig.debug = false;
        jssdkconfig.jsApiList = ['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','showOptionMenu','chooseWXPay','chooseImage','uploadImage','addCard','chooseCard','openCard'];
    	wx.config(jssdkconfig);
        	wx.ready(function () {
        	    wx.onMenuShareAppMessage(shareData);
        	    wx.onMenuShareTimeline(shareData);
        	    wx.onMenuShareQQ(shareData);
        	    wx.onMenuShareWeibo(shareData);
        	    
        	});
</script><script>
$(function(){
	layer.closeAll();
})
var orderid = 0;
function goUp(lid){
	$('#showModal4').fadeOut(200);
	var layerIndex = layer.load(2, {shade: 0.3}); 
	$.ajax({
		type:'post',
		url:"./index.php?i=3&c=entry&do=doup&m=junsion_winaward",
		data:{op: 'app',lid: lid},
		success:function(data){
			layer.close(layerIndex); 
			layer.closeAll();
			data = JSON.parse(data);
			if(data.code==1){
				var json = data.res;
				orderid = json.orderid;
				WeixinJSBridge.invoke('getBrandWCPayRequest', json, function (res) {
                      if (res.err_msg === "get_brand_wcpay_request:ok") {
                    	  checkorder();
                      } else {
                    	  layer.msg('支付失败')
                      }
                  });
			}
			else if(data.code==2){
				location.href = data.url;
			}
			else{
				layer.msg(data.msg);
			}
		}
		,error:function(){
			layer.msg('网络错误，请刷新重试');
		}
	});
}
function checkorder(){
	if(orderid > 0){
		$.ajax({
			 type:'POST',
			 data:{orderid:orderid},
			 url:'./index.php?i=3&c=entry&do=CheckLevelUp&m=junsion_winaward',
			 success:function(data){
				  if(data == 1){
					  var layerIndex = layer.load(2, {shade: 0.3}); 
					  var url = "./index.php?i=3&c=entry&do=my&m=junsion_winaward";
					  location.href = url;
					  layer.close(layerIndex); 
				  }else{	 
					  setTimeout(function(){
						  checkorder();
					  },1000);
				  }
			 }
		 });
	}
}
function showLevelInfo(){
	$('#showModal3').fadeOut(200);
	$('#showModal4').fadeIn(200);
}
function hideLevelInfo(){
	$('#showModal4').fadeOut(200);
}
function showLevelDes(){
	$('#showModal3').fadeIn(200);
}
function hideLevelDes(){
	$('#showModal3').fadeOut(200);
}
function showCommission(){
	$('#showModal2').fadeIn(200);
}
function hideCommission(){
	$('#showModal2').fadeOut(200);
}
</script>
<script>;</script>
</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript" src="resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resource/js/kouhongji.js"></script>
</html>