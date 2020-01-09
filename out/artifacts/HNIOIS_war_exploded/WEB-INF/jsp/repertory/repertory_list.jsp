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
                <c:if test="${fn:contains(QX,'repertory/save')}">
                    <a onclick="inRepertory()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                        <i class="fa fa-level-up fa-lg" aria-hidden="true"></i>&nbsp;新增入库</a>
                    <a onclick="upRepertory()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                        <i class="fa fa-level-up fa-lg" aria-hidden="true"></i>&nbsp;更新入库</a>
                </c:if>
                <c:if test="${fn:contains(QX,'repertory/out')}">
                    <a id="hniois-deletes" onclick="outRepertory()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                        <i class="fa fa-level-down fa-lg" aria-hidden="true"></i>&nbsp;出库</a>
                </c:if>
                <c:if test="${fn:contains(QX,'repertory/export')}">
                    <a id="hniois-export" onclick="doExport('repertory/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                        <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
                </c:if>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="name" placeholder="搜索库存信息名称.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i>查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">储存位置</label>
                    <div class="layui-input-block">
                        <input type="text" name="storage" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">类别</label>
                    <div class="layui-input-block">
                        <select name="category" class="hniois-search-data">
                            <option value=""></option>
                            <c:forEach var="item" items="${repertorys}">
                                <option value="${item.category}">${item.category}</option>
                            </c:forEach>
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
<script src="static/DataTableExtend/DataTableExtend.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    var layer;
    $(document).ready(function() {
        var table = layui.table;
        var form = layui.form;
        layer = layui.layer;
        data_table = table.render({
            elem: '#table',
            url:'repertory/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'id', title:'ID',sort:true},
                {field:'category', title: '类别'},
                {field:'name', title: '名称'},
                {field:'unit', title: '计量单位'},
                {field:'stock', title: '库存数量'},
                {field:'storage', title: '存储位置'},
                {field:'warning', title: '预警值'},
                {field:'specification', title: '规格'},
                {field:'provenance', title: '生产厂家'},
                {fixed: 'right',align:'center',toolbar: '#editBar'}
            ]],
            done: function () {// 表格渲染完成之后的回调
                LayUIDataTable.SetJqueryObj($);// 第一步：设置jQuery对象
                var currentRowDataList = LayUIDataTable.ParseDataTable(function (index, currentData, rowData) {
                });
                // 对相关数据进行判断处理
                $.each(currentRowDataList, function (index, obj) {
                    /*
                     通过遍历表格集合，拿到每行数据对象obj，通过obj["列名"]["row"]可以拿到行对象，obj["列名"]["cell"]可以拿到单元格对象
                    */
                    if (parseInt(obj['stock'].value)<=parseInt(obj['warning'].value)) {
                        obj['stock'].row.css("background-color", "#ff833c");// 对行（row）进行高亮显示
                    }
                })
            },
            height: 'full-150', cellMinWidth: 60,page: true
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

    //执行重载 表单查询
    function formReload() {
        var param = getSearchData();
        data_table.reload({
            where: param
        });
    }

    //  库存详情查看
    function lookDetail(id) {
        layer.open({
            title : "库存详情信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "repertory/look.do?id="+id,
            area: ['650px', '80%']
        });
    }

    // 新增入库
    function inRepertory() {
        layer.open({
            title: "新增入库",
            type: 2,
            offset: "t",
            maxmin: true,
            skin: "layui-layer-rim",
            content: "repertory/inOrOut.do?sort=1",
            area: ['650px', '80%']
        });
    }

    //  更新入库
    function upRepertory() {
        var d = layui.table.checkStatus('table');
        var data = d.data;
        if (data.length === 0) {
            layui.layer.msg('请选择要操作的数据');
            return;
        }
        if (data.length > 1) {
            layui.layer.msg('请选择一条数据进行操作');
            return;
        }
        var id = data[0].id;
        layer.open({
            title: "更新入库",
            type: 2,
            offset: "t",
            maxmin: true,
            skin: "layui-layer-rim",
            content: "repertory/inOrOut.do?sort=2&id=" + id,
            area: ['650px', '80%']
        });
    }

    //  出库
    function outRepertory() {
        var d = layui.table.checkStatus('table');
        var data = d.data;
        if (data.length === 0) {
            layui.layer.msg('请选择要操作的数据');
            return;
        }
        if (data.length > 1) {
            layui.layer.msg('请选择一条数据进行操作');
            return;
        }
        var id = data[0].id;
        layer.open({
            title: "出库登记",
            type: 2,
            offset: "t",
            maxmin: true,
            skin: "layui-layer-rim",
            content: "repertory/inOrOut.do?sort=3&id=" + id,
            area: ['650px', '80%']
        });
    }
</script>
</html>