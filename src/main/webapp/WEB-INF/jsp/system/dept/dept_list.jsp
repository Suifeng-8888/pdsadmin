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
    <title>部门管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="dept/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-btns">
                <c:if test="${fn:contains(QX,'dept/add')}">
                    <a id="hniois-add" onclick="toEdit('',1)" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                        <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
                </c:if>
                <c:if test="${fn:contains(QX,'dept/update')}">
                    <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                        <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
                </c:if>
            </div>
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="hidden" class="hniois-search-data"  name="ids" id="ids">
                    <input type="text" class="layui-input hniois-search-data" name="name" placeholder="搜索部门名称.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">部门编码</label>
                    <div class="layui-input-block">
                        <input type="text" name="theID" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <input type="text" name="bz" autocomplete="off" class="layui-input hniois-search-data">
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
<div class="layui-row">
    <div class="layui-col-xs3">
        <%--z-Tree--%>
        <div class="zTreeDemoBackground left">
            <ul id="depts" class="ztree"></ul>
        </div>
    </div>
    <div class="layui-col-xs9">
        <%--查询表格--%>
        <table class="layui-hide" id="table" lay-filter="lay_table">

        </table>
    </div>
</div>
<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看</a>
    <c:if test="${fn:contains(QX,'dept/update')}">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </c:if>
    <c:if test="${fn:contains(QX,'dept/update')}">
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </c:if>
</script>
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script type="text/javascript" src="static/zTree/js/jquery.ztree.core.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
            elem: '#table',
            url:'dept/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'theID',  title:'编码',width:120,edit:'text'},
                {field:'name', title: '名称',edit:'text'},
                {field:'bz',  title: '备注',edit:'text'},
                {field:'username', title: '领导'},
                {field:'pname', title: '上级部门'},
                {fixed: 'right', width: 165, align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit(data.id,0)
            }  else if(layEvent === 'edit'){
                toEdit(data.id,1)
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            if("${fn:contains(QX,'dept/update')}"=="true"){
                var field = obj.field , //得到字段
                    value = obj.value ,//得到修改后的值
                    data = obj.data ;//得到所在行所有键值
                var obj = new Object();
                obj.id = data.id;
                obj[field] = value;
                //修改数据
                doEdit(obj);
            }else{
                layer.msg("无修改权限")
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

    //修改弹窗
    function toEdit(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "部门信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "dept/toEdit.do?id="+id+"&code="+code,
            area: ['650px', '80%']
        });
    }

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "dept/update.do",
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });
    }

    //单个删除
    function doDelete(id){
        $.ajax({
            url: 'dept/delete.do',
            data: {
                id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
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
                url: 'dept/deletes.do',
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

</script>
<%-- Z-Tree控件 --%>
<script type="text/javascript">
    <!--
    var setting = {
        check: {
            enable: true,
            chkboxType: { "Y" : "ps", "N" : "ps" }
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: onClickTree
        }
    };

    //z-Tree 初始化
    $(function(){
        $.ajax({
            url: 'dept/findList.do',
            data: {

            },
            type: "post",
            dataType:'json',
            success: function(data){
                var obj = new Array();
                for(var i=0;i<data.length;i++){
                    obj[i] = new Object();
                    obj[i].id = data[i].id;
                    obj[i].pId = data[i].pId;
                    obj[i].name = data[i].name;
                    obj[i].open = true ;
                }
                $.fn.zTree.init($("#depts"), setting, obj);
            }
        });
    });

    //菜单点击事件
    function onClickTree(event, treeId, treeNode, clickFlag){
        clearSearchData();
        //点击赋值
        $("#ids").val(treeNode.id);
        //表单刷新
        formReload();
        //重置条件
        $("#ids").val("");
    }

    //-->
</script>
</html>