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
    <form action="user/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <c:if test="${fn:contains(QX,'putRecord/export')}">
                    <a id="hniois-export" onclick="doExport('putRecord/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                        <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                </c:if>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="odd_number" placeholder="搜索出入库单号.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i>查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">出库时间</label>
                    <div class="layui-input-block">
                        <input class="layui-input" id="time" name="time" placeholder="yyyy-MM-dd" type="text">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">类别</label>
                    <div class="layui-input-block">
                        <select name="record_type" class="hniois-search-data">
                            <option value=""></option>
                            <option value="1">新增入库</option>
                            <option value="2">更新入库</option>
                            <option value="3">出库</option>
                        </select>
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

<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>
<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看</a>
</script>
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        var form = layui.form;
        var laydate = layui.laydate;
        data_table = table.render({
            elem: '#table',
            url:'putRecord/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'id', title:'记录ID', sort: true, width: 100},
                {field:'odd_number', title: '出入库单号'},
                {field:'record_type', title: '记录类别',templet: function (d) {
                    if (d.record_type == "1") {
                        return "新增入库";
                    } else if (d.record_type == "2") {
                        return "更新入库";
                    } else if (d.record_type == "3") {
                        return "出库";
                    }
                 }},
                {field:'type', title: '物品类别'},
                {field:'name', title: '物品名称'},
                {field:'number', title: '数量'},
                {field:'time', title: '时间'},
                {fixed: 'right',align:'center',toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        // 日期插件
        laydate.render({
            elem: '#time'
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                lookDetail(data.id);
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

        //更多筛选
        $('#hniois-search-more').on('click', function() {
            $('.hniois-search-mored').toggle();
        });
    });

    //  出入记录详情查看
    function lookDetail(id) {
        var layer = layui.layer ;
        layer.open({
            title : "出入库记录详情信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "putRecord/look.do?id="+id,
            area: ['650px', '80%']
        });
    }
</script>
</html>