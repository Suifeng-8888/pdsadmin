<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>审批表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, apply-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input name="apply_id" class="layui-input" type="hidden" autocomplete="off" value="${apply.apply_id}">

    <div class="layui-form-item">
        <label class="layui-form-label">仪器名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mach_name" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.mach_name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">仪器型号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mach_model" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.mach_model}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">精确度<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="fate" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.fate}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生产商<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="factory" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.factory}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">购买单价<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="price" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.price}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">购买数量<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="apply_num" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.apply_num}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">申请人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="applyer" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${apply.applyer}">
        </div>
    </div>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">相关附件<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="reason" class="layui-input" type="text" autocomplete="off"
                   value="${apply.reason}">
        </div>
    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">杂费<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="cment" class="layui-input" type="text" autocomplete="off"
                   value="${apply.cment}">
        </div>
    </div>

    <div class="layui-form-item" id="app_time">
        <label class="layui-form-label">申请时间</label>
        <div class="layui-input-block">
            <input name="apply_time" class="layui-input" type="text" autocomplete="off"
                   value="${apply.apply_time}">
        </div>
    </div>
    <div class="layui-form-item" >
        <label class="layui-form-label">审批状态</label>
        <div class="layui-input-block">
            <select name="status" id="status"  lay-search="" class="hniois-search-data">
                    <option value="">请选择</option>
                    <option value="0">通过</option>
                    <option value="1">不通过</option>
            </select>
        </div>
    </div>
    <input type="hidden" name="approver" value="${apply.approver}">
    <input type="hidden" name="approve_time" value="${apply.approve_time}">
    <div class="layui-form-item" style="text-align: center;" id="form-button" >
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
        //init();
        //initStatus();
    });


    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "apply/update.do";
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
    //审批状态
    <%--function initStatus(){--%>
        <%--$("#status").val(${apply.status})--%>
    <%--}--%>

</script>
</html>