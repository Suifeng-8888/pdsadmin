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
    <title>使用标准</title>
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
            url:'report/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'serial_number', title: '报告编号',align:"center",width:150},
                {field:'specimen_name', title: '样品名称',align:"center",width:150},
                {field:'test_standard', title: '检测标准',align:"center",width:150},
                {field:'accept_unit', title: '受检单位',align:"center",width:150},
                {field:'inspect_time', title: '检验日期',align:"center",width:150},
                {field:'status', title: '状态',align:"center",width:150,templet: function (d) {
                        if (d.status == "1") {
                            return "<em style='color: #FF5722'>未审核</em>";
                        } else if (d.status == "2") {
                            return "<em style='color: #5FB878'>已审核</em>";
                        } else if (d.status = "3") {
                            return "<em style='color: #5FB878'>已批准</em>";
                        } else {
                            return "";
                        }
                    }}
            ]],
            height: 'full-60',
            cellMinWidth: 60,
            page: true
        });
    });

    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        var data = d.data;
        if (data.length === 0) {
            layui.layer.msg('请选择检测报告');
            return;
        }
        if(data.length > 1) {
            layui.layer.msg('只能选择一个检测报告');
            return;
        }
        parent.$('#serial_number').val(data[0].serial_number);
        closeWin();
    }
    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</html>