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
.swiper-slide{
	font-size:12px;
	overflow:hidden;
}
.copyright{
    width: 80%;
    margin: 0 10%;
    text-align: center;
    font-size: 13px;
}
.double_tip{
    text-align: center;
    font-size: 13px;
    color:#ff27a4;
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
	height: 75px;
	border: 0px red solid;
	display: flex;
	display: -webkit-flex;
	flex-direction: row;
}
#gooslist .friend-list .friend-img{
	width: 55px;
	height: 75px;
	border: 0px red solid;
	display: flex;
	display: -webkit-flex;
    justify-content: center;
    align-items: center;
}
#gooslist .friend-list .friend-img img{
	width: 22px;
	height: 22px;
	border-radius: 25px;
	border: 0px red solid;
}
#gooslist .friend-list .friend-msg{
	flex:1;
	height: 75px;
	border: 0px red solid;
	display: flex;
	display: -webkit-flex;
   
    justify-content: center;
    flex-direction: column;
    border-bottom: 1px solid #eee;
}
#gooslist .friend-list .friend-msg .muprofit{
	opacity: 0.54;
	font-family: PingFangSC-Regular;
	font-size: 12px;
	color: #000000;
}
#gooslist .friend-list .friend-msg .friend-name{
	opacity: 0.87;
	font-family: PingFangSC-Regular;
	font-size: 17px;
	color: #000000;
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
.cashTo{
	font-family: PingFangSC-Regular;
	font-size: 17px;
	color: #000000;
	text-align: left;
	padding: 15px 0px 15px 10px;
    border-bottom: 1px solid #eee;
}
.tackcash-div{
	height:47px;
	margin:31px 15px 0px 15px;
	text-align:center;
	line-height:47px;
	font-family: PingFangSC-Regular;
	font-size: 20px;
	color: #FFFFFF;
	background: #FD536E;
	border-radius: 4px;
}
.close-img{
	display:block;
	width: 33px;
	height:33px;
	position: absolute;
	top: -12px;
	right: -12px;
}
.weui-dialog2 {
    position: fixed;
    z-index: 5000;
    width: 80%;
    height:118px;
    max-width: 300px;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    text-align: center;
    display: flex;
    display: -webkit-flex;
    flex-direction: column;
    background: #FFFDFD;
	border-radius: 4px;
}
.weui-dialog3 {
    position: fixed;
    z-index: 5000;
    width: 80%;
    height:250px;
    max-width: 300px;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    text-align: center;
    display: flex;
    display: -webkit-flex;
    flex-direction: column;
    background: #FFFDFD;
	border-radius: 4px;
}
.weui-dialog2 .weui-dialog-title{
	flex: 1;
	align-items: center;
	justify-content: center;
	border-bottom: 1px solid #eee;
	opacity: 0.87;
	font-family: .PingFang-SC-Medium;
	font-size: 18px;
	color: #FD536E;
	letter-spacing: 0.31px;
}
.weui-dialog3 .weui-dialog-title-wechat{
	flex: 1;
	align-items: center;
	justify-content: center;
	opacity: 0.87;
	font-family: PingFangSC-Medium;
	font-size: 21px;
	color: #333333;
	letter-spacing: 0;
	margin: -15px 0 0 0 ;
}

.weui-dialog2 .weui-dialog-msg{
	display:flex;
	flex: 1;
	align-items: center;
	justify-content: center;	
	opacity: 0.87;
	font-family: PingFangSC-Regular;
	font-size: 16px;
	color: #000000;
	letter-spacing: 0.27px;
}
#dialogs-balance{display: none;}
#dialogs-wechat{display: none;}
.weui-dialog3 .weui-dialog-msg-wechat{
	flex: 1;
	align-items: center;
	justify-content: center;	
	
	opacity: 0.87;
	font-family: PingFangSC-Medium;
	font-size: 12px;
	color: #333333;
	letter-spacing: 0;
	padding: 0 15px;
}
.weui-dialog3 .weui-dialog-code{
	display:flex;
	align-items: center;
	justify-content: center;
}
.weui-dialog3 .weui-dialog-code img{
	width: 198px;
	height: 198px;
}

</style>
<link rel="stylesheet" href="resource/css/layer.css" id="layuicss-skinlayercss">

<link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer"></head>

<body style="--wx_color:#ff27a4;--wx_color1:#ff27a4;--wx_color2:#fff1f4;--wx_fcolor:#333333;--wx_fcolor1:#999999;background: #fff;">
    <div class="cashTo">提现到<input type="hidden" id="cash-to" value="balance"></div>
    <div class="item_cell_box" id="gooslist" onclick="choiceAddress('balance')">      
     	<div class="friend-list">
     		<div class="friend-img" id="balance">
     			<img src="resource/img/xuanze.png">
     		</div>
     		<div class="friend-msg">
     			<div class="friend-name">我的余额</div>
     			<div class="muprofit">秒到账，无需手续费</div>
     		</div>
     	</div>
     </div>
     <div class="item_cell_box" id="gooslist" onclick="choiceAddress('wechat')">      
     	<div class="friend-list">
     		<div class="friend-img" id="wechat">
     			<img src="resource/img/weixuanze.png">
     		</div>
     		<div class="friend-msg">
     			<div class="friend-name">微信钱包</div>
     			<div class="muprofit">1-3个工作日到账，需支付1%的手续费</div>
     		</div>
     	</div>
     </div>
     <div id="dialogs-balance">
        <div class="weui-mask"></div>
        <div class="weui-dialog2 modal-dialog">
        	<img class="close-img" id="closeTip" src="resource/img/guanbi.png">
            <div class="weui-dialog-title" id="mtitle">提现成功</div>
            <div class="weui-dialog-msg">红包已提现到我的余额</div>
        </div>
	 </div>
	 <div id="dialogs-wechat">
        <div class="weui-mask"></div>
        <div class="weui-dialog3 modal-dialog">
        	<img class="close-img" id="closeCode" src="resource/img/guanbi.png">
            <div class="weui-dialog-title-wechat" id="mtitle">温馨提示</div>
            <div class="weui-dialog-msg-wechat">为了您的资金安全，扫描下图二维码<span style="color:red;">关注公众号</span>，在公众号内回复“<span style="color:red;">红包提现</span>”即可提现</div>
        	<div class="weui-dialog-code">
				<img src="http://p8v8q53wo.bkt.clouddn.com//khj/qrcode_for_gh_1f11d35a5b68_258.jpg">
			</div>
        </div>
	 </div>

     <div class="tackcash-div" onclick="tackCash()">提现</div>
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
    $('#redplain').on('click', function(){
        var title=$("#explain_title").val();
        var info=$("#explain_info").val();
        $("#mtitle").text(title);
        $("#minfo").text(info);
        $("#page").addClass("pages");
        $showModal2.fadeIn(200);
    });

    $("#closeCode").click(function(event){
        event.stopPropagation();
        $("#dialogs-wechat").fadeOut(200);
    })
    $("#closeTip").click(function(event){
        event.stopPropagation();
        $("#dialogs-balance").fadeOut(200);
    })
});
</script>
<script>
//选择提现方式
function choiceAddress(obj){
	var id = "#"+obj;
	var weixuanze = "<img src='resource/img/weixuanze.png'>";
	var xuanze = "<img src='resource/img/xuanze.png'>";
	if (obj == "balance") {
		$(".friend-img img").remove();
		$(id).append(xuanze);
		$("#wechat").append(weixuanze);
		$("#cash-to").val("balance");
	}else{
		$(".friend-img img").remove();
		$(id).append(xuanze);
		$("#balance").append(weixuanze);
		$("#cash-to").val("wechat");
	}
	
}
//确认提现
function tackCash(){
	var cashTo = $("#cash-to").val();
	if (cashTo == "balance") {
		$.ajax({
			url: "tackCash.java",
			type: "post",
			dataType:'text',
			success: function(dat){
				console.log("dat="+dat);
				if (dat == "success") {
					$("#dialogs-balance").fadeIn(200);
				}else if(dat == "low"){
					$("#dialogs-balance").fadeIn(200);
					$(".weui-dialog-title").text("提现失败");
					$(".weui-dialog-msg").text("当前没有可用红包可提现，赶快邀请好友赚红包吧");
				}else{
					$("#dialogs-balance").fadeIn(200);
					$(".weui-dialog-title").text("提现失败");
					$(".weui-dialog-msg").text("提现的人过多请稍后再试");
				}
				
			}	
		});
	}else{
		//$("#dialogs-wechat").fadeIn(200);//后续转到公众号提现
		$.ajax({
			async: false,
			url : "cashWithDrawal.java",
			type:"POST",
			dataType : 'text', 
			success : function(result) {
				console.log("result="+result);
				if(result == "success"){//插入支付记录
					$("#dialogs-balance").fadeIn(200);
				}else if(result == "low"){
					$("#dialogs-balance").fadeIn(200);
					$(".weui-dialog-title").text("提现失败");
					$(".weui-dialog-msg").text("当前没有可用红包可提现，赶快邀请好友赚红包吧");
				}else if(result == "less"){
					$("#dialogs-balance").fadeIn(200);
					$(".weui-dialog-title").text("提现失败");
					$(".weui-dialog-msg").text("当前红包金额太低不可提现");
				}else{
					$("#dialogs-balance").fadeIn(200);
					$(".weui-dialog-title").text("提现失败");
					$(".weui-dialog-msg").text("提现的人过多请稍后再试");
				}
			},
			error : function(data, status, e) { // 服务器响应失败时的处理函数
				$("#dialogs-balance").fadeIn(200);
				$(".weui-dialog-title").text("提现失败");
				$(".weui-dialog-msg").text("提现的人过多请稍后再试");
			}
		});
	}
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
</body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<script type="text/javascript" src="resource/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resource/js/kouhongji.js"></script>
<script type="text/javascript">


</script>
</html>