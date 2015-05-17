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
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="container clearfix">
<jsp:include page="menu.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>欢迎朔州车务段煤炭管理系统。</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="<%=basePath %>report/loaddata"><i class="icon-font">&#xe001;</i>新增18点报告记录</a>
                   
                </div>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>系统基本信息</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">操作系统</label><span class="res-info">Windows</span>
                    </li>
                    <li>
                        <label class="res-lab">运行环境</label><span class="res-info">Apache/Tomcat6.0/JDK6</span>
                    </li>
                    <li>
                        <label class="res-lab">北京时间</label><span class="res-info">2014年3月18日 21:08:24</span>
                    </li>
                  
                </ul>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>