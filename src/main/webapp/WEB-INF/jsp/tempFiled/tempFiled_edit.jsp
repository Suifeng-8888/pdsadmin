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
    <title>模板明细信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${tempFiled.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">模版主表KEY<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="temp_id" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${tempFiled.temp_id}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Key<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="filed_id" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${tempFiled.filed_id}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="filed_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${tempFiled.filed_name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类型<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="filed_type" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${tempFiled.filed_type}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">长度<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="filed_order" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${tempFiled.filed_order}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注释</label>
            <div class="layui-input-block">
                <input name="filed_comment" class="layui-input" type="text" autocomplete="off"
                        value="${tempFiled.filed_comment}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">默认值</label>
            <div class="layui-input-block">
                <input name="filed_default" class="layui-input" type="text" autocomplete="off"
                        value="${tempFiled.filed_default}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证</label>
            <div class="layui-input-block">
                <input name="filed_check" class="layui-input" type="text" autocomplete="off"
                        value="${tempFiled.filed_check}">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;"  >
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
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
            var url = "tempFiled/" + ($("#key").val()==""?"add":"update") + ".do";
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

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${tempFiled.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>