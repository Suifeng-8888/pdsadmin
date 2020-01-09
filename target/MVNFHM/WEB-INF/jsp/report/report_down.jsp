<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <input name="record_id" value="${record_id}" type="hidden"/>
    <input name="serial_number" value="${serial_number}" type="hidden"/>
    <label class="layui-form-label">报告模板<span style="color: #FF5722">*</span></label>
    <div class="layui-input-block">
        <select lay-verify="required" name="tempId" id="tempId">
            <option value="" selected></option>
            <c:forEach items="${templates}" var="item">
                <option value="${item.id}">${item.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="layui-form-item" style="text-align: center;margin-top: 30px;">
        <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button">生成报告</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

<%--文件下载--%>
<div style="display: none" id="download" url="" onclick="fileDownload(this)">下载</div>
<form id="file-form" action="file/download.do" method="post">
    <input name="path" type="hidden">
</form>

</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var form = layui.form;
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "report/downreport";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.obj.state=="ok"){
                        layui.layer.msg(data.obj.msg);
                        $("#download").attr("url",data.worldPath);
                        $("#download").click();
                        closeWin();
                    }else{
                        layui.layer.msg(data.obj.msg);
                    }
                }
            });
            return false;
        });
    });
    //关闭
    function closeWin(){
        parent.layer.close(index);
    }
</script>
</html>