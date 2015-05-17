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
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/main.css"/>

<script src="<%=basePath %>js/jquery.js"></script>
<script src="<%=basePath %>js/common-functions.js"></script>
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
</head>
<script>

</script>
${message}
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="container clearfix">
<jsp:include page="menu.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>index.jsp">首页</a><span class="crumb-step">&gt;</span>添加报告记录</div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="<%=basePath %>report/update" method="post" name="form">
					<input type="hidden" name="id" value="${coal.id}">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>车站：</th>
                            <td>
                            	<select name="station">
									<c:forEach items="${stationList}" var="station">
										<c:if test="${station.coalName == coal.station}"><option value="${station.coalName}" selected="selected">${station.coalName}</option></c:if>
										<c:if test="${station.coalName != coal.station}"><option value="${station.coalName}">${station.coalName}</option></c:if>
									</c:forEach>
								</select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>煤站:</th>
                                <td>
                                	<select name="coalStation">
										<c:forEach items="${coalStationList}" var="coalStation">
											<c:if test="${coalStation.coalName == coal.coalStation}"><option value="${coalStation.coalName}" selected="selected">${coalStation.coalName}</option></c:if>
											<c:if test="${coalStation.coalName != coal.coalStation}"><option value="${coalStation.coalName}">${coalStation.coalName}</option></c:if>
										</c:forEach>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                             <tr>
                                <th><i class="require-red">*</i>发货单位:</th>
                                <td>
                                	<select name="deliveryUnit">
										<c:forEach items="${deliveryUnitList}" var="deliveryUnit">
											<c:if test="${deliveryUnit.coalName == coal.deliveryUnit}"><option value="${deliveryUnit.coalName}" selected="selected">${deliveryUnit.coalName}</option></c:if>
											<c:if test="${deliveryUnit.coalName != coal.deliveryUnit}"><option value="${deliveryUnit.coalName}">${deliveryUnit.coalName}</option></c:if>
										</c:forEach>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>煤种:</th>
                                <td>
                                	<select name="coalType">
										<c:forEach items="${meizhongList}" var="meizhong">
											<c:if test="${meizhong.coalName == coal.coalType}"><option value="${meizhong.coalName}" selected="selected">${meizhong.coalName}</option></c:if>
											<c:if test="${meizhong.coalName != coal.coalType}"><option value="${meizhong.coalName}">${meizhong.coalName}</option></c:if>
										</c:forEach>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                            
                            
                            
                            <tr>
                                <th>到站:</th>
                                <td><input class="common-text" name="toStation" size="50" value="${coal.toStation}" type="text"></td>
                            </tr>
                             <tr>
                                <th>车数:</th>
                                <td><input class="common-text" name="carNumber" size="50" value="${coal.carNumber}" type="text"></td>
                            </tr>
                             <tr>
                                <th>厂存煤:</th>
                                <td><input class="common-text" name="changCunMei" size="50" value="${coal.changCunMei}" type="text"></td>
                            </tr>
                             <tr>
                                <th>日上煤:</th>
                                <td><input class="common-text" name="riShangMei" size="50" value="${coal.riShangMei}" type="text"></td>
                            </tr>
                             <tr>
                                <th>自有煤矿:</th>
                                <td><input class="common-text" name="ziYouMeiKuang" size="50" value="${coal.ziYouMeiKuang}" type="text"></td>
                            </tr>
                             <tr>
                                <th>港存煤:</th>
                                <td><input class="common-text" name="gangCunMei" size="50" value="${coal.gangCunMei}" type="text"></td>
                            </tr>
                             <tr>
                                <th>发运情况:</th>
                                <td><input class="common-text" name="theShipment" size="50" value="${coal.theShipment}" type="text"></td>
                            </tr>
                            
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="更新" type="submit">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>