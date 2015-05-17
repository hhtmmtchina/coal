<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<title>朔州车务段煤炭管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/main.css"/>

<script src="<%=basePath %>/js/jquery.js"></script>
<script src="<%=basePath %>/js/common-functions.js"></script>
</head>
${success}
<body>

<jsp:include page="../head.jsp"></jsp:include>
<div class="container clearfix">
<jsp:include page="../menu.jsp"></jsp:include>

    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">用户列表</span></div>
        </div>
        <!-- <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="">
                                    <option value="">全部</option>
                                    <option value="19">精品界面</option><option value="20">推荐界面</option>
                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div> -->
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="<%=basePath %>user/user.jsp"><i class="icon-font"></i>添加用户</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr style="line-height: 25px;">
                            <th>ID</th>
                            <th>单位名称</th>
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>创建时间</th>
							<th>操作</th>
                        </tr>
                        <c:forEach items="${userList}" var="user">
                        <tr>
							<td>${user.id}</td>
							<td>
								<c:if test="${user.usertype ==1 }">朔州车务段</c:if>
								<c:if test="${user.usertype ==2 }">装车站</c:if>
								<c:if test="${user.usertype ==3 }">三晋快运</c:if>
							</td>
							<td>${user.username}</td>
							<td>${user.mobile}</td>
							<td><fmt:formatDate value="${user.createdtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>
                                <a class="link-update" href="edit/${user.id}">修改</a>
                                <a class="link-del" href="delete/${user.id}">删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <div class="list-page">
                    	<a href="<%=basePath %>user/list?page=1">首页</a>&nbsp;
						<c:if test="${page.currentPage > 1 }"><a href="<%=basePath %>user/list?page=${page.currentPage-1}">上一页</a>&nbsp;</c:if>
						<c:if test="${page.currentPage == 1 }">上一页&nbsp;</c:if>
						<c:if test="${page.currentPage < page.maxPage}"><a href="<%=basePath %>user/list?page=${page.currentPage+1}">下一页</a>&nbsp;</c:if>
						<c:if test="${page.currentPage == page.maxPage}">下一页&nbsp;</c:if>
						<a href="<%=basePath %>user/list?page=${page.maxPage}">尾页</a>
						共${page.currentPage}/${page.maxPage}页&nbsp;&nbsp;
		                    </div>
               		</div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>

<%-- 	<form action="" method="post">
		<c:forEach items="${userList}" var="user">
			${user.id}-${user.username}-${user.password}-${user.mobile}
			<a href="edit/${user.id}">修改</a>&nbsp;&nbsp;<a href="delete/${user.id}">删除</a> <br/>
		</c:forEach>
	</form> --%>
</body>
</html>