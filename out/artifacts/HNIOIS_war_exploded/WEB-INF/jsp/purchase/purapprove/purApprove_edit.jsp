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
    <title>采购审批表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${purApprove.id}">
    <input type="hidden" name="pro_id"  value="${purApprove.pro_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">采购商品</label>
        <div class="layui-input-block">
            <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                   value="${purApprove.pro_name}">
        </div>

   <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">采购数量</label>
        <div class="layui-input-block">
            <input name="pur_num" class="layui-input" type="text" autocomplete="off"
                   value="${purApprove.pur_num}">
        </div>
    <%--</div>--%>
   <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">申请人</label>
        <div class="layui-input-block">
            <input name="applyer" class="layui-input" type="text" autocomplete="off"
                   value="${purApprove.applyer}">
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item" id="send_time">--%>
        <div id="send_time">
            <label class="layui-form-label">申请时间</label>
            <div class="layui-input-block">
                <input type="text" name="apply_time"  class="layui-input" id="test1" placeholder="yyyy-MM-dd"
                       autocomplete="off"  value="${purApprove.apply_time}">
            </div>
        </div>
    <%--<div class="layui-form-item" id="approve">--%>
        <div id="approve">
            <label class="layui-form-label">审批人</label>
            <div class="layui-input-block">
                <input name="approver" class="layui-input" type="text" autocomplete="off"
                       value="${purApprove.approver}">
            </div>
        </div>
    <%--<div class="layui-form-item" id="appr_time">--%>
        <div id="appr_time">
            <label class="layui-form-label">审批时间</label>
            <div class="layui-input-block">
                <input name="approve_time" class="layui-input" type="text" autocomplete="off"
                       value="${purApprove.approve_time}">
            </div>
        </div>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">批次号</label>
        <div class="layui-input-block">
            <input name="pur_batch" class="layui-input" type="text" autocomplete="off"
                   value="${purApprove.pur_batch}">
        </div>
   <%-- </div>--%>
    <%--<div class="layui-form-item" >--%>
        <label class="layui-form-label">询价人</label>
        <div class="layui-input-block">
            <input name="purchaser" class="layui-input" type="text" autocomplete="off"
                   value="${purApprove.purchaser}">
        </div>
   <%-- </div>--%>

    <%--<div class="layui-form-item" id="check">--%>
        <div id="check">
            <label class="layui-form-label">询价情况</label>
            <div class="layui-input-block">
                <select name="state" id="stu" lay-search="">
                    <option value="0">已询价</option>
                    <option value="1">待询价</option>
                </select>
            </div>
        </div>

    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button">
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
        initCheck();
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

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "approve/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${purApprove.code}"=="1"){
            $("#form-button").show();
            $("#approve").hide();
            $("#appr_time").hide();
        }

    }
    //初始化审批状态
    function initCheck(){
        $("#stu").val(${purApprove.state});
    }

</script>
</html>