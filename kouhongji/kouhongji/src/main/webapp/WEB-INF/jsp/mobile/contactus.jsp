<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/basepase/BasePath.jsp"%>

<!-- saved from url=(0074)https://wx.zdslj.cn/app/index.php?i=3&c=entry&do=custom&m=junsion_winaward -->
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
    <title>联系客服</title>
    <link rel="stylesheet" href="resource/css/weui.css">
	<link rel="stylesheet" href="resource/css/kouhong.css">
    <link rel="stylesheet" href="resource/css/services.css">
<style>


</style></head>

<body style="--wx_color:#ff27a4;--wx_color1:#ff27a4;--wx_color2:#fff1f4;--wx_fcolor:#333333;--wx_fcolor1:#999999;">
<div class="page">
    <div>
        <div class="kh_code">
            <img src="http://p8v8q53wo.bkt.clouddn.com//khj/qrcode_for_gh_1f11d35a5b68_258.jpg" id="code_img">
        </div>
        <div class="kh_text">长按二维码关注公众号</div>
    </div>
    <div class="footer">
        <!--<button class=" click_button kh_btn" id="kh_btn">直接进入客服会话</button>-->
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
</html>