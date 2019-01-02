<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/basepase/BasePath.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page language="java" import="com.suibianshuo.util.wechat.WeiXinUtil" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>订单管理</title>
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
/**
 * 用户订单查询分页
 * @param pageNum
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
	var status = document.getElementById("status").value;
	var phone = document.getElementById("phone").value;
	var create_time = document.getElementById("create_time").value;
	var begin = create_time.split("~")[0];
	var end = create_time.split("~")[1];
		$.ajax({
			url: "orderListSearch.html",
			type: "get",
			data:{
				status:status,
				phone:phone,
				begin:begin,
				end:end,
				page:currentPage,
				pageSize:pageSize
			},
			dataType:'json',
			success: function(data){
				 if(data != null){
					$("#orderlist").empty();
					var str = '';
					var dat = eval(data["orderList"]);//从json中取出userlist的json并转化为字符串
					for(var i = 0; i < dat.length; i++){
						var status = null;
						if (dat[i].status == "1") {
							status = '<span id="'+dat[i].ordernum+'" style="color: #FFF;background: #32CD32;padding: 2px 5px;border-radius: 2px;">创建</span>';
						}else if(dat[i].status == "2"){
							status = '<span id="'+dat[i].ordernum+'" style="color: #FFF;background: #FFA500;padding: 2px 5px;border-radius: 2px;">待发货</span>';
						}else{
							status = '<span id="'+dat[i].ordernum+'" style="color: #FFF;background: #EE2C2C;padding: 2px 5px;border-radius: 2px;">已发货</span>';
						}
						
						str += '<tr>';
						str += '<td><input type="checkbox" name="id[]" value="" />'+(i+1)+'</td>';
						str += '<td>'+dat[i].nickname+'</td>';
						str += '<td>'+dat[i].goods_name+'</td>';
						str += '<td><img src="'+dat[i].goods_img+'" alt="" width="70" height="60" /></td>';
						str += '<td>'+dat[i].phone +'</td>';
						str += '<td>'+dat[i].code+'</td>';
						str += '<td>'+dat[i].address+'</td>';
						str += '<td>'+dat[i].create_time+'</td>';
						str += '<td>'+status+'</td>';
						str += '<td><div class="button-group"><a class="button border-main" href="javascript:void(0)"onclick="updateOrder(\''+dat[i].ordernum+'\')"><span class="icon-edit"></span>发货</a></div></td>';
						str += '</tr>';
					}
					$('#orderlist').append(str);
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
				}else{
					var str = '<tr><td colspan="9" style="color:red;">未查询到结果！</td></tr>';
					$('#orderlist').append(str);
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

</head>
<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>搜索：</li>
        <li>
          状态：
          <select id="status" class="input"  style="width:70px; line-height:17px;display:inline-block">
            <option value="">-选择-</option>
            <option value="1">创建</option>
            <option value="2">待发货</option>
            <option value="3">已发货</option>
          </select>
          
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
        	手机号：
          <input type="text" placeholder="请输入搜索关键字" id="phone" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <thead>
      	<tr>
	        <th>ID</th>
	        <!-- <th>订单号</th> -->
	        <th>用户昵称</th>
	        <th>商品名称</th>
	        <th>商品图片</th>
	        <th>手机号</th>
	        <th>邮政编码</th>
	        <th style="width:160px;">收货地址</th>
	        <th>创建时间</th>
	        <th>订单状态</th>
	        <c:if test="${adminUser.role == 1 }">
	        <th>操作</th>
	        </c:if>
	      </tr>
      </thead>
      
      <tbody id="orderlist">
	      <c:if test="${orderList != null}">
	      	<c:forEach items="${orderList}" var="item" varStatus="status">
	      		<tr>
		          <td><input type="checkbox" name="id[]" value="" />${status.index+1 }</td>
		          <%-- <td>${item.ordernum}</td> --%>
		          <td>${item.nickname}</td>
		          <td>${item.goods_name}</td>
		          <td><img src="${item.goods_img}" alt="" width="70" height="60" /></td>
		          <td>${item.phone }</td>
		          <td>${item.code}</td>
		          <td>${item.address}</td>
		          <td>
		       	    ${item.create_time}
		          </td>
		          <td>
		         	 <c:if test="${item.status == '1'}"><span id="${item.ordernum}" style="color: #FFF;background: #32CD32;padding: 2px 5px;border-radius: 2px;">创建</span></c:if>
		          	 <c:if test="${item.status == '2'}"><span id="${item.ordernum}" style="color: #FFF;background: #FFA500;padding: 2px 5px;border-radius: 2px;">待发货</span></c:if>
		          	 <c:if test="${item.status == '3'}"><span id="${item.ordernum}" style="color: #FFF;background: #EE2C2C;padding: 2px 5px;border-radius: 2px;">已发货</span></c:if>
				  </td>
		          <c:if test="${adminUser.role == 1 }">
		          <td>
		          	<div class="button-group"> 
		          		<a class="button border-main" href="javascript:void(0)" onclick="updateOrder('${item.ordernum}')">
		          			<span class="icon-edit"></span> 发货
		          		</a> 
		          		<%-- <a class="button border-red" href="javascript:void(0)" onclick="deleteUser(${item.ordernum})">
		          			<span class="icon-trash-o"></span> 删除
		          		</a>  --%>
		          	</div>
		          </td>
		          </c:if>
		        </tr>
	      	</c:forEach>
	      </c:if>
	      <c:if test="${orderList == null}">
	      		<tr>
	      			<td colspan="9" style="color:red;">暂无订单</td>
	      		</tr>
	      </c:if>
      	
      	</tbody>
      	<tfoot>
      		  <c:if test="${adminUser.role == 1 }">
      		  <tr>
		        <td style="text-align:left; padding:19px 0;padding-left:20px;">
		        	<input type="checkbox" id="checkall"/>全选 
		        </td>
		        <td colspan="9" style="text-align:left;padding-left:20px;">
		        	<a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> 
		        	<a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="updateOrder()"> 发货</a> 
		        </td>
		      </tr>
		      </c:if>
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
				            <option value="5">5条/页</option>
				            <option value="10">10条/页</option>
				            <option value="20">20条/页</option>
				            <option value="30">30条/页</option>
				        </select>
				    </div>
		        </td>
		      </tr>
      	</tfoot>
      
    </table>
  </div>
</form>
<script>
//发货
function updateOrder(ordernum){
	console.log("ordernum="+ordernum);
	console.log("text="+$("#"+ordernum).html());
	var status = 3;//已发货
	if ($("#"+ordernum).text() == "创建") {
		alert("该订单用户尚未填写地址，无法发货！");
	}else if($("#"+ordernum).text() == "已发货"){
		alert("该订单已发货，请不要重复操作！");
	}else{
		$.ajax({
			url: "updateorder.java",
			type: "get",
			data:{ordernum:ordernum,status:status,device:"pc"},
			dataType:'text',
			success: function(data){
				 if(data == "success"){
					$("#"+ordernum).html("已发货");
					$("#"+ordernum).css("background","#EE2C2C")
				} 
			}	
		});
	}
	
}
//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}
</script>
</body>
<!-- <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
<script src="resource/js/web/timebar/jquery-ui-1.9.2.custom.js" type = "text/javascript" language="javascript"></script>
<script src="resource/js/web/timebar/share.js" type = "text/javascript"></script>
</html>