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
        <input type="hidden" name="id" id="key" value="${repertory.id}">
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">库存类别<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="category" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.category}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">库存名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">计量单位<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="unit" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.unit}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">库存数量<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="stock" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.stock}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">存储位置<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="storage" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.storage}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">预警值</label>
            <div class="layui-input-block">
                <input name="warning" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.warning}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input name="specification" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.specification}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">生产厂家</label>
            <div class="layui-input-block">
                <input name="provenance" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${repertory.provenance}">
            </div>
        <%--</div>--%>
        <div class="layui-form-item" style="text-align: center; margin-top: 30px;">
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