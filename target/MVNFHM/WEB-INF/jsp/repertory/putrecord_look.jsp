<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <input type="hidden" name="id" id="key" value="${putRecord.id}">
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">记录类别<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <c:if test="${putRecord.record_type == '1'}">
                    <input name="record_type" class="layui-input" type="text" autocomplete="off"
                           lay-verify="required" value="新增入库">
                </c:if>
                <c:if test="${putRecord.record_type == '2'}">
                    <input name="record_type" class="layui-input" type="text" autocomplete="off"
                           lay-verify="required" value="更新入库">
                </c:if>
                <c:if test="${putRecord.record_type == '3'}">
                    <input name="record_type" class="layui-input" type="text" autocomplete="off"
                           lay-verify="required" value="出库">
                </c:if>
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">记录编号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="odd_number" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.odd_number}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">采购单号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="order_number" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.order_number}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">物品类别<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="type" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.type}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">物品名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">领用人</label>
            <div class="layui-input-block">
                <input name="get_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.get_name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">计量单位</label>
            <div class="layui-input-block">
                <input name="unit" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.unit}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">出入库数量</label>
            <div class="layui-input-block">
                <input name="number" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.number}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">出入库时间</label>
            <div class="layui-input-block">
                <input name="time" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.time}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">经办人</label>
            <div class="layui-input-block">
                <input name="operator" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.operator}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">备注信息</label>
            <div class="layui-input-block">
                <input name="bz" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${putRecord.bz}">
            </div>
        <%--</div>--%>
        <div class="layui-form-item" style="text-align: center;margin-top: 30px;">
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    function closeWin() {
        parent.layer.close(index);
    }
</script>
</html>