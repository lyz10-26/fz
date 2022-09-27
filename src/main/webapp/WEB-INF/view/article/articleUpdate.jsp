<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/lib/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/lib/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <div style="margin-top: 60px;">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 140px;border-bottom: none;"><strong>更新文章信息</strong></legend>
        </fieldset>
    </div>
    <br/>
    <!-- 文章信息的表单 -->
    <div class="layui-form">
        <form>
            <div class="layui-inline" style="margin-left: -10px;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章编号</strong></label>
                <div class="layui-input-inline" style="margin-left: -502px;">
                    <input name="r_id" id="r_id" class="layui-input" value="${article.r_id}" readonly="readonly"/>
                </div>
                <label class="layui-form-label" style="margin-left: 157px;width:90px;"><strong>文章作者</strong></label>
                <div class="layui-input-inline" style="margin-left:87px;">
                    <input type="text" name="r_author" id="r_author" value="${article.r_author}" class="layui-input"/>
                </div>
                <label class="layui-form-label" style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>
                <div class="layui-input-inline" style="margin-left: 88px;">
                    <input type="text" name="date" id="r_date" value="${article.r_date}" class="layui-input"/>
                </div>
            </div>
            <hr style="margin-top: 0;"/>
            <div class="layui-inline" style="margin-left: -10px;padding-left: 0;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>文章简介</strong></label>
                <div class="layui-input-inline" style="margin-left: -6px;width: 275px;">
                        <input type="text" name="r_summary" id="r_summary" value="${article.r_summary}" class="layui-input"/>
                </div>
            </div>
            <br/>
            <br/>
            <label><strong>文章内容</strong></label>

            <!-- 加载编辑器的容器 -->

            <script id="container" name="r_content" type="text/plain" style="height: 400px;"></script>
            <!-- 配置文件 -->
            <script src="<%=basePath%>/lib/ueditor/ueditor.config.js"></script>
            <!-- 编辑器源码配置文件 -->
            <script src="<%=basePath%>/lib/ueditor/ueditor.all.js"></script>

            <script type="text/javascript">
                <!-- 实例化编辑器 -->
                var ue = UE.getEditor('container');
                // 先回显数据
                var content = '${article.r_content}';
                ue.addListener("ready",function(){
                    ue.setContent(content,true);
                });

            </script>
            <div class="layui-inline" style="margin-top: 20px;">
                <button type="button" id="verifyBtn" class="layui-btn">存入草稿箱</button>
                <button type="button" id="publishBtn" class="layui-btn">发布</button>
                <button type="button" id="cleanBtn" class="layui-btn">清空</button>
            </div>
        </form>
    </div>

</div>
</body>

<!-- JQuery的配置 -->
<script src="<%=basePath%>/lib/jquery-3.3.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="<%=basePath%>/lib/layui/layui.all.js"></script>

<script type="text/javascript">
    <!-- 初始化layui -->
    layui.use('element', function(){
        var element = layui.element;
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#r_date'
        });
    });
</script>
<script type="text/javascript">
    // 如果点击了存入草稿箱
    $("#verifyBtn").click(function(){
        var r_id = $("#r_id").val();
        var r_author = $("#r_author").val();
        var r_summary = $("#r_summary").val();
        var r_content = ue.getContent();
        var r_date = $("#r_date").val();
        var r_verify = 1;
        var r_publish = 0;
        var r_status = 0;
        $.ajax({
            url: '<%=basePath%>/article/update.do',
            type: 'POST',
            data: {
                r_id: r_id,
                r_author: r_author,
                r_summary: r_summary,
                r_content: r_content,
                r_date: r_date,
                r_verify: r_verify,
                r_publish: r_publish,
                r_status: r_status
            },
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '更新信息失败'
                });
            }
        });
    });

    // 如果点击了发布按钮
    $("#publishBtn").click(function(){
        var r_id = $("#r_id").val();
        var r_author = $("#r_author").val();
        var r_summary = $("#r_summary").val();
        var r_content = ue.getContent();
        var r_date = $("#r_date").val();
        var r_verify = 1;
        var r_publish = 1;
        var r_status = 0;
        $.ajax({
            url: '<%=basePath%>/article/update.do',
            type: 'POST',
            data: {
                r_id: r_id,
                r_author: r_author,
                r_summary: r_summary,
                r_content: r_content,
                r_date: r_date,
                r_verify: r_verify,
                r_publish: r_publish,
                r_status: r_status
            },
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '更新信息失败'
                });
            }
        });
    });

    // 清空
    $("#cleanBtn").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要清空文章内容吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                ue.execCommand('cleardoc');
                layer.close(index);
            }
        });
    });
</script>
</html>
