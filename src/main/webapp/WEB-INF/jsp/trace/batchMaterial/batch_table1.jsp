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
    <title>生产记录管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name lay-filter="sea="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
<%--任务栏--%>
<div class="hniois-table">
    <form action="pro_record/list.do" method="post" class="layui-form hniois-search-form" id="hniois-search-form">
        <div class="hniois-table-header">
            <div class="hniois-search-inputs">
                <div class="hniois-search-keyword">
                    <input type="text" class="layui-input hniois-search-data" name="pro_name" placeholder="按产品名搜.." />
                    <button class="layui-btn layui-btn-sm" lay-submitrch">
                        <i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
                <div class="hniois-search-more" id="hniois-search-more">更多筛选<i class="layui-icon">&#xe61a;</i></div>
            </div>
        </div>
        <div class="hniois-search-mored layui-anim layui-anim-upbit">
            <div class="hniois-search-body">
                <div class="layui-form-item">
                    <label class="layui-form-label">生产记录号</label>
                    <div class="layui-input-block">
                        <input type="text" name="rec_num" autocomplete="off" class="layui-input hniois-search-data">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">生产日期</label>
                    <div class="layui-input-block">
                        <input name="st_time" class="layui-input hniois-search-data" type="text" autocomplete="off"
                               id="test1"  placeholder="yyyy-MM-dd" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">结束日期</label>
                    <div class="layui-input-block">
                        <input name="end_time" class="layui-input hniois-search-data" type="text" autocomplete="off"
                               id="test2"  placeholder="yyyy-MM-dd" >
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
        var laydate=layui.laydate;
        data_table = table.render({
            elem: '#table',
            url:'pro_record/list.do',
            cols: [[
                {type:'checkbox'},
                {field:'rec_id',  title:'序号'},
                {field:'rec_num', title: '记录号',edit:'text',align:"center"},
                {field:'pro_name',  title: '产品名称',align:"center"},
                {field:'pro_code', title: '产品条码',align:"center"},
                {field:'patch_num', title: '批次数',align:"center"},
            ]],
            height: 'full-150', cellMinWidth: 60,page: true
        });

        //监听工具条
        table.on('tool(lay_table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                toEdit(data.rec_id,0)
            }  else if(layEvent === 'edit'){
                toEdit(data.rec_id,1)
            }else if(layEvent === 'del'){
                layer.confirm('确认删除么', function(index){
                    layer.close(index);
                    obj.del(); //删除对应行（tr）的DOM结构
                    //向服务端发送删除指令
                    doDelete(data.rec_id);
                });
            }
        });

        //监听单元格编辑
        table.on('edit(lay_table)', function(obj){
            if("${QX}".indexOf("pro_record/update")!=-1){
            var field = obj.field , //得到字段
                value = obj.value ,//得到修改后的值
                data = obj.data ;//得到所在行所有键值
            var obj = new Object();
            obj.rec_id = data.rec_id;
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


    //表格编辑 修改数据
    function doEdit(obj){
        $.ajax({
            url: "pro_record/update.do",
            data: obj,
            type: "post",
            dataType:'json',
            success: function(data){
                layui.layer.msg(data.msg);
            }
        });
    }

    //给父页面传值
    function sendMsg(){
        var d = layui.table.checkStatus('table');
        if (d.data.length === 0) {
            layui.layer.msg('请选择产品');
            return;
        }
        if (d.data.length >1) {
            layui.layer.msg('请选择1个产品记录');
            return;
        }
        var data = d.data,
            ids=[],
            rec_nums=[],
            names=[];

        for(var i=0;i<data.length;i++){
            names.push(data[i].pro_name);
            ids.push(data[i].rec_id);
            rec_nums.push(data[i].rec_num);
        }
        parent.$('#pro_name').val(names.toString());
        parent.$('#rec_id').val(ids.toString());
        parent.$('#test').val(rec_nums.toString());
        /*parent.layer.tips('Look here', '#test', {time: 5000});*/
        closeWin();
    };

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }


</script>
</html>