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
<%--任务栏--%>
<div class="hniois-table">
    <form action="statistics/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="serial_number" placeholder="报告编号..." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i>查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">开始时间:</label>
                    <div class="layui-input-block">
                        <input type="text" name="startTime" id="startTime" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">结束时间:</label>
                    <div class="layui-input-block">
                        <input type="text" name="endTime" id="endTime" class="layui-input" />
                    </div>
                </div>
            </div>
            <div class="hniois-search-footer">
                <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary hniois-btn">重置</button>
                <button class="layui-btn layui-btn-sm hniois-btn" lay-submit lay-filter="search" >确定</button>
            </div>
        </div>
    </form>
</div>

<%--文件下载--%>
<div style="display: none" id="download" url="" onclick="fileDownload(this)">下载</div>
<form id="file-form" action="file/download.do" method="post">
    <input name="path" type="hidden">
</form>

<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">
</table>

<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs" lay-event="down">下载</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>

<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>

<script type="application/javascript">

    var data_table; //  数据表格
    $(document).ready(function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        data_table = table.render({
           elem: '#table',
           url: 'statistics/list.do',
            cols: [[
            {type:'checkbox'},
            {field:'id', title:'ID',sort:true, width:80},
            {field:'serial_number', title: '报告编号'},
            {field:'template_name', title: '使用模板'},
            {field:'path', title: '存储位置',width:300},
            {field:'creat_time', title: '生成时间',templet:function (d) {
                    return "" + d.creat_time.substr(0,10);
                }},
            {field:'down_number', title: '下载次数', width:80},
            {fixed: 'right', title: '操作', width: 180, align:'center', toolbar: '#editBar'}
        ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'down'){
                $("#download").attr("url",data.path);
                $("#download").click();
                $.post("statistics/update.do",{"down_number":data.down_number,"id":data.id})
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么?', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.id,data.path);
                });
            }
        });

        //监听搜索表单提交
        form.on('submit(search)', function(data) {
            //带条件查询
            data_table.reload({
                where: data.field
            });
            $('.hniois-search-mored').hide();
            return false;
        });

        laydate.render({
            elem:'#startTime'
        });
        laydate.render({
            elem:'#endTime'
        });
    });

    //更多筛选
    $('#hniois-search-more').on('click', function() {
        $('.hniois-search-mored').toggle();
    });

    //删除
    function doDelete(id, path){
        $.ajax({
            url: 'statistics/delete.do',
            data: {
                id:id,
                path:path
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });
    }

</script>
</body>
</html>

