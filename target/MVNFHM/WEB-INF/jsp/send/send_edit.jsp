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
        <label class="layui-form-label">样品编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="item_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${send.item_id}">
        </div>
    </div>
    <div class="layui-form-send">
        <label class="layui-form-label">样品名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="item_name" id="name" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${send.item_name}">
        </div>
    </div>
    <div class="layui-form-send">
        <label class="layui-form-label">样品数量</label>
        <div class="layui-input-block">
            <input name="send_num" class="layui-input" type="text" autocomplete="off"
                   value="${send.send_num}">
        </div>
    </div>


    <div class="layui-form-send">
        <label class="layui-form-label">送检人</label>
        <div class="layui-input-block">
            <input name="sender" class="layui-input" type="text" autocomplete="off"
                   value="${send.sender}">
        </div>
    </div>

    <div class="layui-form-send" id="send_time">
        <label class="layui-form-label">送检时间</label>
        <div class="layui-input-block">
            <input type="text" name="send_time"  class="layui-input"
                   value="${send.send_time}"  disabled="disabled">
        </div>
    </div>
    <div class="layui-form-send">
        <label class="layui-form-label">报告编号</label>
        <div class="layui-input-block">
            <input name="result" class="layui-input" type="text" autocomplete="off" lay
                   lay-verify="required"   id="test" placeholder="请选择"   value="${send.result}">
            <span id="chose" data-method="notice" class="layui-btn">录入报告编号</span>
        </div>
    </div>
    <div class="layui-form-send">
        <label class="layui-form-label">录入时间</label>
        <div class="layui-input-block">
            <input name="result_time" class="layui-input" type="text" id="test2" placeholder="yyyy-MM-dd"
                   autocomplete="off"  lay-verify="required"  value="${send.result_time}">
        </div>
    </div>
    <div class="layui-form-send" id="recorder">
        <label class="layui-form-label">录入人</label>
        <div class="layui-input-block">
            <input name="recorder" class="layui-input" type="text" autocomplete="off"
                   value="${send.recorder}">
        </div>
    </div>
    <div class="layui-form-send" style="text-align: center;display: none" id="form-button">
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
        init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate=layui.laydate;

        //获取时间日历
        laydate.render({
            elem: '#test2'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "send/" + ($("#key").val()==""?"save":"update") + ".do";
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

        //触发事件
        var active={
            notice:function () {
                layer.open({
                    title: "录入的报告编号",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "send/choose.do",
                    area: ['600px', '80%'],
                });
            }
        }

        $('#chose').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){

        //初始化按钮操作
        if("${send.code}"=="1"){
            $("#form-button").show();
            $("#recorder").hide();
        }

    }



</script>
</html>