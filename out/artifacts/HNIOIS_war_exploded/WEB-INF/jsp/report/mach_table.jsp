<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>仪器列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>


<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>
<div class="hniois-search-btns" style="margin-left: 40%">
    <a id="hniois-add" onclick="sendMsg()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
        <i class="fa  fa-lg" aria-hidden="true"></i> 确定</a>
    <a id="hniois-deletes" onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
        <i class="fa  fa-lg" aria-hidden="true"></i> 关闭</a>
</div>

</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        data_table = table.render({
            elem: '#table',
            url:'machine/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'mach_name', title: '仪器名称'},
                {field:'model', title: '仪器型号'},
                {field:'mach_id', title: '仪器编号'}
            ]],
            height: 'full-60',
            cellMinWidth: 60,
            page: true
        });
    });

    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择要使用的仪器');
            return;
        }
        var data = d.data,
            names = [],
            models = [],
            mach_id = [];
        for(var i = 0;i < data.length;i++){
            names.push(data[i].mach_name);
            models.push(data[i].model);
            mach_id.push(data[i].mach_id);
        }
        parent.$('#employ_facility').val(names.toString());
        parent.$('#model').val(models.toString());
        parent.$('#mach_id').val(mach_id.toString());
        closeWin();
    }

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</html>