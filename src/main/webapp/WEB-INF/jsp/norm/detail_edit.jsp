<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${detail.id}">
            <div id="zxbz">
                <label class="layui-form-label">执行标准<span style="color: #FF5722">*</span></label>
                <div class="layui-input-block">
                    <input id="norm_name" style="height:36px;width:400px" type="text" autocomplete="off" readonly="readonly" lay-verify="required">
                    <span class="layui-btn-normal layui-btn" data-method="notice">选择标准</span>
                    <input id="norm_id" name="norm_id" type="hidden" value="${detail.norm_id}"/>
                </div>
            </div>
            <label class="layui-form-label">检测对象<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="detail_object" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${detail.detail_object}">
            </div>
            <label class="layui-form-label">检测项目<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="detail_options" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${detail.detail_options}">
            </div>
            <label class="layui-form-label">检测标准值<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="detail_value" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${detail.detail_value}">
            </div>
            <label class="layui-form-label">检测范围</label>
            <div class="layui-input-block">
                <input name="value_updown" class="layui-input" type="text" autocomplete="off" value="${detail.value_updown}">
            </div>
        <div class="layui-form-item" style="text-align: center;margin-top: 30px;">
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
            var url = "normDetail/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${detail.code}"=="1"){
            $("#form-button").show();
        }
    }

    $('#zxbz .layui-btn').on('click', function(){
        layer.open({
            title:'选择标准',
            type:2,
            offset:'auto',
            maxmin: true,
            moveType: 1,//可以拖拽
            content:'normDetail/zxbz.do',
            area: ['90%', '90%']
        });
    });

</script>
</html>