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
    <title>样品明细管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${item.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">样品编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="item_number" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${item.item_number}">
        </div>
        <label class="layui-form-label">样品名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="item_name" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${item.item_name}">
        </div>
        <div id="ypfl">
            <label class="layui-form-label">样品分类<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input id="item_sort" name="item_sort" style="height:36px;width:400px" type="text" autocomplete="off" readonly="readonly"
                       lay-verify="required" value="${item.item_sort}">
                <span class="layui-btn-normal layui-btn" data-method="notice">选择分类</span>
            </div>
        </div>
        <div id="sybz">
            <label class="layui-form-label">检测标准<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input id="use_standard" name="use_standard" style="height:36px;width:400px" type="text" autocomplete="off" readonly="readonly"
                       lay-verify="required" value="${item.use_standard}">
                <span class="layui-btn-normal layui-btn" data-method="notice">选择标准</span>
            </div>
            <input type="hidden" id="norm_id" name="norm_id" value="${item.norm_id}"/>
        </div>
        <label class="layui-form-label">样品状态</label>
        <div class="layui-input-block">
            <input name="item_state" class="layui-input" type="text" autocomplete="off" value="${item.item_state}">
        </div>
        <label class="layui-form-label">样品数量</label>
        <div class="layui-input-block">
            <input name="item_num" class="layui-input" type="text" autocomplete="off" value="${item.item_num}">
        </div>

        <label class="layui-form-label">抽/送样时间</label>
        <div class="layui-input-block">
            <input class="layui-input" id="send_time" name="send_time" autocomplete="off" placeholder="yyyy-MM-dd" value="${item.send_time}" type="text">
        </div>
        <label class="layui-form-label">抽/送样人</label>
        <div class="layui-input-block">
            <input name="send_person" class="layui-input" type="text" autocomplete="off" value="${item.send_person}">
        </div>
        <label class="layui-form-label">抽/送样单位</label>
        <div class="layui-input-block">
            <input name="send_unit" class="layui-input" type="text" autocomplete="off" value="${item.send_unit}">
        </div>
        <label class="layui-form-label">抽/送样地点</label>
        <div class="layui-input-block">
            <input name="send_site" class="layui-input" type="text" autocomplete="off" value="${item.send_site}">
        </div>
        <label class="layui-form-label">抽/送样基数</label>
        <div class="layui-input-block">
            <input name="send_number" class="layui-input" type="text" autocomplete="off" value="${item.send_number}">
        </div>
        <label class="layui-form-label">检测时间</label>
        <div class="layui-input-block">
            <input class="layui-input" id="testing_time" name="testing_time" autocomplete="off" placeholder="yyyy-MM-dd" value="${item.testing_time}" type="text">
        </div>

        <label class="layui-form-label">检测人</label>
        <div class="layui-input-block">
            <input name="detection_name" class="layui-input" type="text" autocomplete="off" value="${item.detection_name}">
        </div>

        <label class="layui-form-label">检测类别</label>
        <div class="layui-input-block">
            <input name="detection_type" class="layui-input" type="text" autocomplete="off" value="${item.detection_type}">
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <button class="layui-btn" lay-filter="formSave" lay-submit style="display: none" id="form-button">保存</button>
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
        initCheck();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate;

        laydate.render({
            elem: '#send_time'
        });
        laydate.render({
            elem: '#testing_time'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "item/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${item.code}"=="1"){
            $("#form-button").show();
            $("#check").hide();//新增或编辑时禁止修改检测状态
        }
        if("${item.code}"!="0"&&$("#key").val()!=""){//当为编辑时,禁止修改送样时间
            $("#send_time").attr("disabled",true);
        }
    }

    function initCheck(){
        $("#stu").val(${item.checked});
    }

    //  选择样品分类
    $('#ypfl .layui-btn').on('click', function(){
        layer.open({
            title:'选择样品分类',
            type:2,
            offset:'auto',
            maxmin: true,
            moveType: 1,//可以拖拽
            content:'item/ypfl.do',
            area: ['90%', '90%']
        });
    });
    //  选择检测标准
    $('#sybz .layui-btn').on('click', function(){
        layer.open({
            title:'选择检测标准',
            type:2,
            offset:'auto',
            maxmin: true,
            moveType: 1,//可以拖拽
            content:'item/sybz.do',
            area: ['90%', '90%']
        });
    });

</script>
</html>