<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script src="<%=basePath %>/js/jquery.js"></script>
<script src="<%=basePath %>/js/common-functions.js"></script>
<script>
	function company(){
		var usertype = $("#usertype").val();
		companyType(usertype);
	}
</script>
</head>
<body>
${message}

<jsp:include page="../head.jsp"></jsp:include>
<div class="container clearfix">
<jsp:include page="../menu.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>index.jsp">首页</a><span class="crumb-step">&gt;</span>添加用户</div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
               <form action="save" method="post" name="form">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>单位名称:</th>
                            <td>
                            	<select name="usertype" id="usertype" onchange="company()">
									<option value="-1">请选择单位名称</option>
									<option value="1">朔州车务段</option>
									<option value="2">装车站</option>
									<option value="3">三晋快运</option>	
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
                                <th>密码：</th>
                                <td><input class="common-text" name="password" size="50" id="pass" value="" type="password"></td>
                            </tr>
                             <tr>
                                <th>确认密码：</th>
                                <td><input class="common-text" name="confirm_pass" id="confirm_pass" size="50" value="" type="password"></td>
                            </tr>
                             <tr>
                                <th>手机号：</th>
                                <td><input class="common-text" name="mobile" id="mobile" size="50" value="" type="text"></td>
                            </tr>
                            
                            <tr>
                                <th></th>
                                <td>
                                	<input type="button" class="btn btn-primary btn6 mr10" value="添加" onclick="validate()" >
                                   <!--  <input class="btn btn-primary btn6 mr10" value="提交" type="submit"> -->
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

	<!-- <form action="save" method="post" name="form">
		单位名称:
		<select name="usertype" id="usertype" onchange="company()">
			<option value="-1">请选择单位名称</option>
			<option value="1">朔州车务段</option>
			<option value="2">装车站</option>
			<option value="3">三晋快运</option>	
		</select>
		用户名：
		<select name="username" id="username">
			<option value="-1">请选择姓名</option>
			<option value="szcwd">朔州车务段</option>
		</select><br/>
		密码：<input type="password" name="password" id="pass" value=""><br/>
		确认密码：<input type="password" name="confirm_pass" id="confirm_pass" value=""><br/>
		手机号：<input type="text" name="mobile" id="mobile" value=""><br/>
		<input type="button" value="添加" onclick="validate()" >
	</form> -->
</body>
</html>