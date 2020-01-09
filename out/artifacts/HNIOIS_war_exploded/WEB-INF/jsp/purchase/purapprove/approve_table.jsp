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
    <title>问价情况</title>
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

<div class="hniois-search-btns">
        <a id="hniois-add" onclick="sendMsg()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
            <i class="fa fa-lg" aria-hidden="true"></i> 确定</a>
        <a id="hniois-deletes" onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
            <i class="fa fa-lg" aria-hidden="true"></i> 关闭</a>
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
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
            elem: '#table',
            url:'provide/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'sup_id',title: '供应商ID', align:'center', width: 100},
                {field:'name',title: '供应商名字', align:'center', width: 150},
                {field:'address',title: '供应商地址', align:'center', width: 250},
                {field:'temp_price',title: '价格',edit:'text', width: 100},
                //{fixed: 'right', width: 165, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-100', cellMinWidth: 30,page: true
        });


        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
                var field = obj.field , //得到字段
                    value = obj.value ,//得到修改后的值
                    data = obj.data ;//得到所在行所有键值
                var obj = new Object();
                obj.id = data.id;
                obj[field] = value;
                //修改数据
                doEdit(obj);
        });
    });

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "provide/update.do",
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });
    }

    //给父页面传值
     function sendMsg(){
         var d = layui.table.checkStatus('table');
         if (d.data.length === 0) {
             layui.layer.msg('请选择供应商');
             return;
         }
         var data = d.data,
             supply_names=[],
             prices=[],
             ids = [];

         for(var i=0;i<data.length;i++){
             ids.push(data[i].sup_id);
             supply_names.push(data[i].name);
             prices.push(data[i].temp_price);
         }
        parent.$('#test').val(supply_names.toString());
         parent.$('#provide').val(ids.toString());
         parent.$('#pre').val(prices.toString());
         closeWin();
    };

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

</script>
</html>
