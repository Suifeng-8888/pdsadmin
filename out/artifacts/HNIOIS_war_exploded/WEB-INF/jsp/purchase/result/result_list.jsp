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
    <title>采购结果列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="result/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
    <div class="hniois-table-header">
        <div class="hniois-search-btns">
            <c:if test="${fn:contains(QX,'result/delete')}">
            <a id="hniois-deletes" onclick="doDeletes()" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
                <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i> 批量删除</a>
            </c:if>
        </div>
        <div class="hniois-search-inputs">
            <div class="hniois-search-keyword">
                <input type="text" class="layui-input hniois-search-data" name="pur_batch" placeholder="采购批次号.." />
                <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                    <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
            </div>
            <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
        </div>
    </div>
    <div class="hniois-search-mored layui-anim layui-anim-upbit">
        <div class="hniois-search-body">
            <div class="layui-form-item">
                <label class="layui-form-label">采购人</label>
                <div class="layui-input-block">
                    <input type="text" name="buyer" autocomplete="off" class="layui-input hniois-search-data">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">采购状态</label>
                <div class="layui-input-block">
                    <select name="status"  lay-search="" class="hniois-search-data">
                        <option value="">请选择</option>
                        <option value="0">待采购</option>
                        <option value="1">已采购</option>
                        <option value="2">作废</option>
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
    <c:if test="${fn:contains(QX,'result/update')}">
        <a class="layui-btn layui-btn-xs" lay-event="edit">&nbsp&nbsp编&nbsp&nbsp辑&nbsp&nbsp</a>
    </c:if>
</script>
<script type="text/html" id="editBar2">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看</a>
    <c:if test="${fn:contains(QX,'result/delete')}">
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">&nbsp&nbsp删&nbsp&nbsp除&nbsp&nbsp</a>
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
            url:'result/list.do',
            cols: [[
                {type:'checkbox'},
               // {field:'id',  title:'序号',sort: true},
                {field:'pur_batch',  title: '采购批次'},
                {field:'pro_name', title: '产品名称'},
                {field:'buyer',  title: '采购人',edit:'text'},
                {field:'pur_num', title: '采购数量'},
                {field:'price',  title: '采购价格'},
                {field:'status',  title: '采购状态',templet:function(d){
                        var str=d.status;
                        if(str=="作废"){
                            str =  "<span style='color:red'>作废</span>";
                        }else if(str=="已采购"){
                            str =  "<span style='color:blue'>已采购</span>";
                        }else{
                            str =  "<span style='color:indigo'>待采购</span>";
                        }
                        return str;
                    }},
                {fixed: 'right', align:'center',templet:function (d) {
                        var str = "";
                        if(d.status=="作废"){
                            str=$('#editBar2').html();
                        }else{
                            str=$('#editBar').html();
                        }
                        return str
                    }}
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
            if("${QX}".indexOf("inquiry/update")!=-1){
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
            //记录
            console.log("data.field:"+JSON.stringify(data.field))
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
            title : "采购信息表",
            type: 2,
            offset: 't',
            maxmin: true,
            skin: 'layui-layer-rim', //加边框
            content: "result/toEdit.do?id="+id+"&code="+code,
            area: ['650px', '80%']
        });
    }


    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "result/update.do",
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
            url: 'result/delete.do',
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
                url: 'result/deletes.do',
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
</html>