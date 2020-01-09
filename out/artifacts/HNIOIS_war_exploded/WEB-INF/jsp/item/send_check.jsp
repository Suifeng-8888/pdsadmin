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
    <title>样品送检明细</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="nums"  value="${send.nums}">
    <input type="hidden" name="item_id"  value="${send.item_id}">

    <div class="layui-form-item">
        <label class="layui-form-label">送检样品名<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="item_name" id="name" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${send.item_name}">
        </div>
    </div>


    <div class="layui-form-item" id="send_time">
        <label class="layui-form-label">送检时间</label>
        <div class="layui-input-block">
            <input type="text" name="send_time"  class="layui-input" id="test1" placeholder="yyyy-MM-dd"
                   autocomplete="off"   lay-verify="required"  value="${send.send_time}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">送检人</label>
        <div class="layui-input-block">
            <input name="sender" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required"    value="${send.sender}">
        </div>
    </div>

    <div class="layui-form-item" style="text-align: center;" id="form-button">
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
    //初始化函数 order-1
    $(document).ready(function() {
        // init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate=layui.laydate;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });

        //获取时间日历
        laydate.render({
            elem: '#test2'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "send/add.do";
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
</script>
</html>