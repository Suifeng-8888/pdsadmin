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
    <title>进货管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="zsImport/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="pro_name" placeholder="搜索进货名.." />
                    <button class="layui-btn layui-btn-sm" lay-submit lay-filter="search">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">商品条码</label>
                    <div class="layui-input-block">
                        <input type="text" name="bar_code" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">进货批次号</label>
                    <div class="layui-input-block">
                        <input type="text" name="im_patch" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">供应商名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="sup_name" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">验收负责人</label>
                    <div class="layui-input-block">
                        <input type="text" name="recipient" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">验收结论</label>
                    <div class="layui-input-block">
                        <select name="result" id="hniois-role-select" lay-search="" class="hniois-search-data">
                                 <option value="">请选择</option>
                                <option value="0">合格</option>
                                <option value="1">不合格</option>
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

<div class="hniois-search-btns">
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
        var layer = layui.layer;
        var form = layui.form;
        data_table = table.render({
            elem: '#table',
            url:'zsImport/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'im_id', title:'序号',sort: true},
                {field:'pro_name', title: '货物名称',edit:'text'},
                {field:'im_patch', title: '进货批次号',edit:'text'},
                {field:'sup_name', title:'供应商名称'},
                {field:'rest',  title: '是否用完',templet:function(d){
                        var str=d.rest;
                        if(str=="0"){
                            str="<span style='color:red'>已用完</span>";
                        }else if(str=="1"){
                            str="<span style='color:green'>未用完</span>";
                        }
                        return str;
                    }},
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });


        //监听搜索表单提交
        form.on('submit(search)', function(data) {
            //alert(JSON.stringify(data.field));
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

        //初始化设备状况
        //initRoleSelect();
    });

    //执行重载 表单查询
    function formReload() {
        var param = getSearchData();
        data_table.reload({
            where: param
        });
    }

    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择产品');
            return;
        }
        if (d.data.length >= 2) {
            layui.layer.msg('请选择一个产品');
            return;
        }
        if (d.data[0].rest === "0") {
            layui.layer.msg('进货材料已用完');
            return;
        }
        var data = d.data,
            ids=[],
            patchs=[],
            supplies=[],
            names=[];
        for(var i=0;i<data.length;i++){
            names.push(data[i].pro_name);
            ids.push(data[i].im_id);
            supplies.push(data[i].sup_name);
            patchs.push(data[i].im_patch);
        }
        parent.$('#test').val(names.toString());
        parent.$('#att_id').val(ids.toString());
        parent.$('#batch').val(patchs.toString());
        parent.$('#supply').val(supplies.toString());
        /*parent.layer.tips('Look here', '#test', {time: 5000});*/
        closeWin();
    };

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

</script>
</html>