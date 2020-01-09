<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>

<%--任务表--%>
<div class="hniois-table">
    <form action="user/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <a id="hniois-add" onclick="sendMsg()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                    <i class="fa  fa-lg" aria-hidden="true"></i> 确定</a>
                <a id="hniois-deletes" onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                    <i class="fa  fa-lg" aria-hidden="true"></i> 关闭</a>
            </div>
        </div>
    </form>
</div>
<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>

<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>

<script type="application/javascript">

    var data_table; //  数据表格
    $(document).ready(function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
           elem: '#table',
           url: 'report/list.do?status=2',
            cols: [[
            {type:'checkbox'},
            {field:'record_id', title:'报告ID',sort:true, width:100},
            {field:'serial_number', title: '报告编号',width:120},
            {field:'specimen_name', title: '样品名称'},
            {field:'status', title: '状态',templet: function (d) {
                    if (d.status == "1") {
                        return "未审核";
                    } else if (d.status == "2") {
                        return "已审核";
                    } else if (d.status = "3") {
                        return "已批准";
                    } else {
                        return "";
                    }
                }}
        ]],
            height: 'full-200', cellMinWidth: 60,page: true
        });


    });


    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择对应的报告编号');
            return;
        }
        if (d.data.length > 1) {
            layui.layer.msg('请选择唯一的编号');
            return;
        }
        var data = d.data,
            nums=[];

        for(var i=0;i<data.length;i++){
            nums.push(data[i].record_id);
        }
        parent.$('#test').val(nums.toString());
        /*parent.layer.tips('Look here', '#test', {time: 5000});*/
        closeWin();
    };

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }


</script>
</body>
</html>

