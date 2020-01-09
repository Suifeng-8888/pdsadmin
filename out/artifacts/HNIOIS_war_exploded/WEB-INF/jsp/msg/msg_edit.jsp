<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>信息查看</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${quartz.id}">

    <div class="layui-form-item">

        <label class="layui-form-label">提示对象<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mach_name"  class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${quartz.mach_name}">
        </div>
        <label class="layui-form-label">消息信息</label>
        <div class="layui-input-block">
            <input name="msg" class="layui-input" type="text" autocomplete="off"
                   value="${quartz.msg}">
        </div>
        <label class="layui-form-label">消息类型</label>
        <div class="layui-input-block">
            <input name="flag" class="layui-input" type="text" autocomplete="off"
                   value="${quartz.flag}">
        </div>
        <label class="layui-form-label">消息时间</label>
        <div class="layui-input-block">
            <input name="msg_time" class="layui-input" type="text" autocomplete="off"
                   value="${quartz.msg_time}">
        </div>
    </div>

</form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {

    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

    });

    function closeWin(){
       parent.layer.close(index);
    }

</script>
</html>