<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<form class="layui-form layui-form-pane" action="" style="padding-top: 10px;">
    <input type="hidden" name="details_id" id="key" value="${reportDetail.details_id}">
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">报告编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="record_id" id="record_id" lay-verify="required" lay-search="">
                <option value="" selected></option>
                <c:forEach items="${reports}" var="item">
                    <option value="${item.record_id}" <c:if test="${item.record_id eq reportDetail.record_id}">selected</c:if>>${item.serial_number}</option>
                </c:forEach>
            </select>
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检测项目<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="detection_item" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${reportDetail.detection_item}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">标准要求<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="norm_claim" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${reportDetail.norm_claim}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检验结果<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="detection_result" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${reportDetail.detection_result}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检出限<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="detection_limit" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${reportDetail.detection_limit}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">单项结论</label>
        <div class="layui-input-block">
            <input name="only_verdict" class="layui-input" type="text" autocomplete="off"
                   value="${reportDetail.only_verdict}">
        </div>
    <%--</div>--%>
    <div class="layui-form-item" style="text-align: center;margin-top: 30px;">
        <c:if test="${reportDetail.code == 1}">
        <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button">保存</button>
        </c:if>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    // $(document).ready(function() {
    //     initRole();
    // });
    //layui模块加载 order-2
    layui.use(['layer', 'form' ,'laydate'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "reportDetail/" + ($("#key").val()==""?"add":"update") + ".do";
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

    //关闭
    function closeWin(){
        parent.layer.close(index);
    }

    <%--//初始化报告编号下拉--%>
    <%--function initRole(){--%>
        <%--$.ajax({--%>
            <%--url: 'report/findList.do?status=1',--%>
            <%--data: {},--%>
            <%--type: "post",--%>
            <%--dataType:'json',--%>
            <%--success: function(result){--%>
                <%--var options = "<option value=''></option>";--%>
                <%--for(var i = 0;i < result.length;i++){--%>
                    <%--options+= "<option value='" + result[i].record_id + "'>" + result[i].serial_number + "</option>";--%>
                <%--}--%>
                <%--$("#record_id").html(options);--%>
                <%--$("#record_id").val("${reportDetail.record_id}");--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
</script>
</html>