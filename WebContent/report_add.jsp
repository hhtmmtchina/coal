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
                <form action="<%=basePath %>report/add" method="post" name="form">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>车站：</th>
                            <td>
                            	<select name="station" class="required">
									<c:forEach items="${stationList}" var="station">
										<option value="${station.coalName}">${station.coalName}</option>
									</c:forEach>
								</select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>煤站:</th>
                                <td>
                                	<select name="coalStation" class="common-text required">
										<c:forEach items="${coalStationList}" var="coalStation">
											<option value="${coalStation.coalName}">${coalStation.coalName}</option>
										</c:forEach>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                             <tr>
                                <th><i class="require-red">*</i>发货单位:</th>
                                <td>
                                	<select name="deliveryUnit" class="common-text required">
										<c:forEach items="${deliveryUnitList}" var="deliveryUnit">
											<option value="${deliveryUnit.coalName}">${deliveryUnit.coalName}</option>
										</c:forEach>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>煤种:</th>
                                <td>
                                	<select name="coalType" class="common-text required">
										<c:forEach items="${meizhongList}" var="meizhong">
											<option value="${meizhong.coalName}">${meizhong.coalName}</option>
										</c:forEach>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                            
                            
                            
                            <tr>
                                <th>到站:</th>
                                <td><input class="common-text" name="toStation" size="50" value="" type="text"></td>
                            </tr>
                             <tr>
                                <th>车数:</th>
                                <td><input class="common-text" name="carNumber" size="50" value="" type="text"></td>
                            </tr>
                             <tr>
                                <th>厂存煤:</th>
                                <td><input class="common-text" name="changCunMei" size="50" value="" type="text"></td>
                            </tr>
                             <tr>
                                <th>日上煤:</th>
                                <td><input class="common-text" name="riShangMei" size="50" value="" type="text"></td>
                            </tr>
                             <tr>
                                <th>自有煤矿:</th>
                                <td><input class="common-text" name="ziYouMeiKuang" size="50" value="" type="text"></td>
                            </tr>
                             <tr>
                                <th>港存煤:</th>
                                <td><input class="common-text" name="gangCunMei" size="50" value="" type="text"></td>
                            </tr>
                             <tr>
                                <th>发运情况:</th>
                                <td><input class="common-text" name="theShipment" size="50" value="" type="text"></td>
                            </tr>
                            
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
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

<%-- 	<form action="<%=basePath %>report/add" method="post" name="form">
		车站:
		<select name="station">
			<c:forEach items="${stationList}" var="station">
				<option value="${station.coalName}">${station.coalName}</option>
			</c:forEach>
		</select><br/>
		煤站:
		<select name="coalStation">
			<c:forEach items="${coalStationList}" var="coalStation">
				<option value="${coalStation.coalName}">${coalStation.coalName}</option>
			</c:forEach>
		</select><br/>
		发货单位:
		<select name="deliveryUnit">
			<c:forEach items="${deliveryUnitList}" var="deliveryUnit">
				<option value="${deliveryUnit.coalName}">${deliveryUnit.coalName}</option>
			</c:forEach>
		</select><br/>
		煤种:
		<select name="coalType">
			<c:forEach items="${meizhongList}" var="meizhong">
				<option value="${meizhong.coalName}">${meizhong.coalName}</option>
			</c:forEach>
		</select><br/>
		到站:
		<input type="text" name="toStation" value=""/><br/>
		车数:
		<input type="text" name="carNumber" value=""/><br/>
		厂存煤:
		<input type="text" name="changCunMei" value=""/><br/>
		日上煤:
		<input type="text" name="riShangMei" value=""/><br/>
		自有煤矿:
		<input type="text" name="ziYouMeiKuang" value=""/><br/>
		港存煤:
		<input type="text" name="gangCunMei" value=""/><br/>
		发运情况:
		<input type="text" name="theShipment" value=""/><br/>
		
		<input type="submit" >
	</form> --%>
</body>
</html>