<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" import="com.suibianshuo.util.wechat.WeiXinUtil" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>充值管理</title>
<link href="resource/css/web/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="resource/js/web/page/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="resource/js/web/page/jqPaginator.min.js" type="text/javascript"></script>
<link href="resource/css/web/myPage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
        function loadData(num) {
            $("#PageCount").val(num);
        }
    </script>
<script src="resource/js/web/page/myPage.js" type="text/javascript"></script>
<script type="text/javascript">
//搜索
/**
 * 充值查询分页
 * @returns
 */
function changesearch(pageNum){
	//获取页码和页面大小
	var pageSize = $("#pageSize").val();
	var currentPage = 0;
	if (pageNum != null) {
		if (pageNum == -1) {
			currentPage = parseInt($("#currentPage").val())-1;
		}else if (pageNum == 0) {
			currentPage = parseInt($("#currentPage").val())+1;
		}else{
			currentPage = pageNum
		}
	}else{
		currentPage = 1;
	}
	$("#currentPage").val(currentPage);
	
	//获取查询条件
	var sex = document.getElementById("sex").value;
	var source = "";
	if ($("#role").val() == 1) {
		source = document.getElementById("source").value;
	}
	var nickname = document.getElementById("nickname").value;
	var create_time = document.getElementById("create_time").value;
	var begin = create_time.split("~")[0];
	var end = create_time.split("~")[1];
		$.ajax({
			url: "userChargeSearch.html",
			type: "get",
			data:{
				sex:sex,
				status:status,
				source:source,
				nickname:nickname,
				begin:begin,
				end:end,
				page:currentPage,
				pageSize:pageSize
			},
			dataType:'json',
			success: function(data){
				 if(data != null){
					$("#userRechargeList").empty();
					var str = '';
					var dat = eval(data["userReChargeList"]);//从json中取出userlist的json并转化为字符串
					
					for(var i = 0; i < dat.length; i++){
						var sex = null;
						var status = null;
						if (dat[i].sex == "1") {
							sex = "男";
						}else{
							sex = "女";
						}
						str += '<tr>';
						str += '<td>'+(parseInt(i)+1)+'</td>';
						str += '<td>'+dat[i].out_trade_no+'</td>';
						str += '<td>'+dat[i].nickname +'</td>';
						str += '<td>'+sex+'</td>';
						str += '<td>'+dat[i].total_fee+'</td>';
						str += '<td>'+dat[i].partner_name+'</td>';
						str += '<td>'+dat[i].create_time+'</td>';
						str += '</tr>';
						//sumFee += dat[i].total_fee;
					}
					$('#userRechargeList').append(str);
					var sumFee = data["sumFee"];
					sumFee = "￥ "+sumFee+" 元";
					$("#sumFee").text(sumFee);
					var countSum = "总共"+dat.length+"条数据";
					$("#countSum").text(countSum);
					
					if (pageNum == null) {
						//分页
						var totalSize = data["totalSize"];
						var pageSize = data["pageSize"];
						var currentPage = data["currentPage"];
						var countindex = totalSize % pageSize > 0 ? (totalSize / pageSize) + 1 : (totalSize / pageSize);
						$("#PageCount").val(totalSize);
						$("#PageSize").val(pageSize);
						$("#currentPage").val(currentPage);
						var countSum = "共"+parseInt(countindex)+"页";
						$("#totalPages").text(countSum);
						loadpage();//调用分页方法
					}
				} 
			}	
		});
  	  
}
</script>
<link rel="stylesheet" href="resource/css/web/jquery-ui-1.9.2.custom.css" type="text/css">
<link rel="stylesheet" href="resource/css/web/pintuer.css">
<link rel="stylesheet" href="resource/css/web/admin.css">
<!-- <script src="resource/js/web/jquery.js"></script> -->
<script src="resource/js/web/pintuer.js"></script>


<style>
	
	th,td{
		white-space:nowrap;
	}
</style>
</head>
<body>
<input type="hidden" id="role" value="${adminUser.role }">
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>搜索：</li>
        <li>
        性别：
          <select id="sex" class="input" style="width:70px; line-height:17px; display:inline-block">
            <option value="">-选择-</option>
            <option value="1">男</option>
            <option value="2">女</option>
          </select>
          <c:if test="${adminUser.role == 1 }">
          &nbsp;&nbsp;
          来源：
          <select id="source" class="input" style="width:70px; line-height:17px;display:inline-block">
            <option value="">选择</option>
            <c:forEach items="${partnerList}" var="item" varStatus="status">
            	<option value="${item.key }">${item.partner_name }</option>
            </c:forEach>
          </select>
          </c:if>
        </li>
        <li>
        截止日期：
        	<input type="text" class="ui-datepicker-time" id="create_time" value="" />
			<div class="ui-datepicker-css">	
			    <div class="ui-datepicker-quick">
			        <p>快捷日期<a class="ui-close-date">X</a></p>
			        <div>
			            <input class="ui-date-quick-button" type="button" value="今天" alt="0"  name=""/>
			            <input class="ui-date-quick-button" type="button" value="昨天" alt="-1" name=""/>
			            <input class="ui-date-quick-button" type="button" value="7天内" alt="-6" name=""/>
			            <input class="ui-date-quick-button" type="button" value="14天内" alt="-13" name=""/>
			            <input class="ui-date-quick-button" type="button" value="30天内" alt="-29" name=""/>
			            <input class="ui-date-quick-button" type="button" value="60天内" alt="-59" name=""/>
			        </div>
			    </div>
			    <div class="ui-datepicker-choose">
			        <p>自选日期</p>
			        <div class="ui-datepicker-date">
			            <input name="startDate" id="startDate" class="startDate" readonly value="2014/12/20" type="text">
			           -
			            <input name="endDate" id="endDate" class="endDate" readonly  value="2014/12/20" type="text" disabled onchange="datePickers()">
			        
			        </div>
			    </div>
			</div>
        </li>
        <li>
        	昵称：
          <input type="text" placeholder="请输入搜索关键字" id="nickname" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
    	<thead>
	      <tr>
	        <th>ID</th>
	        <th>充值单号</th>
	        <th>昵称</th>
	        <th>性别</th>
	        <th>充值余额/元</th>
	        <th>来源</th>
	        <th>充值时间</th>
	      </tr>
	    </thead>
	    <tbody id="userRechargeList">
	      <c:forEach items="${userReChargeList}" var="item" varStatus="status">
	      	<tr>
	          <td>${status.index+1 }</td>
	          <td>${item.out_trade_no}</td>
	          <td>${item.nickname}</td>
	          <td>
				  <c:if test="${item.sex == '1'}">男</c:if>
		          <c:if test="${item.sex == '2'}">女</c:if>
			  </td>
	          <td>${item.total_fee}</td>
	          <td>${item.partner_name}</td>
	          <td>
	          	${item.create_time}
	          </td>
	        </tr>
	      </c:forEach>
        </tbody>
        <tfoot>
	        <tr>
	          <td>总计：</td>
	          <td></td>
	          <td></td>
	          <td></td>
	          <td style="color:red" id="sumFee">￥ ${sumFee} 元</td>
	          <td></td>
	          <td></td>
	        </tr>
	        <tr>
	        <td colspan="10">
	        	<div>
			        <ul class="pagination" id="pagination">
			        </ul>
			        <input type="hidden" id="PageCount" runat="server" value="${pageBean.totalSize }"/>
			        <input type="hidden" id="PageSize" runat="server" value="${pageBean.pageSize }" />
			        <input type="hidden" id="currentPage" value="${pageBean.currentPage }">
			        <input type="hidden" id="countindex" runat="server" value="10000"/>
			        <!--设置最多显示的页码数 可以手动设置 默认为7-->
			        <input type="hidden" id="visiblePages" runat="server" value="9" />
			        <span id="totalPages">共${pageBean.totalPages }页,总共${pageBean.totalSize }条数据</span>
			        <select id="pageSize" class="input" onchange="changesearch()"  style="width:80px; line-height:17px;display:inline-block;text-align: center;margin-bottom: 4px;">
			            <option value="50">50条/页</option>
			            <option value="100">100条/页</option>
			            <option value="150">150条/页</option>
			            <option value="200">200条/页</option>
			        </select>
			    </div>
	        </td>
	      </tr>
       </tfoot>
    </table>
  </div>
</form>

</body>
<!-- <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
<script src="resource/js/web/timebar/jquery-ui-1.9.2.custom.js" type = "text/javascript" language="javascript"></script>
<script src="resource/js/web/timebar/share.js" type = "text/javascript"></script>
</html>