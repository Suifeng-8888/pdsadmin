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
    <title>样品明细表管理</title>
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
        <div class="hniois-search-btns">
            <c:if test="${fn:contains(QX,'item/add')}">
            <a id="hniois-add" onclick="toEdit('',1)" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
            </c:if>
            <c:if test="${fn:contains(QX,'item/delete')}">
            <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
            </c:if>
            <a id="hniois-add" onclick="sendCheck()" class="layui-btn layui-btn-sm layui-bg-green" href="javascript:;">
                <i class="fa fa-share fa-lg" aria-hidden="true"></i>&nbsp;送检</a>
            <%--<c:if test="${fn:contains(QX,'user/export')}">--%>
                <a id="hniois-export" onclick="doExport('item/doExport')" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                    <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i> 导出</a>
            <%--</c:if>--%>
           <%-- <a id="hniois-export" onclick="doBar()" class="layui-btn layui-btn-sm layui-bg-orange" href="javascript:;" >
                <i class="fa fa-cloud-download fa-lg" aria-hidden="true"></i>柱状图</a>--%>
        </div>
        <div class="hniois-search-inputs">
            <div class="hniois-search-keyword">
                <input type="text" class="layui-input hniois-search-data" name="itemname" placeholder="搜索样品名.." />
                <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                    <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
            </div>
            <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
        </div>
    </div>
    <div class="hniois-search-mored layui-anim layui-anim-upbit">
        <div class="hniois-search-body">
            <div class="layui-form-item">
                <label class="layui-form-label">样品ID</label>
                <div class="layui-input-block">
                    <input type="text" name="itemid" autocomplete="off" class="layui-input hniois-search-data">
                </div>
            </div>
            <%--<div class="layui-form-item">
                <label class="layui-form-label">样品描述</label>
                <div class="layui-input-block">
                    <input type="text" name="describe" autocomplete="off" class="layui-input hniois-search-data">
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">样品种类</label>
                <div class="layui-input-block">
                    <select name="typeid" id="hniois-role-select" lay-search="" class="hniois-search-data">

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
    <c:if test="${fn:contains(QX,'item/update')}">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </c:if>
    <c:if test="${fn:contains(QX,'item/delete')}">
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
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
            url:'item/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'id',  title:'序号',sort: true},
               // {field:'itemid', title: '样品编号',sort:true},
                {field:'itemname',  title: '样品名称',edit:'text'},
                {field:'typename',  title: '样品分类'},
                {field:'sender',  title: '送样单位',edit:'text'},
                {field:'describe',  title: '样品描述',edit:'text'},
                {field:'checked',  title: '是否已送检'},
                {field:'state', title: '状态',templet:function(d){
                        var str = '<input type="checkbox" name="lock" value="'+d.id+'"' +
                            ' title="启用" lay-filter="lay_state" ' +(d.state == "0"?"checked":"") + ' >';
                        return str + "";
                    }
                },
                {fixed: 'right', align:'center', toolbar: '#editBar'}
            ]],
            height: 'full-200', cellMinWidth: 60,page: true
        });

        //监听锁定操作
        form.on('checkbox(lay_state)', function(obj){
            $.ajax({
                url: 'item/update.do',
                data: {
                    id:this.value,
                    state:obj.elem.checked?"0":"1"
                },
                type: "post",
                dataType:'json',
                success: function(data){
                    layer.msg(data.msg);
                }
            });
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
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            if("${QX}".indexOf("item/update")!=-1){
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

        //初始化样品种类下拉
        initCateSelect();
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
            title : "样品信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "item/toEdit.do?id="+id+"&code="+code,
            area: ['650px', '80%']
        });
    }

    //送检弹窗
    function sendCheck(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择要送检的数据');
            return;
        }
        var data = d.data,
            ids = [];
        //送人 结果 时间 <input hidden
        //$ajax param  data d.data
        for(var i=0;i<data.length;i++){
            if(data[i].checked=="已送检"){
                layui.layer.msg('选择的第'+(i+1)+'个数据已经送检过,请重新选择');
                return;
            }
            ids.push(data[i].id);
        }
        layui.layer.open({
            title : "送检信息",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "item/sendCheck.do?data="+ids.toString(),
            area: ['650px', '80%']
        })
    }

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "item/update.do",
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
            url: 'item/delete.do',
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
                url: 'item/deletes.do',
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

    //柱状图
    /*function doBar(){
        // var layer = layui.layer ;
       $.ajax({
           url: 'item/pie.do',
           type: "post",
           dataType:'json',
           success: function(data){
               layui.layer.msg(data.msg);
           }
        });
    }*/
</script>
</html>