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
    <title>导出管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="excel/doExport.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <a id="hniois-export" onclick="doExport()" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                    <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                    &nbsp;&nbsp;
                    <input name="excelType" title="excel_2003.xls" type="radio" value="2003" checked>
                    <input name="excelType" title="excel_2007.xlsx" type="radio" value="2007">
            </div>
            <div class="hniois-search-inputs">
            </div>
        </div>

    </form>
</div>
<%--查询表格--%>
<table class="layui-hide" id="table" lay-filter="lay_table">

</table>

<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>

<div style="display: none" id="showSearch">
    ${demo.showSearch}
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
        data_table = table.render({
            elem: '#table',
            url:'excel/list.do',
            cols: [[
                {type:'checkbox',LAY_CHECKED:true},
                {field:'order', title: '排序',edit:'text',sort:true,width:100},
                {field:'comment',  title: '列名',edit:'text'},
                {field:'name',  title: '列'},
                {fixed: 'right', align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-200', cellMinWidth: 60
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.tr //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            if(obj.field == "order"){
                var pi = $(".layui-table>thead>tr>th[data-field='order'] i[class='layui-edge layui-table-sort-asc']");
                pi.parent().attr("lay-sort","desc").click();
                pi.click();
            }
        });

    });

    //执行导出
    function doExport(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择要导出的列');
            return;
        }
        var url = "${demo.url}";
        var param = JSON.parse($("#showSearch").html());
        $.ajax({
            url: 'excel/doExport.do',
            data: {
                showlist:JSON.stringify(d.data),
                check:$("input[name='excelType']:checked").val()
            },
            type: "post",
            dataType:'json',
            success: function(data){
                top._tools.doExcel(url,param);
            }
        });

    }

</script>
</html>