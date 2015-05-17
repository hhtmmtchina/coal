<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朔州车务段煤炭户头信息管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/admin_login.css"/>

<script src="<%=basePath %>js/jquery.js"></script>
<script src="<%=basePath %>js/common-functions.js"></script>
</head>
<script>
	function login(){
		window.form.submit();
	}
	
	function company(){
		var usertype = $("#usertype").val();
		if(usertype > 0) $("#username").attr("disabled",false);
		else $("#username").attr("disabled",true);
		companyType(usertype);
	}
</script>
${message}
<body>
<div class="admin_login_wrap">
    <h1>朔州车务段煤炭户头信息管理系统</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="login" method="post" name="form">
                <ul class="admin_items">
                    <li>
                        <select name="usertype" id="usertype" onchange="company()" class="admin_input_style">
							<option value="-1">请选择单位名称</option>
							<option value="1">朔州车务段</option>
							<option value="2">装车站</option>
							<option value="3">三晋快运</option>	
						</select>
                      <!--   <input type="text" name="username" value="admin" id="user" size="40" class="admin_input_style" /> -->
                    </li>
                    <li>
                        <select name="username" id="username" class="admin_input_style" disabled="disabled">
							<option value="-1">请选择姓名</option>
							<option value="szcwd">朔州车务段</option>
						</select>
                        <!-- <input type="password" name="pwd" value="admin" id="pwd" size="40" class="admin_input_style" /> -->
                    </li>
                    <li>
                        <input type="password" name="password"  id="pwd" size="40" class="admin_input_style" />
                        
                    </li>
                    <li>
                       	<input type="text" id="checkcode" name="checkcode" style="height:25px;" value=""/>
                       	<a href="#"><img onclick="this.src='<%=path %>/code.jpg?time='+ new Date().getTime()" src="<%=path %>/code.jpg?time="+ new Date().getTime() alt="验证码"  width="100" height="25" style="margin-bottom:-9px"/></a> 看不清楚请点击图片
                    </li>
                    
                    <li>
                        <input type="button" tabindex="3" value="提交"  onclick="login()" class="btn btn-primary" />
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <p class="admin_copyright"><a tabindex="5" href="" target="_blank">返回首页</a> &copy; 2014 Powered by <a href="" target="_blank">朔州车务段</a></p>
</div>
<%-- 

	<form action="login" method="post" name="form">
		单位名称:
		<select name="usertype" id="usertype" onchange="company()">
			<option value="-1">请选择单位名称</option>
			<option value="1">朔州车务段</option>
			<option value="2">装车站</option>
			<option value="3">三晋快运</option>	
		</select><br/>
		用户名：
		<select name="username" id="username">
			<option value="-1">请选择姓名</option>
			<option value="szcwd">朔州车务段</option>
		</select><br/>
		密码：<input type="password" name="password" value=""><br/>
		验证码：<input type="text" id="checkcode" name="checkcode" value=""/>
		<a href="#"><img onclick="this.src='<%=path %>/code.jpg?time='+ new Date().getTime()" src="<%=path %>/code.jpg?time="+ new Date().getTime() alt="验证码"  width="100" height="25" style="margin-bottom:-9px"/></a> 看不清楚请点击图片 
		<input type="button" value="登录" onclick="login()"/>
	</form> --%>
</body>
</html>