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
.swiper-slide{
	font-size:12px;
	overflow:hidden;
}
.adv{
	z-index:1000001;
	position: fixed;
	width:100%;
	height:100%;
}
.swiper-container-adv{
	width:100%;
	height:auto;
	z-index:1000001;
}
.swiper-container-adv .swiper-slide img{
	width:100%;
}
.i-skip{
    position: fixed;
    bottom: 80px;
    right: 0;
    z-index: 1000001;
    width: 70px;
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
<link rel="stylesheet" href="resource/css/layer.css" id="layuicss-skinlayercss">

<link rel="stylesheet" href="resource/css/layer(1).css" id="layuicss-layer"></head>

<body style="--wx_color:#ff27a4;--wx_color1:#ff27a4;--wx_color2:#fff1f4;--wx_fcolor:#333333;--wx_fcolor1:#999999;">
<div class="page" id="page">
    <div class="bg_img" style="background:url(resource/img/shouye.png) no-repeat; background-size:100% auto;-moz-background-size:100% auto;">
        <!--<div class="row">
            <div class="kh_h2" style="display:inline-block;color: #fff; margin-top: 20px;margin-left: 24px; font-size: 18px;">闯过三关，口红寄到家!</div>

                        <div class="musicbg">
                <audio id="music1" controls="controls" src="https://wx.zdslj.cn/addons/junsion_winaward/public/resource/img/background_audio.mp3" loop="true" hidden="">
                </audio>
                <img src="resource/img/voice_icon.png" class="music" id="onmusicTap">
            </div>
                    </div>-->
                <div class="rows">
            <div class="kh_gg">
                <img src="resource/img/notice2.png" class="gg_img">
                <div class="swiper-container-notice swiper-container-vertical">
                	<div class="swiper-wrapper" style="transform: translate3d(0px, -150px, 0px); transition-duration: 0ms;"><div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="14" style="height: 30px;">
	                		<a>阳光宅男连闯三关，赢得YSL圣罗兰莹亮纯魅唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="0" style="height: 30px;">
	                		<a>闯关成功者请联系客服：gh_1f9e63b80bb3</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="1" style="height: 30px;">
	                		<a>微微笑-Jalon连闯三关，赢得DHC纯橄榄护唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="2" style="height: 30px;">
	                		<a>酱酱.连闯三关，赢得DIOR迪奥烈艳蓝金唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="3" style="height: 30px;">
	                		<a>Harvie呀.连闯三关，赢得DIOR迪奥魅惑釉唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="4" style="height: 30px;">
	                		<a>匡邦连闯三关，赢得MAC LISTICK唇膏CHILI</a>
	                	</div>
	                		                	<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="5" style="height: 30px;">
	                		<a>LMJ连闯三关，赢得TOM FORD白管07PARADISO</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="6" style="height: 30px;">
	                		<a>董董.连闯三关，赢得阿玛尼漆光迷情唇釉</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="7" style="height: 30px;">
	                		<a>羡鱼连闯三关，赢得阿玛尼臻致丝绒哑光唇釉</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="8" style="height: 30px;">
	                		<a>不浪漫是罪名连闯三关，赢得YSL圣罗兰莹亮纯魅唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="9" style="height: 30px;">
	                		<a>闯关成功者请联系客服：gh_1f9e63b80bb3</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="1" style="height: 30px;">
	                		<a>微微笑-Jalon连闯三关，赢得DHC纯橄榄护唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide" data-swiper-slide-index="2" style="height: 30px;">
	                		<a>酱酱.连闯三关，赢得DIOR迪奥烈艳蓝金唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="3" style="height: 30px;">
	                		<a>Harvie呀.连闯三关，赢得DIOR迪奥魅惑釉唇膏</a>
	                	</div>
	                		                	<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="4" style="height: 30px;">
	                		<a>匡邦连闯三关，赢得MAC LISTICK唇膏CHILI</a>
	                	</div>
	                		                	<div class="swiper-slide swiper-slide-next" data-swiper-slide-index="5" style="height: 30px;">
	                		<a>LMJ连闯三关，赢得TOM FORD白管07PARADISO</a>
	                	</div>
	                </div>
                </div>
            </div>
        </div>
                <div class="kh_banner ">
            <img class="Kh_bimg" src="http://p8v8q53wo.bkt.clouddn.com/khj/imgHI3t8i523e33332lc36lnN9n3c99EZ.png">
        </div>
        <div class="kh_title flexColumn">
            <div class="kh_h2">闯过三关，口红寄到家！</div>
            <div class="kh_explain" id="bindexplain">闯关购说明</div><br />
            <input type="hidden" value="闯关购说明" id="explain_title">
            <input type="hidden" value="1.闯关购规则
活动开始前选择您喜欢的商品，每关只需将所显示的口红插满圆盘，即可过关，连闯三关即可获得心意的奖品获得商品后，在订单页填写您的收货地址，我们会以快递的形式将您的奖品寄给您。

2.商品说明
我们所提供的商品均为官方正品，支持专柜验货

3.快递说明
你闯关得到的奖品提交订单后的3个工作日内我们会为您安排发货。如有特殊情况客服会与您取得联系。

" id="explain_info">
        </div>
        <div class="kh_body page__bd">
            <div class="item_cell_box" id="gooslist">      
            	
             <!-- <div class="goods"><div class="kh_goods" onclick="bindgome(7,2.00)"><div><img class="kh_img" src="resource/img/goods/h65aolag0Xy5gEae7ELEHe5h3sdlH0.jpg"></div><div><div class="kh_shoppe">专柜价￥80.00</div><div class="kh_maintitle">DHC纯橄榄护唇膏</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">2.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(2,6.00)"><div><img class="kh_img" src="resource/img/goods/Ufk9jQSn0EdN2H0jVLq29KDV408E2U.jpg"></div><div><div class="kh_shoppe">专柜价￥320.00</div><div class="kh_maintitle">YSL圣罗兰莹亮纯魅唇膏46</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(3,6.00)"><div><img class="kh_img" src="resource/img/goods/TaqQ1TB7Zzzt08f5Oq0bVhM37sj80q.jpg"></div><div><div class="kh_shoppe">专柜价￥320.00</div><div class="kh_maintitle">YSL圣罗兰莹亮纯魅唇膏12</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(4,6.00)"><div><img class="kh_img" src="resource/img/goods/YC12LDNDB1lzdQVZcA1170qE41m37B.jpg"></div><div><div class="kh_shoppe">专柜价￥320.00</div><div class="kh_maintitle">阿玛尼漆光迷情唇釉500</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(5,6.00)"><div><img class="kh_img" src="resource/img/goods/xY347T016Ak475Ka0ZR5OaAn47ma53.jpg"></div><div><div class="kh_shoppe">专柜价￥320.00</div><div class="kh_maintitle">阿玛尼臻致丝绒哑光唇釉405</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(6,6.00)"><div><img class="kh_img" src="resource/img/goods/UktMOgCKcG9ZcMSyGugKL5455u8o5l.jpg"></div><div><div class="kh_shoppe">专柜价￥320.00</div><div class="kh_maintitle">DIOR迪奥烈艳蓝金唇膏999</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(8,3.00)"><div><img class="kh_img" src="resource/img/goods/tvV0mVpV5wt65zPVlm02C6irmi6PiV.jpg"></div><div><div class="kh_shoppe">专柜价￥170.00</div><div class="kh_maintitle">MAC时尚唇膏RUBY WOO</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">3.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(9,6.00)"><div><img class="kh_img" src="resource/img/goods/fZi3867ERv55Ekz597r88i1vVGnK8k.jpg"></div><div><div class="kh_shoppe">专柜价￥310.00</div><div class="kh_maintitle">DIOR迪奥魅惑釉唇膏740</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(10,3.00)"><div><img class="kh_img" src="resource/img/goods/lvEj77C1eC6Qkc6ky7IOXZo1xkxKeK.jpg"></div><div><div class="kh_shoppe">专柜价￥170.00</div><div class="kh_maintitle">MAC LISTICK唇膏CHILI</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">3.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(11,8.00)"><div><img class="kh_img" src="resource/img/goods/r11616661bxv6e3X4V6BV3B16M35d6.jpg"></div><div><div class="kh_shoppe">专柜价￥420.00</div><div class="kh_maintitle">TOM FORD白管07PARADISO</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">8.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(12,8.00)"><div><img class="kh_img" src="resource/img/goods/s9ooQIzT00pJ71tyxY1txOP6bYY1bB.jpg"></div><div><div class="kh_shoppe">专柜价￥420.00</div><div class="kh_maintitle">TOM FORD黑管15WILD GINGER</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">8.00闯关购</div></div></div></div><div class="goods"><div class="kh_goods" onclick="bindgome(13,6.00)"><div><img class="kh_img" src="resource/img/goods/rW2050AVY5T6ap2a51521as9EQAq5y.jpg"></div><div><div class="kh_shoppe">专柜价￥320.00</div><div class="kh_maintitle">YSL圣罗兰纯色唇釉407</div><div class="kh_subtitle">正品</div></div><div><div class="kh_pic">6.00闯关购</div></div></div></div> --></div>
        </div>
        <div style="clear:both;"></div>
        <div class="copyright"></div>
        <div style="width:100%;height:80px;"></div>
    </div>
    
    <div class="cardWrap" id="bindgames">
        <a href="game.html?gameMode=2">
        <img src="resource/img/tiyan.png" class="Refresh">
        </a>
    </div>

    <div style="width:100%;height:80px;"></div>
<div class="footer_box" style="background:#ffffff">
    <div class=" footer_in">
        <div class="item_cell_boxs">
                        <div class="footer_item" style="width:50%">
                <a href="#" class="footer_button click_button" style="background:#fff;">
                    <img class="footer_item_img" src="resource/img/kouhong1.png">
                    <div class="footer_item_name">赢口红</div>
                </a>
            </div>
            <div class="footer_item" style="width:50%">
                <a href="my.html" class="footer_button click_button" style="background:#fff;">
                    <img class="footer_item_img" src="resource/img/my2.png">
                    <div class="footer_item_name" style="color: #000;opacity: 0.54;">我的</div>
                </a>
            </div>
                    </div>
    </div>
</div></div>
<div id="dialogs">
    <div class="js_dialog" id="showModal3" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog modal-dialog">
            <div class="weui-dialog_hd"></div>
            <div class="weui-dialog_bd">
                <div class="modal-body">
                    <img src="resource/img/ErrorPopupBg.png">
                    <div class="kh_none">余额不足</div>
                </div>
            </div>

            <div class="weui-dialog_ft">
                <div class="kh_btn" id="onConfirm">去充值</div>

            </div>

        </div>
    </div>
    <div class="js_dialog" id="showModal2" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog modal-dialog">
            <div class="weui-dialog_hd kh_none" id="mtitle"></div>
            <div class="weui-dialog_bd">
                <div class="modal-body">
                    <textarea class="kh_sm" id="minfo" style="border:none;width:100%;height:220px;">1.闯关购规则
                    	
活动开始前选择您喜欢的口红
每关只需要将所显示的口红插满圆盘，即可过关
连闯三关就可以获得心仪口红
闯关失败可重新挑战，会扣除相对应的游戏币
获得商品后，请填写您的收货地址，我们会以快递的形式将
您的口红寄给您（仅限中国大陆地区）
余额不支持提现。

2.商品说明

我们所提供的商品均为官方正品，支持专柜验货

3.快递说明

一般情况下，您闯关得到的商品提交订单后的3个工作日内 
我们会为您安排发货，如遇特殊情况我们会在公众号发布

</textarea>
                </div>
            </div>

            <!--<div class="weui-dialog_ft">

            </div>-->

        </div>
    </div>
    <div class="js_dialog" id="showModal4" style="display: none;">
    	<input type="hidden" id="charge_goods_id" value="">
        <div class="weui-mask"></div>
        <div class="weui-dialog modal-dialog">
            <div class="weui-dialog_hd kh_none">收银台</div>
                        <div class="weui-dialog_bd">
                <div class="modal-body">

                    <div class="modal-kh_box">
                        <div class="modal_zpic">
                           当前余额：
                            <div class="modal_pic"><span id="memCredit">0.00</span>元</div>
                        </div>
                        <div class="kh_grids" id="kh_grids">
														<div class="kh_grids-item kh_pics" onclick="goRecharge(0,0.01)">
                                <div class="kh_grids_pic">0.01元                                    <text></text>
                                </div>
                            </div>
                            							<div class="kh_grids-item kh_pics" onclick="goRecharge(1,10)">
                                <div class="kh_grids_pic">10.00元                                    <text></text>
                                </div>
                            </div>
                            							<div class="kh_grids-item kh_pics" onclick="goRecharge(2,30)">
                                <div class="kh_grids_pic">30.00元                                    <text></text>
                                </div>
                            </div>
                            							<div class="kh_grids-item kh_pics" onclick="goRecharge(3,50)">
                                <div class="kh_grids_pic">50.00元                                    <text></text>
                                </div>
                            </div>
                            							<div class="kh_grids-item kh_pics" onclick="goRecharge(4,100)">
                                <div class="kh_grids_pic">100.00元                                    <text></text>
                                </div>
                            </div>
                            							<div class="kh_grids-item kh_pics" onclick="goRecharge(5,200)">
                                <div class="kh_grids_pic">200.00元                                    <text></text>
                                </div>
                            </div>
                                                    </div>
                    </div>
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
var app_buy = "元闯关购";
var app_cost = "专柜价";
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
		//getList();
	}            
});
//获取口红列表
function getList(){
	if(loading) return false;
	loading = true;
	var layerIndex = layer.load(2, {shade: 0.3}); 
	$.ajax({
		url: "goodslist.java",
		type: "get",
		dataType:'json',
		success: function(dat){
			//console.log(dat.get);
			layer.close(layerIndex);  
			//dat = JSON.parse(dat);
			if(dat != null){
				//dat = dat.lists;
				var str = '';
				for(var i in dat){
					str += '<div class="goods">';
					str += '<div class="kh_goods" onclick="bindgome('+dat[i].id+','+dat[i].goods_price+')">';
					str += '<div>';
					str += '<img class="kh_img" src="'+dat[i].goods_img+'">';
					str += '</div>';
					str += '<div>';
					str += '<div class="kh_shoppe">'+app_cost+'￥'+dat[i].shop_price+'</div>';
					str += '<div class="kh_maintitle">'+dat[i].goods_name+'</div>';
					str += '<div class="kh_subtitle">'+dat[i].is_zheng+'</div>';
					str += '</div>';
					str += '<div>';
					str += '<div class="kh_pic">';
					str += dat[i].goods_price+app_buy;
					str += '</div>';
					str += '</div>';
					str += '</div>';
					str += '</div>';
					
				}
				$('#gooslist').append(str);
				loading = false;
			}
			else{
				loading = true;
			}
		}	
	});	
}



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
	getList();
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
    $('#bindexplain').on('click', function(){
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