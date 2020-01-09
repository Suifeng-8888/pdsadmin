<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>送检样品明细管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${send.id}">
    <div class="layui-form-send">
        <label class="layui-form-label">样品编号</label>
        <div class="layui-input-block">
            <input name="item_number" class="layui-input" type="text" autocomplete="off" readonly="readonly" value="${send.item_number}">
        </div>
    </div>
    <div class="layui-form-send">
        <label class="layui-form-label">样品名称</label>
        <div class="layui-input-block">
            <input name="item_name" class="layui-input" type="text" autocomplete="off" readonly="readonly" value="${send.item_name}">
        </div>
    </div>

    <div id="jcbg">
        <label class="layui-form-label">检测报告<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="serial_number" name="serial_number" class="layui-input" type="text" autocomplete="off" readonly="readonly"
                   lay-verify="required" value="${send.serial_number}">
            <span class="layui-btn-normal layui-btn" data-method="notice">选择报告</span>
        </div>
    </div>
    <div class="layui-form-send">
        <label class="layui-form-label">检测结果</label>
        <div class="layui-input-block">
            <select name="test_results">
                <option value=""></option>
                <option value="1">合格</option>
                <option value="0">不合格</option>
            </select>
        </div>
    </div>
    <div class="layui-form-send" id="form-button" style="text-align: center;margin-top: 30px;">
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
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

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            $.ajax({
                url: "send/update.do",
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

        //  选择检测报告
        $('#jcbg .layui-btn').on('click', function(){
            layer.open({
                title:'选择检测报告',
                type:2,
                offset:'auto',
                maxmin: true,
                moveType: 1,//可以拖拽
                content:'send/jcbg.do',
                area: ['90%', '90%']
            });
        });
    });

    //关闭按钮
    function closeWin(){
       parent.layer.close(index);
    }
</script>
</html>