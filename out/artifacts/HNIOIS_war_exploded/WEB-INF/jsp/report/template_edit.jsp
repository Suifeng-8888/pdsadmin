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
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">模板名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="name" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">文件版本<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select lay-verify="required" name="version">
                <option value="" selected></option>
                <option value="2003">2003</option>
                <option value="2007">2007</option>
            </select>
        </div>--%>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">模板文件<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="path" id="path" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="" readonly >
            <button type="button" class="layui-btn" id="uptemplate"><i class="layui-icon"></i>上传模板</button>
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input name="bz" class="layui-input" type="text" autocomplete="off" alue="">
        </div>
    <%--</div>--%>
    <div class="layui-form-item" style="text-align: center;margin-top: 30px;">
        <button class="layui-btn" lay-filter="formSave" lay-submit >保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //layui模块加载 order-2
    layui.use(['layer', 'form' ,'upload'], function() {
        var layer = layui.layer,
            form = layui.form,
            upload = layui.upload;

        upload.render({
            elem: '#uptemplate',
            url: 'file/upload',
            accept: 'file',
            exts: 'doc|docx|'
            ,done: function(res){
                if (res.state == "ok") {
                    $("#path").val(res.url);
                } else {
                    layer.msg("文件上传异常!!");
                }
            }
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            $.ajax({
                url: "template/add.do",
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.state=="ok"){
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });
    });

    function closeWin(){
        parent.layer.close(index);
    }

</script>
</html>