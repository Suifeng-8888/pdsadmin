<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>周统计数据</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="item/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
    <div class="hniois-table-header">
        <div class="hniois-search-inputs">
            <div class="hniois-search-keyword">
                <input type="text" class="layui-input hniois-search-data" name="endTime" id="dtime" placeholder="选择截止日期" />
                <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                    <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
            </div>
           <%-- <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>--%>
        </div>
    </div>
    </form>
</div>

<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>

<%--编辑--%>
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        var layer = layui.layer;
        var laydate=layui.laydate;
        var form = layui.form;

        //日期
        laydate.render({
            elem:"#dtime"
        });

        data_table = table.render({
            elem: '#table',
            url: 'summary/weeklist.do',
            cols: [[
                {field:'temp', title:'日期'},
                {field:'create_time', title:'星期'},
                {field:'num', title: '报告数'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });


        //监听搜索表单提交
        form.on('submit(search)', function(data) {
            //带条件查询
            data_table.reload({
                where: data.field
            });
            return false;
        });

    });


</script>
</html>