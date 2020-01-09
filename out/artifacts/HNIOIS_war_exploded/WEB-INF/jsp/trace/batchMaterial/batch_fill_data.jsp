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
    <title>产品批次信息追溯数据</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<%--任务栏--%>
<div >
    <%--<div class="hniois-table-head" >--%>
    <form  method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <input type="hidden" name="data_list_id" id="list_id"  value="${batch_material.pro_code}">
            <div > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp生产批次信息详情&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a  onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                    返回</a>
            </div>

            <table class="layui-table">
                <tr><td>生产记录号:</td><td><input type="text" class="layui-input layui-table-edit" name="record_num" value="${batch_material.record_num}"></td><td>生产批次号:</td><td><input type="text" name="batch" class="layui-input layui-table-edit" value="${batch_material.batch}"></td></tr>
                <tr><td>商品条码:</td><td><input type="text" class="layui-input layui-table-edit" name="pro_code" value="${batch_material.pro_code}"></td><td>商品名称:</td><td><input type="text" name="pro_name" class="layui-input layui-table-edit" value="${batch_material.pro_name}"></td></tr>
                <tr><td>加工数量:</td><td><input type="text" class="layui-input layui-table-edit" name="batch_num" value="${batch_material.batch_num}"></td><td>加工时间:</td><td><input type="text" name="btime" class="layui-input layui-table-edit" value="${batch_material.btime}"></td></tr>
            </table>
    </form>
   <%-- </div>--%>
    <div class="hniois-search-inputs" style="display: none">
        <div class="hniois-search-keyword">
            <input type="hidden" class="hniois-search-data"  name="page_id" id="ids">
        </div>
    </div>
</div>
<div class="layui-row">
    <div class="layui-col-xs3">
        <%--z-Tree--%>
        <div class="zTreeDemoBackground left">
            <ul id="depts" class="ztree"></ul>
        </div>
    </div>
    <div class="layui-col-xs9">
        <div class="hniois-search-inputs">
            <a id="hniois-add" onclick="toEdit('',${batch_material.batch_id})" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
                <i class="fa fa-plus fa-lg" aria-hidden="true"></i> 新增</a>
        </div>
        <%--查询表格--%>
        <table class="layui-hide" id="table" lay-filter="lay_table">

        </table>
    </div>
</div>
<%--编辑--%>
<script type="text/html" id="editBar">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
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
            url:'tdata/list.do?batch_id='+${batch_material.batch_id},
            cols: [[
                {type:'checkbox'},
                {field:'dat_id',  title:'序号',width:100},
                {field:'attach_id',  title:'材料编号',width:150},
                {field:'fill_time', title: '记录时间',width:150},
                {field:'bz',  title: '详情',edit:'text'},
                {fixed: 'right',title:'操作', width: 170, align:'center', toolbar: '#editBar'}
            ]],
            /*done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //得到当前页码 curr 数据总量count
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                var d=res.data;
                alert(d[0].bz);
            },*/
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit1(data.attach_id,0)
            }  else if(layEvent === 'edit'){
                toEdit(data.dat_id,"${batch_material.batch_id}")
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.dat_id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
                var field = obj.field , //得到字段
                    value = obj.value ,//得到修改后的值
                    data = obj.data ;//得到所在行所有键值
                var obj = new Object();
                obj.dat_id = data.dat_id;
                obj[field] = value;
                //修改数据
                doEdit(obj);
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
            title : "批次用原材料",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "tdata/toEdit.do?dat_id="+id+"&batch_id="+code,
            area: ['650px', '80%']
        });
    }

    //查看进货详情
    function toEdit1(id,code){
        var layer = layui.layer ;
        layer.open({
            title : "批次用原材料",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "zsImport/toEdit.do?im_id="+id+"&code="+code,
            area: ['650px', '80%']
        });
    }

    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "tdata/update.do",
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
            url: 'tdata/delete.do',
            data: {
                dat_id:id
            },
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });

    }

</script>
<%-- Z-Tree控件 --%>
<script type="text/javascript">

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
            url: 'pack/findList.do',
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
        if(treeNode.id==11){
            $("#ids").val();
        }else if(treeNode.id==12){
            $("#ids").val("15,16,17,18");
        }
        else if(treeNode.id==13){
            $("#ids").val("14");
        }else{
            $("#ids").val(treeNode.id);
        }
        //表单刷新
        formReload();
        //重置条件
        $("#ids").val("");
    }

    //-->
    //关闭页面
    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }


</script>
</html>