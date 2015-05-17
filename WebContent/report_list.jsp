<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朔州车务段煤炭户头信息管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/main.css"/>

<script src="<%=basePath %>js/jquery.js"></script>
<script src="<%=basePath %>js/common-functions.js"></script>
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
</head>
<script>
function download(page, exportType){
    var url="download/report?page="+page + "&exportType=" + exportType 
    		+ "&serachTime="+$("#serachTime").val()
    		+ "&startTime="+$("#startTime").val()
    		+ "&endTime="+$("#endTime").val();
    window.open(url);
}

function searchDate(page, timeType){
	var searchTime = $("#serachTime").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	if(searchTime != "" && startTime != "" && endTime != ""){
		alert("不能同时选择两种日期;");
		return false;
	} 
	if((startTime != "" && endTime == "") || (startTime == "" && endTime != "")){
		alert("自选时段有误");
		return false;
	} 
	if(timeType != "undifined"){
		$("#timeType").val(timeType);
	}
	form.action="<%=basePath %>report?page="+page;
	form.submit();
}
</script>
${message}
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="container clearfix">
<jsp:include page="menu.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">
		<form action="<%=basePath %>report?page=${page.currentPage}" method="post" name="form">
		<input type="hidden" name="timeType" id="timeType" value=""/>
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">18点报告</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">搜索日期：</th>
                            <td>
                                 <input type="text" name="searchTime" id="serachTime" onclick="WdatePicker({minDate:'2000-01-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="iform-input" value="${cParam.searchTime}" placeholder="">
                            </td>
                            <th width="70">自选时段:</th>
                            <td>
                            	<input type="text"  class="common-text" name="startTime" id="startTime" onclick="WdatePicker({minDate:'2000-01-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="iform-input" value="${cParam.startTime}" placeholder=""> 至
			 					<input type="text" class="common-text" name="endTime" id="endTime" onclick="WdatePicker({minDate:'2000-01-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="iform-input" value="${cParam.endTime}" placeholder="">
                            </td>
                            <td><input type="button" class="btn btn-primary btn2" onclick="searchDate(1)" value="统计"></td>
							<td><input type="button" class="btn btn-primary btn2" value="当日" onclick="searchDate(1, 'today')"></td>
							<td><input type="button" class="btn btn-primary btn2" value="昨日" onclick="searchDate(1, 'yesterday')"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
           
                <div class="result-title">
                    <div class="result-list">
                        <a href="<%=basePath %>report/loaddata"><i class="icon-font"></i>新增报告</a>
                       <!--  <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>更新排序</a> -->
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr style="line-height: 25px;">
                        	<th>ID</th>
                            <th>车站</th>
                            <th>煤站</th>
                            <th>发货单位</th>
                            <th>煤种</th>
                            <th>到站</th>
                            <th>车数</th>
                            <th>场存煤(t)</th>
                            <th>日上煤(t)</th>
                            <th>自有煤矿</th>
                            <th>港存煤</th>
							<th>发运情况</th>
							<th>操作</th>
                        </tr>
                        <c:forEach items="${coalList}" var="coal">
						<tr>
							<td>${coal.id}</td>
							<td>${coal.station}</td>
							<td>${coal.coalStation}</td>
							<td>${coal.deliveryUnit}</td>
							<td>${coal.coalType}</td>
							<td>${coal.toStation}</td>
							<td>${coal.carNumber}</td>
							<td>${coal.changCunMei}</td>
							<td>${coal.riShangMei}</td>
							<td>${coal.ziYouMeiKuang}</td>
							<td>${coal.gangCunMei}</td>
							<td>${coal.theShipment}</td>
							<td>
								<a class="link-update" href="<%=basePath %>report/edit/${coal.id}">修改</a>
								<a class="link-del" href="<%=basePath %>report/del/${coal.id}">删除</a>
							<%-- 	<a href="<%=basePath %>report/del/${coal.id}" >删除</a> --%>
							</td>
						</tr>
						</c:forEach>
                    </table>
                    <div class="list-page">
                    	<input type="button" value="导出数据" onclick="download(${page.currentPage}, 'currentPage')"/>
						<input type="button" value="导出全部" onclick="download(${page.currentPage}, 'allPage')"/>
						<a href="#" onclick="searchDate(1)">首页</a>&nbsp;
						<c:if test="${page.currentPage > 1 }"><a href="#" onclick="searchDate(${page.currentPage-1})">上一页</a>&nbsp;</c:if>
						<c:if test="${page.currentPage == 1 }">上一页&nbsp;</c:if>
						<c:if test="${page.currentPage < page.maxPage}"><a href="#" onclick="searchDate(${page.currentPage+1})">下一页</a>&nbsp;</c:if>
						<c:if test="${page.currentPage == page.maxPage}">下一页&nbsp;</c:if>
						<a href="#" onclick="searchDate(${page.maxPage})">尾页</a>
						共${page.currentPage}/${page.maxPage}页&nbsp;&nbsp;
		                    </div>
               		</div>
           
        </div>
     </form>
    </div>
    <!--/main-->
</div>





	<%-- <form action="<%=basePath %>report?page=${page.currentPage}" method="post" name="form">
	<input type="hidden" name="timeType" id="timeType" value=""/>
	<table>
		<tr>
			<td colspan="3">搜索日期： <input type="text" name="searchTime" id="serachTime" onclick="WdatePicker({minDate:'2000-01-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="iform-input" value="${cParam.searchTime}" placeholder=""></td>
			<td colspan="6">自选时段:
			 <input type="text" name="startTime" id="startTime" onclick="WdatePicker({minDate:'2000-01-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="iform-input" value="${cParam.startTime}" placeholder="">至
			 <input type="text" name="endTime" id="endTime" onclick="WdatePicker({minDate:'2000-01-01',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="iform-input" value="${cParam.endTime}" placeholder="">
			</td>
			<td><input type="button" onclick="searchDate(1)" value="统计"></td>
			<td><input type="button" value="当日" onclick="searchDate(1, 'today')"></td>
			<td><input type="button" value="昨日" onclick="searchDate(1, 'yesterday')"></td>
		</tr>
		<tr>
			<td>ID</td>
			<td>车站</td>
			<td>煤站</td>
			<td>发货单位</td>
			<td>煤种</td>
			<td>到站</td>
			<td>车数</td>
			<td>场存煤(t)</td>
			<td>日上煤(t)</td>
			<td>自有煤矿</td>
			<td>港存煤</td>
			<td>发运情况</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${coalList}" var="coal">
		<tr>
			<td>${coal.id}</td>
			<td>${coal.station}</td>
			<td>${coal.coalStation}</td>
			<td>${coal.deliveryUnit}</td>
			<td>${coal.coalType}</td>
			<td>${coal.toStation}</td>
			<td>${coal.carNumber}</td>
			<td>${coal.changCunMei}</td>
			<td>${coal.riShangMei}</td>
			<td>${coal.ziYouMeiKuang}</td>
			<td>${coal.gangCunMei}</td>
			<td>${coal.theShipment}</td>
			<td>
				<a class="link-update" href="<%=basePath %>report/del/${coal.id}">修改</a>
				<a class="link-del" href="<%=basePath %>report/del/${coal.id}">删除</a>
				<a href="<%=basePath %>report/del/${coal.id}" >删除</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="12" style="text-align: right;">
				<input type="button" value="导出数据" onclick="download(${page.currentPage}, 'currentPage')"/>
				<input type="button" value="导出全部" onclick="download(${page.currentPage}, 'allPage')"/>
				<a href="#" onclick="searchDate(1)">首页</a>&nbsp;
				<c:if test="${page.currentPage > 1 }"><a href="#" onclick="searchDate(${page.currentPage-1})">上一页</a>&nbsp;</c:if>
				<c:if test="${page.currentPage == 1 }">上一页&nbsp;</c:if>
				<c:if test="${page.currentPage < page.maxPage}"><a href="#" onclick="searchDate(${page.currentPage+1})">下一页</a>&nbsp;</c:if>
				<c:if test="${page.currentPage == page.maxPage}">下一页&nbsp;</c:if>
				<a href="#" onclick="searchDate(${page.maxPage})">尾页</a>
				共${page.currentPage}/${page.maxPage}页&nbsp;&nbsp;
			</td>
		</tr>
	</table>
	</form> --%>
</body>
</html>