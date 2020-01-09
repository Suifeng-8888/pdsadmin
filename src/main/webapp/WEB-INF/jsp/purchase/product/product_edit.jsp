<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>XX管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${product.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">产品编号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_id" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${product.pro_id}">
            </div>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品名<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${product.pro_name}">
            </div>
        <%--</div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">产品条形码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="bar_code" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${product.bar_code}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品规格<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_unit" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${product.pro_unit}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">说明<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="statement" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${product.statement}">
            </div>
       <%-- </div>--%>
        </div>
        <div class="layui-form-item" style="text-align: center;"  >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
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
        init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "product/" + ($("#key").val()==""?"add":"update") + ".do";
            $.ajax({
                url: url,
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

    function init(){
        //初始化按钮操作
        if("${product.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>