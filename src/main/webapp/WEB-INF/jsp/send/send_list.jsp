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
    <title>送检样品列表管理</title>
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
            <c:if test="${fn:contains(QX,'send/delete')}">
            <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
            </c:if>
            <c:if test="${fn:contains(QX,'send/update')}">
                <a id="hniois-add" onclick="toRecord()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                    <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 录入检测结果</a>
            </c:if>
        </div>
        <div class="hniois-search-inputs">
            <div class="hniois-search-keyword">
                <input type="text" class="layui-input hniois-search-data" name="item_name" placeholder="请输入样品名.." />
                <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                    <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
            </div>
            <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
        </div>
    </div>
    <div class="hniois-search-mored layui-anim layui-anim-upbit">
        <div class="hniois-search-body">
            <div class="layui-form-item">
                <label class="layui-form-label">样品编号</label>
                <div class="layui-input-block">
                    <input type="text" name="item_number" autocomplete="off" class="layui-input hniois-search-data">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">检测结果</label>
                <div class="layui-input-block">
                    <select name="test_results">
                        <option value=""></option>
                        <option value="1">合格</option>
                        <option value="0">不合格</option>
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
    <c:if test="${fn:contains(QX,'send/delete')}">
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del" id="del" >删除</a>
    </c:if>
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
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
            elem: '#table',
            url:'send/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'id', title: 'ID',sort:true},
                {field:'item_number',  title: '样品编号'},
                {field:'item_name',  title: '样品名称'},
                {field:'serial_number',  title: '检测报告编号'},
                {field:'test_results',  title: '检测结果',templet: function (d){
                        if (d.test_results == "0") {
                            return "<em style='color: #FF5722'>不合格</em>";
                        } else if (d.test_results == "1") {
                            return "<em style='color: #5FB878'>合格</em>";
                        } else {
                            return "";
                        }
                    }},
                {fixed: 'right', width: 180, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-250', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                if(data.serial_number === "") {
                    layui.layer.msg('未录入检测报告!');
                    return;
                }
                look(data.serial_number);
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.id);
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

        //更多筛选
        $('#hniois-search-more').on('click', function() {
            $('.hniois-search-mored').toggle();
        });

    });

    //执行重载 表单查询
    function formReload() {
        var param = getSearchData();
        data_table.reload({
            where: param
        });
    }

    //录入检测结果
    function toRecord(){
        var layer = layui.layer ;
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择要录入的数据');
            return;
        }
        if (d.data[0].test_results ===0||d.data[0].test_results ===1) {
            layui.layer.msg('数据已录入检测结果');
            return;
        }
        if (d.data.length > 1) {
            layui.layer.msg('每次选择一个要录入的数据');
            return;
        }
        layer.open({
            title : "送检样品信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "send/toEdit.do?id="+d.data[0].id,
            area: ['650px', '80%']
        });
    }

    //单个删除
    function doDelete(id){
        $.ajax({
            url: 'send/delete.do',
            data: {
                id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
                formReload();
            }
        });
    }

    //批量删除
    function doDeletes(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择要删除的数据');
            return;
        }
        var data = d.data,
            ids = [];
        for(var i=0;i<data.length;i++){
            ids.push(data[i].id);
        }
        layui.layer.confirm('确认删除', function(index){
            $.ajax({
                url: 'send/deletes.do',
                data: {
                    data:ids.toString()
                },
                type: "post",
                dataType:'json',
                success: function(data){
                    layui.layer.close(index);
                    layui.layer.msg(data.msg);
                    formReload();
                }
            });
        });
    }
    function look(number) {
        var layer = layui.layer ;
        layer.open({
            title : "检测报告信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "report/toEdit.do?serial_number=" + number,
            area: ['650px', '80%']
        });
    }
</script>
</html>