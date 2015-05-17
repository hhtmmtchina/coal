<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/main.css"/>

<script type="text/javascript" src="<%=basePath %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/common-functions.js"></script>
<script>
	$(function(){
		companyType(${user.usertype});
		$("#username option").each(function(){
			var option_val = $(this).val();
			if(option_val == '${user.username}'){
				$(this).attr("selected",true);
			}
		});
	});
	function company1(){
		var usertype = $("#usertype").val();
		companyType(usertype);
	}
</script>
</head>
<body>

<jsp:include page="../head.jsp"></jsp:include>
<div class="container clearfix">
<jsp:include page="../menu.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>index.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="/jscss/admin/design/">编辑用户</a></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
               <form action="<%=basePath %>/user/update/${user.id}" method="post" name="form">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>单位名称:</th>
                            <td>
                            	<select name="usertype" id="usertype" onchange="company()">
									<option value="-1">请选择单位名称</option>
									<option value="1" <c:if test="${user.usertype == 1}">selected="selected"</c:if>>朔州车务段</option>
									<option value="2" <c:if test="${user.usertype == 2}">selected="selected"</c:if>>装车站</option>
									<option value="3" <c:if test="${user.usertype == 3}">selected="selected"</c:if>>三晋快运</option>	
								</select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>用户名：</th>
                                <td>
                                	<select name="username" id="username">
										<option value="-1">请选择姓名</option>
										<option value="szcwd">朔州车务段</option>
									</select>
                                   <!--  <input class="common-text required" id="title" name="title" size="50" value="" type="text"> -->
                                </td>
                            </tr>
                             <tr>
                                <th>手机号：</th>
                                <td><input class="common-text" name="mobile" id="mobile" size="50" value="${user.mobile}" type="text"></td>
                            </tr>
                            
                            <tr>
                                <th></th>
                                <td>
                                	<input type="button" class="btn btn-primary btn6 mr10" value="更新" onclick="validate()" >
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>



<%-- 

	<form action="<%=basePath %>/user/update/${user.id}" method="post" name="form">
		单位名称:
		<select name="usertype" id="usertype" onchange="company1()">
			<option value="-1">请选择单位名称</option>
			<option value="1" <c:if test="${user.usertype == 1}">selected="selected"</c:if>>朔州车务段</option>
			<option value="2" <c:if test="${user.usertype == 2}">selected="selected"</c:if>>装车站</option>
			<option value="3" <c:if test="${user.usertype == 3}">selected="selected"</c:if>>三晋快运</option>	
		</select>
		用户名：
		<select name="username" id="username">
			<option value="-1">请选择姓名</option>
			<option value="szcwd">朔州车务段</option>
		</select><br/>
		
		手机号：<input type="text" name="mobile" id="mobile" value="${user.mobile}"><br/>
		<input type="button" value="更新" onclick="validate()">
	</form> --%>
</body>
</html>