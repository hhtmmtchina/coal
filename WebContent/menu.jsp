<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="<%=basePath %>report"><i class="icon-font">&#xe008;</i>18点报告</a></li>
                        <li><a href="<%=basePath %>report/loaddata"><i class="icon-font">&#xe005;</i>添加报告记录</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="<%=basePath %>user/list"><i class="icon-font">&#xe017;</i>用户管理</a></li>
                        <li><a href="<%=basePath %>user/user.jsp"><i class="icon-font">&#xe006;</i>添加用户</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>