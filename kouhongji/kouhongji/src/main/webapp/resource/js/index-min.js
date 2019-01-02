 /**
 * 分享到微信朋友圈或朋友
 */
$(document).ready(function(){
	//var currurl = "http://www.suibianshuo.com.cn/kouhongji";
	var currurl = location.href.split('#')[0];
	//alert(currurl);
	var title = "闯三关赢口红，等你来战！";
	var derc = "我成功闯过了三关，拿到了YSL口红";
	var img = "http://p8v8q53wo.bkt.clouddn.com/khj/fZi3867ERv55Ekz597r88i1vVGnK8k.jpg";
	//window.alert("执行了jquery"+currurl);
	var shareData = {
   			title:title,
 	      	link: currurl,
 	      	desc: derc,
           	imgUrl: img,
           	success : function() {
           		//保存用户分享数据
           		//playThree();//关闭提示窗
           		var rm=new window.random(); //window.可以省略  
           	    //调用方法
           		rm.getRandom();

           		$.ajax({
       			 type:'get',
       			 url:'addUserShareLog.java',
       			 dataType:'text',
       			 success:function(data){
//                   				if (data == "success") {
//                   					
//								}
       			}
       		 });
           	},
			cancel : function() {

			}
   	   };
	//ajax注入权限验证  
	$.ajax({
		async: true,
		type:'get',
		url : "initWXJSInterface.java",
		dataType : 'json',
		data : {'url' : currurl},
		success : function(res) {
			var appId = res.appId;
			var timestamp = res.timestamp;
			var nonceStr = res.nonceStr;
			var signature = res.signature;
			//alert("appId="+appId+" timestamp="+timestamp+" nonceStr="+nonceStr+" signature="+signature);
			wx.config({
				debug : false, //开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。  
				appId : appId, //必填，公众号的唯一标识  
				timestamp : timestamp, // 必填，生成签名的时间戳  
				nonceStr : nonceStr, //必填，生成签名的随机串  
				signature : signature, // 必填，签名，见附录1  
				jsApiList : [ 'onMenuShareAppMessage', 'onMenuShareTimeline' ] //必填，需要使用的JS接口列表，所有JS接口列表 见附录2  
			});
			
			
			
			
			wx.ready(function() {
				wx.onMenuShareAppMessage(shareData); 
 
				wx.onMenuShareTimeline(shareData); 
			}); 
 
			wx.error(function(res) {
				//alert('config错误'+res);
			});
		} 
	});
	
	
	

	!function(e) {
	    var n = {};
	    function t(a) {
	        if (n[a])
	            return n[a].exports;
	        var i = n[a] = {
	            i: a,
	            l: !1,
	            exports: {}
	        };
	        return e[a].call(i.exports, i, i.exports, t),
	        i.l = !0,
	        i.exports
	    }
	    t.m = e,
	    t.c = n,
	    t.d = function(e, n, a) {
	        t.o(e, n) || Object.defineProperty(e, n, {
	            enumerable: !0,
	            get: a
	        })
	    }
	    ,
	    t.r = function(e) {
	        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
	            value: "Module"
	        }),
	        Object.defineProperty(e, "__esModule", {
	            value: !0
	        })
	    }
	    ,
	    t.t = function(e, n) {
	        if (1 & n && (e = t(e)),
	        8 & n)
	            return e;
	        if (4 & n && "object" == typeof e && e && e.__esModule)
	            return e;
	        var a = Object.create(null);
	        if (t.r(a),
	        Object.defineProperty(a, "default", {
	            enumerable: !0,
	            value: e
	        }),
	        2 & n && "string" != typeof e)
	            for (var i in e)
	                t.d(a, i, function(n) {
	                    return e[n]
	                }
	                .bind(null, i));
	        return a
	    }
	    ,
	    t.n = function(e) {
	        var n = e && e.__esModule ? function() {
	            return e.default
	        }
	        : function() {
	            return e
	        }
	        ;
	        return t.d(n, "a", n),
	        n
	    }
	    ,
	    t.o = function(e, n) {
	        return Object.prototype.hasOwnProperty.call(e, n)
	    }
	    ,
	    t.p = "",
	    t(t.s = 0)
	}([function(e, n) {
	    var t = null;
	    window.onload = function() {
//	    	function playThree(){
//	    		var tmpLevel = parseInt(t.level-1);
//	    		//alert("tmpLevel="+tmpLevel);
//	    		if (tmpLevel == 2) {
//	    			$("#app").removeClass("blur"),
//	        		$("#share_mark").css("display", "none"),
//	        		$("#levelSwitchBoxMain").attr("src", "resource/img/level_3Switch_main.png"),
//	        	    $("#levelSwitchBox").css("display", "block"),
//	        	    $("#levelSwitchBox").addClass("hidden"),
//	        	    document.getElementById("currentLevel").getElementsByTagName("span")[0].innerHTML = t.level;
//	        	    var e = 4;
//	        	    document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始第" + t.level + "关";
//	        	    var n = setInterval(function() {
//	        	        e--,
//	        	        document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始<span>第" + t.level + "关</span>",
//	        	        e <= 0 && (clearInterval(n),
//	        	        document.getElementById("gameTip").innerHTML = "",
//	        	        t.gameContinue(!0))
//	        	    }, 1e3)
//				}
//	    	    
//	    	};
	    	function Random() {
	        }
	        //在原型对象中添加方法 
	        Random.prototype.getRandom = function () {
	        	var tmpLevel = parseInt(t.level-1);
	    		if (tmpLevel == 2) {
	    			$("#app").removeClass("blur"),
	        		$("#share_mark").css("display", "none"),
	        		$("#levelSwitchBoxMain").attr("src", "resource/img/level_3Switch_main.png"),
	        	    $("#levelSwitchBox").css("display", "block"),
	        	    $("#levelSwitchBox").addClass("hidden"),
	        	    document.getElementById("currentLevel").getElementsByTagName("span")[0].innerHTML = t.level;
	        	    var e = 4;
	        	    document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始第" + t.level + "关";
	        	    var n = setInterval(function() {
	        	        e--,
	        	        document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始<span>第" + t.level + "关</span>",
	        	        e <= 0 && (clearInterval(n),
	        	        document.getElementById("gameTip").innerHTML = "",
	        	        t.gameContinue(!0))
	        	    }, 1e3)
				}
	        };
	        window.random=Random;//将函数名字给了属性Random
	        if (document.getElementById("levelSwitchBox").addEventListener("webkitAnimationEnd", function() {
	            $("#levelSwitchBox").css("display", "none"),
//	            $("#levelSwitchBoxMain").attr("src", "./level_2Switch_main.png?version=1"),
	            $("#levelSwitchBoxMain").attr("src", sysGame[1].switch),
	            $("#levelSwitchBox").removeClass("hidden")
	        }),
	        $("#levelSwitchBox").addClass("hidden"),!t) {
	            if (-1 == JSON.parse($.cookie("game_cookie")).game_pay)
	                var e = !1;
	            else
	                e = !0;
	            !function(e) {
	                (t = new HardestGame(document.getElementById("gameStage"),e)).levelSuccessHandle = function() {
	                    //“4”是否总关数，判断是否闯关成功
	                	var gameMode = $("#gameMode").val();//获取游戏模式
	                	if (t.level <= 3) {
	                		//判断游戏模式（1-挑战，2-试玩）
	                		if (gameMode == 1) {
	                			$("#success_audio").get(0).paused && $("#success_audio").get(0).play(),
		                        document.getElementById("currentLevel").getElementsByTagName("span")[0].innerHTML = t.level;
		                        var e = 4;
		                        document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始第" + t.level + "关";
		                        var n = setInterval(function() {
		                            e--,
		                            document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始<span>第" + t.level + "关</span>",
		                            e <= 0 && (clearInterval(n),
		                            document.getElementById("gameTip").innerHTML = "",
		                            t.gameContinue(!0))
		                        }, 1e3)
							}else{
								if (t.level == 3) {
									$("#gameSuccess_audio").get(0).paused && $("#gameSuccess_audio").get(0).play(),
									$("#share_mark").css("display", "block"),
		                            $("#app").addClass("blur")
//		                            $("#goBuy").css("display", "none"),
//		                            $("#wx_no").css("display", "none"),
//									$("#gameOverBox").css("display", "block"),
//									$("#gameOverBoxTitle").css("color","#FD536E"),
//		                			$("#gameOverBoxBtn").html('点击右上角分享到群即可免费体验第三关哦'),
//		                			$("#gameOverBoxBtn").css("background-color","#FD536E");
//		            				$("#gameOverClose").on("click", function() {
//		            					if(nowWindow==2){
//		            						location.href = initUrl;//回主页
//		            					}
//		                            });
								}else{
									$("#success_audio").get(0).paused && $("#success_audio").get(0).play(),
			                        document.getElementById("currentLevel").getElementsByTagName("span")[0].innerHTML = t.level;
			                        var e = 4;
			                        document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始第" + t.level + "关";
			                        var n = setInterval(function() {
			                            e--,
			                            document.getElementById("gameTip").innerHTML = "完美通过第" + (t.level - 1) + "关, " + e + "秒后,开始<span>第" + t.level + "关</span>",
			                            e <= 0 && (clearInterval(n),
			                            document.getElementById("gameTip").innerHTML = "",
			                            t.gameContinue(!0))
			                        }, 1e3)
								}
							}
	                		
	                        
	                    } 
	                	
	                	else{
	                    	//alert(nowMid);
	                		//挑战成功
	 //                   	if(nowMid && nowMid>0){//这里判断一下游戏模式（1-挑战，2-试玩）
	                		var goodsId = $("#goodsId").val();
	                		var device = "others";//设备类型
                    		// 闯关失败(可以吧改用户的闯关次数保存到数据库)
                        	//根据手机设备类型做出不同判断
            				//安卓
            				if (browser.versions.android) {
            					//alert("安卓手机");
            					device = "android";
            				}
            				//苹果
            				if (browser.versions.iPhone || browser.versions.iPad || browser.versions.ios) {
            					//alert("苹果手机");
            					device = "iphone";
            				}
	                		if(gameMode == 1){
	                    		//挑战成功则创建订单
	                			
	                    		$.ajax({
	                    			async:false,
	                        		type:'post',
	                        		url:"addOrder.java",
	                        		data:{goodsId:goodsId,device:device},
	                        		dataType:"text",
	                        		success:function(data){
	                        			if (data == "success") {
	                        				//$("#levelSwitchBoxMain").attr("src",""),//挑战成功移除大圆
	                                		$("#gameSuccess_audio").get(0).paused && $("#gameSuccess_audio").get(0).play(),
	                                        $("#app").addClass("blur"),
	                                		$("#gameOverBox").css("display", "block"),
	                                		$("#goBuy").css("display", "none"),
	                            			$("#gameOverBoxTitle").html('挑战成功'),
	                            			$("#gameOverBoxBtn").html('领取奖品'),
	                            			$("#gameOverBoxBtn").on("click", function() {
	                        					if(nowWindow==2){
	                        						location.href = appUrl;
	                         					}
	                        					else{
	                        						wx.miniProgram.redirectTo({
	                        							url: "/pages/order/order"
	                        						})
	                        					}
	                        				}),
	                        				$("#gameOverClose").on("click", function() {
	                        					if(nowWindow==2){
	                        						location.href = appUrl;
	                        					}
	                        					else{
	                        						wx.miniProgram.redirectTo({
	                        							url: "/pages/order/order"
	                        						})
	                        					}
	                                        });
										}
	                        		}
	                    		})
	                    		
	                        }
	                    	//体验结束
	                    	else{
	                    		var mode = $("#gameMode").val();
	                        	var goodsid = $("#goodsId").val();
	                        	goodsid = goodsid == ""?0:goodsid;
	                        	var tmpLevel = parseInt(this.level-1);
	                        	
	                    		$.ajax({
	                        		type:'get',
	                        		url:'addUserPlayLog.java',
	                        		data:{result: 'Y', mode: mode, goodsid: goodsid, fail_level: 0,device:device},
	                        		dataType:"text",
	                        		success:function(data){
	                        			if (data == "success") {
	                        				$("#gameSuccess_audio").get(0).paused && $("#gameSuccess_audio").get(0).play(),
	                                        $("#app").addClass("blur"),
	                                        $("#goBuy").css("display", "none"),
	                                        $("#wx_no").css("display", "none"),
	                                        $("#gameSuccessBox").css("display", "block"),//体验结束显示
	                                        $("#gameSuccessBoxBtn").on("click", function() {
	                                        	if(nowWindow==2) history.back(-1);
	                                        	else wx.miniProgram.navigateBack()
	                                        }),
	                                        $("#gameSuccessClose").on("click", function() {
	                                        	if(nowWindow==2) history.back(-1);
	                                        	else wx.miniProgram.navigateBack()
	                                        })
										}
	                        		}
	                    		})
	                    	}
	                    }
	                }
	                ,
	             // 游戏结束后调用的对外接口
	                t.gameOverHandle = function() {
	                    clearInterval(timeboxInterval),
	                    (t = null) && delete t,
	                    $("#gameOverBox").css("display", "block"),
	                    $("#gameOverBoxBtn").html('重新挑战'),
	                    $("#wx_no").css("display", "none"),
	                    $("#app").addClass("blur");
	                    var e = 5;
//	                    document.getElementById("gameTip").innerHTML = "游戏结束, " + e + "秒后,重启游戏",
//	                    document.getElementById("gameOverBoxTime").innerHTML = e + "s";
	                    document.getElementById("gameTip").innerHTML = "游戏结束, " + e + "秒后,重启游戏";
	                    var n = setInterval(function() {
	                        e--,
	                        document.getElementById("gameTip").innerHTML = "游戏结束, " + e + "秒后,重启游戏",
//	                        document.getElementById("gameOverBoxTime").innerHTML = e + "s",
	                        e <= 0 && (wx.miniProgram.navigateBack(),
	                        clearInterval(n),
	                        document.getElementById("gameTip").innerHTML = "")
	                    }, 1e3);
	                    $("#gameOverBoxBtn").on("click", function() {
	                    	if(nowWindow==2) history.back(-1);
	                    	else wx.miniProgram.navigateBack()
//	                    	wx.miniProgram.redirectTo({
//	                            url: "/pages/index/index"
//	                        })
	                    }),
	                    $("#gameOverClose").on("click", function() {
//	                    		wx.miniProgram.redirectTo({
//	                    			url: "/pages/index/index"
//	                    		})
	                    	if(nowWindow==2) history.back(-1);
	                    	else wx.miniProgram.navigateBack()
	                    })
	                }
	                ,
	              //初始化游戏
	                t.init(),
	                t.canvas.parentNode.style.width = t.canvas.width + "px",
	                t.canvas.parentNode.style.height = t.canvas.height + "px",
	              //游戏开始
	                t.gameStart(),
	                document.getElementById("currentLevel").getElementsByTagName("span")[0].innerHTML = t.level
	            }(e)
	            
	           
	            
	        }
	    }
	}

	]);
});





