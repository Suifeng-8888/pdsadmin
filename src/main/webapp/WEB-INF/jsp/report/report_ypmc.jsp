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
    <title>样品</title>
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
            url:'item/list.do?checked=1',
            cols: [[
                {type:'checkbox'},
                {field:'item_number', title: '样品编号',align:"center",width:150},
                {field:'item_sort',  title: '样品分类',align:"center",width:150},
                {field:'item_name',  title: '样品名称',align:"center",width:150},
                {field:'norm_id',  title: '标准Id',align:"center",width:150},
                {field:'use_standard',  title: '使用标准',align:"center",width:150},
                {field:'item_state',  title: '样品状态',edit:'text',align:"center",width:150},
                {field:'item_num',  title: '样品数量',edit:'text',align:"center",width:150},
                {field:'send_person',  title: '抽/送样人',align:"center",width:150},
                {field:'send_unit',  title: '抽/送样单位',align:"center",width:150},
                {field:'send_site',  title: '抽/送样地点',align:"center",width:150},
                {field:'send_number',  title: '抽/送样基数',align:"center",width:150},
                {field:'send_time',  title: '抽/送样时间',align:"center",width:150},
                {field:'testing_time',  title: '检测时间',align:"center",width:150},
                {field:'detection_name',  title: '检测人',align:"center",width:150},
                {field:'detection_type',  title: '检测类别',align:"center",width:150}
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
            layui.layer.msg('请选择样品分类');
            return;
        }
        if(data.length > 1) {
            layui.layer.msg('只能选择一个分类');
            return;
        }
        parent.$('#norm_id').val(data[0].norm_id);
        parent.$('#item_number').val(data[0].item_number);
        parent.$('#specimen_name').val(data[0].item_name);
        parent.$('#norm_name').val(data[0].use_standard);
        parent.$('#accept_unit').val(data[0].send_unit);
        parent.$('#detection_type').val(data[0].detection_type);
        parent.$('#production_unit').val(data[0].send_unit);
        parent.$('#sample_status').val(data[0].item_state);
        parent.$('#sampling_site').val(data[0].send_site);
        parent.$('#give_time').val(data[0].send_time);
        parent.$('#specimen_amount').val(data[0].item_num);
        parent.$('#sampling_number').val(data[0].send_number);
        parent.$('#inspect_time').val(data[0].testing_time);
        closeWin();
    }
    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</html>