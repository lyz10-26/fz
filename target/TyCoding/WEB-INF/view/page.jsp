<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/lib/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/lib/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/lib/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 13px;"><strong>后台管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/admin/page.do" style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <strong>${sessionScope.name}</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="<%=basePath%>/admin/outLogin.do" style="text-decoration: none"><strong>退出登录</strong></a></dd>
                </dl>
            </li>
               </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;文章管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();" style="text-decoration: none;"><strong>文章列表</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();" style="text-decoration: none;"><strong>文章草稿</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();" style="text-decoration: none;"><strong>回收站</strong></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="font-size: 45px;color: #1D9D73;margin-top: 300px;" class="text-center"><strong>欢迎登录虚拟仿真实验教学系统</strong></div>
            <p class="text-center">
                <strong style="color: #1D9D73;">本系统采用前端使用LayUI进行美化</strong>
            </p>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 后台管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<script src="<%=basePath%>/lib/layui/layui.js"></script>
<script src="<%=basePath%>/lib/bootstrap.min.js"></script>
<script src="<%=basePath%>/lib/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toArticleWrite() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleWrite.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toArticleManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleManage.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toArticleTrash() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleTrash.do\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>